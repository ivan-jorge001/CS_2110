/*
 * CS 2110 Homework 10 Fall 2021
 * Author: Andrew Friedman
 */

#include <stdint.h>

#include <string.h>

#include <stdio.h>

#include "my_malloc.h"

/* Our freelist structure - our freelist is represented as a singly linked list
 * the freelist is sorted by address;
 */
metadata_t * address_list;

/* Set on every invocation of my_malloc()/my_free()/my_realloc()/
 * my_calloc() to indicate success or the type of failure. See
 * the definition of the my_malloc_err enum in my_malloc.h for details.
 * Similar to errno(3).
 */
enum my_malloc_err my_malloc_errno;

// -------------------- PART 1: Helper functions --------------------

/* The following prototypes represent useful helper functions that you may want
 * to use when writing your malloc functions. You do not have to implement them
 * first, but we recommend reading over their documentation and prototypes;
 * having a good idea of the kinds of helpers you can use will make it easier to
 * plan your code.
 *
 * None of these functions will be graded individually. However, implementing
 * and using these will make programming easier. We may provide ungraded test
 * cases for some of these functions after the assignment is released.
 */

/* OPTIONAL HELPER FUNCTION: find_right
 * Given a pointer to a free block, this function searches the freelist for another block to the right of the provided block.
 * If there is a free block that is directly next to the provided block on its right side,
 * then return a pointer to the start of the right-side block.
 * Otherwise, return null.
 * This function may be useful when implementing my_free().
 */
static metadata_t * find_right(metadata_t * freed_block) {
    return ((char * ) freed_block + TOTAL_METADATA_SIZE + freed_block -> size == (char * ) freed_block -> next) ? freed_block -> next : NULL;
}

/* GIVEN HELPER FUNCTION: find_left
 * This function is provided for you by the TAs. You do not need to use it, but it may be helpful to you.
 * This function is the same as find_right, but for the other side of the newly freed block.
 * This function will be useful for my_free(), but it is also useful for my_malloc(), since whenever you sbrk a new block,
 * you need to merge it with the block at the back of the freelist if the blocks are next to each other in memory.
 */

static metadata_t * find_left(metadata_t * freed_block) {
    metadata_t * curr = address_list;
    if (!curr || !(curr -> next)) {
        return NULL;
    }

    while (curr && ((uintptr_t) freed_block > (uintptr_t) curr)) {
        if ((uintptr_t)((uint8_t * )(curr + 1) + curr -> size) == (uintptr_t) freed_block) {
            return curr;
        }
        curr = curr -> next;
    }
    return NULL;
}

/* OPTIONAL HELPER FUNCTION: merge
 * This function should take two pointers to blocks and merge them together.
 * The most important step is to increase the total size of the left block to include the size of the right block.
 * You should also copy the right block's next pointer to the left block's next pointer. If both blocks are initially in the freelist, this will remove the right block from the list.
 * This function will be useful for both my_malloc() (when you have to merge sbrk'd blocks) and my_free().
 */
static void merge(metadata_t * left, metadata_t * right) {
    left -> size += TOTAL_METADATA_SIZE + right -> size;
    left -> next = right -> next;
}

/* OPTIONAL HELPER FUNCTION: split_block
 * This function should take a pointer to a large block and a requested size, split the block in two, and return a pointer to the new block (the right part of the split).
 * Remember that you must make the right side have the user-requested size when splitting. The left side of the split should have the remaining data.
 * We recommend doing the following steps:
 * 1. Compute the total amount of memory that the new block will take up (both metadata and user data).
 * 2. Using the new block's total size with the address and size of the old block, compute the address of the start of the new block.
 * 3. Shrink the size of the old/left block to account for the lost size. This block should stay in the freelist.
 * 4. Set the size of the new/right block and return it. This block should not go in the freelist.
 * This function will be useful for my_malloc(), particularly when the best-fit block is big enough to be split.
 */
static metadata_t * split_block(metadata_t * block, size_t size) {
    int newSize = TOTAL_METADATA_SIZE + size;
    metadata_t * tempBlock = (metadata_t * )((char * ) block + TOTAL_METADATA_SIZE + block -> size - newSize);
    tempBlock -> size = size;
    block -> size -= newSize;
    return tempBlock;
}

/* OPTIONAL HELPER FUNCTION: add_to_addr_list
 * This function should add a block to freelist.
 * Remember that the freelist must be sorted by address. You can compare the addresses of blocks by comparing the metadata_t pointers like numbers (do not dereference them).
 * Don't forget about the case where the freelist is empty. Remember what you learned from Homework 9.
 * This function will be useful for my_malloc() (mainly for adding in sbrk blocks) and my_free().
 */
static void add_to_addr_list(metadata_t * block) {
    if (!address_list) {
        address_list = block;
        return;
    }
    if (block < address_list) {
        block -> next = address_list;
        address_list = block;
        return;
    }

    metadata_t * curr = address_list;
    while (curr -> next && curr -> next < block) {
        curr = curr -> next;
    }
    block -> next = curr -> next;
    curr -> next = block;
}

/* GIVEN HELPER FUNCTION: remove_from_addr_list
 * This function is provided for you by the TAs. You are not required to use it or our implementation of it, but it may be helpful to you.
 * This function should remove a block from the freelist.
 * Simply search through the freelist, looking for a node whose address matches the provided block's address.
 * This function will be useful for my_malloc(), particularly when the best-fit block is not big enough to be split.
 */
static void remove_from_addr_list(metadata_t * block) {
    if (!address_list) return;

    metadata_t * curr = address_list;
    if (curr == block) address_list = curr -> next;

    metadata_t * nxt;
    while ((nxt = curr -> next) && (uintptr_t) block > (uintptr_t) nxt) curr = nxt;
    if (nxt == block) curr -> next = nxt -> next;
}
/* OPTIONAL HELPER FUNCTION: find_best_fit
 * This function should find and return a pointer to the best-fit block. See the PDF for the best-fit criteria.
 * Remember that if you find the perfectly sized block, you should return it immediately.
 * You should not return an imperfectly sized block until you have searched the entire list for a potential perfect block.
 */
static metadata_t * find_best_fit(size_t size) {
    metadata_t * temp = NULL;
    metadata_t * curr = address_list;
    while (curr) {
        if (curr -> size == size) {
            remove_from_addr_list(curr);
            return curr;
        }

        if ((!temp && curr -> size > size) || (temp && curr -> size < temp -> size && curr -> size > size)) temp = curr;
        curr = curr -> next;
    }

    if (!temp) return NULL;

    if (temp -> size - size < MIN_BLOCK_SIZE) {
        remove_from_addr_list(temp);
        return temp;
    }

    return split_block(temp, size);
}

// ------------------------- PART 2: Malloc functions -------------------------

/* Before starting each of these functions, you should:
 * 1. Understand what the function should do, what it should return, and what the freelist should look like after it finishes
 * 2. Develop a high-level plan for how to implement it; maybe sketch out pseudocode
 * 3. Check if the parameters have any special cases that need to be handled (when they're NULL, 0, etc.)
 * 4. Consider what edge cases the implementation needs to handle
 * 5. Think about any helper functions above that might be useful, and implement them if you haven't already
 */

/* MALLOC
 * See PDF for documentation
 */
void * my_malloc(size_t size) {
    my_malloc_errno = NO_ERROR;

    if (!size) return NULL;
    if (size + TOTAL_METADATA_SIZE > SBRK_SIZE) {
        my_malloc_errno = SINGLE_REQUEST_TOO_LARGE;
        return NULL;
    }

    metadata_t * bestFit = find_best_fit(size);
    if (!bestFit || bestFit -> size < size) {
        metadata_t * tempBlock = my_sbrk(SBRK_SIZE);
        if ((long) tempBlock == -1) {
            my_malloc_errno = OUT_OF_MEMORY;
            return NULL;
        }

        tempBlock -> next = NULL;
        tempBlock -> size = SBRK_SIZE - TOTAL_METADATA_SIZE;
        add_to_addr_list(tempBlock);

        metadata_t * leftSide = find_left(tempBlock);
        if (leftSide) {
            leftSide -> next = tempBlock -> next;
            leftSide -> size = leftSide -> size + TOTAL_METADATA_SIZE + tempBlock -> size;
        }

        return my_malloc(size);
    }

    if (bestFit -> size < size + MIN_BLOCK_SIZE || bestFit -> size == size) {
        remove_from_addr_list(bestFit);
        return ((uint8_t * ) bestFit) + TOTAL_METADATA_SIZE;
    }

    size_t temp = TOTAL_METADATA_SIZE + size;
    metadata_t * ptr = (metadata_t * )((uint8_t * ) bestFit + bestFit -> size - temp + TOTAL_METADATA_SIZE);
    ptr -> size = size;
    ptr -> next = NULL;
    bestFit -> size = bestFit -> size - temp;
    return (metadata_t * )(((uint8_t * ) ptr) + TOTAL_METADATA_SIZE);
}

/* FREE
 * See PDF for documentation
 */
void my_free(void * ptr) {
    my_malloc_errno = NO_ERROR;

    if (!ptr) return;

    ptr = (metadata_t * )((char * ) ptr - TOTAL_METADATA_SIZE);
    add_to_addr_list(ptr);

    metadata_t * right = find_right(ptr);
    if (right) merge(ptr, right);
    metadata_t * left = find_left(ptr);
    if (left) merge(left, ptr);
}

/* REALLOC
 * See PDF for documentation
 */
void * my_realloc(void * ptr, size_t size) {
    my_malloc_errno = NO_ERROR;

    if (!ptr) return my_malloc(size);
    if (!size && ptr) {
        my_free(ptr);
        return NULL;
    }

    int minSize = (((metadata_t * ) ptr) -> size > size) ? size : ((metadata_t * ) ptr) -> size;

    void * out = my_malloc(size);
    memcpy(out, ptr, minSize);
    if (out) my_free(ptr);

    return out;
}

/* CALLOC
 * See PDF for documentation
 */
void * my_calloc(size_t nmemb, size_t size) {
    size_t currSize = size * nmemb;
    void * curr = my_malloc(currSize);
    if (curr) memset(curr, 0, currSize);
    return curr;
}
