# Dynamic Allocation

Type: Quiz 4 Material

Pointer video: [https://www.youtube.com/watch?v=5VnDaHBi8dM](https://www.youtube.com/watch?v=5VnDaHBi8dM)

Helpful reading: [https://jraleman.medium.com/c-programming-language-functions-malloc-calloc-realloc-and-free-61cfc3e45da7](https://jraleman.medium.com/c-programming-language-functions-malloc-calloc-realloc-and-free-61cfc3e45da7)

# Three memory allocation functions

```c
void *malloc(size_t n);
//Allocates (at least) n bytes of memory on the heap, 
//returns a pointer to it
//Assume memory contains garbage values

void *calloc(size_t num, size_t size);
//Allocates (at least) num*size bytes of memory on the heap, 
//returns a pointer to it
//Memory will be zero’ed out.

void *realloc(void *ptr, size_t n);
//Reallocates (at least) n bytes of memory on the heap, 
//returns a pointer to it
//Copies the data starting at ptr that was previously allocated
//Often used to expand the memory size for an existing object on the heap
```

# malloc()

- malloc() returns a pointer to at least as many bytes as we requested
- malloc() is declared as “void *malloc(unsigned long)”
- C uses the idiom “pointer to void” for a generic pointer
- To be safe, you should cast this pointer into the correct type to type-check
    
    ```c
    int *ip;
    ip = (int *) malloc(sizeof int);
    ```
    

```c
struct r {
	char name[40];
	double gpa;
	struct r *next;
};
struct r *rp;
rp = malloc(sizeof(struct r));
//Find memory in heap and returns a pointer
if (rp == NULL) {
		/*HANDLE ERROR*/
}
/*
option for handling error
- ABORT
- ASK AGAIN
- SAVE USER DATA
- ASK FOR LESS
- FREE UP SOMETHING
*/

//Idiomatic but safe way of implementing malloc
if ((rp == malloc(sizeof struct r)) == NULL) {
	/* HANDLE ERROR HERE*/
}
ALTERNATIVE SYNTAX
if (!(rp = malloc(sizeof struct r))) {
	/* HANDLE ERROR HERE*/
}
```

- Stack graph:
    
    ![Screen Shot 2021-11-29 at 14.15.10.png](Dynamic%20Allocation%206be6f8ef5ad342ea8c542f51cef8a5f6/Screen_Shot_2021-11-29_at_14.15.10.png)
    

***NEVER USE RP BEFORE CHECKING FOR NULL***

## free()

Use free() to make storage available for reuse

```c
free(rp); 
/*returns the memory back to the heap for re-use*/
```

**MUST NOT use the value in rp after the call to free()**

**MUST NOT dereference the memory it points to**

**free(NULL) does nothing but is not an error**

**Variable rp still exists (a pointer to struct r), but what it points to is now garbage data. Should never dereference rp(*rp), but we CAN assign a new value to rp(make it point somewhere else)**

# Persistent Data

```c
char *foo(void)
{
	static char ca[10];
	return ca;
}
//Anyone calling this function now has access to ca in this block. Could be dangerous.
//Since ca was allocated on stack during function call 
//pointer returned is now pointing to who-knows-what
//this approach is not dynamic

char *foo(void)
{
	char *ca = malloc(...);
	/* error checking but no free */
	return ca;
}
//This actually works, but the caller needs to know that they’re responsible for the free()
```

```c
char *strFromUnsigned(unsigned u)
{
	static char strDigits[] = “?????”;
	char *pch;
	pch = &strDigits[5];
	do
	*--pch = (u % 10) + '0';
	while((u /= 10) > 0);
	return pch;
}
//Problems
//strHighScore = strFromUnsigned(HighScore);
//strThisScore = strFromUnsigned(ThisScore);
```

### Memory Leaks

Memory leaks occur when the programmer loses track of memory allocated by malloc or other functions that call malloc

```c
void foo(void)
{
	char *ca = malloc(...);
	/* no free */
	return;
}
```

# Calloc

```c
void *calloc(size_t num, size_t size);
```

- Call malloc() to find space for num new allocations
- Initialize the space to zero (0)

# Realloc

```c
ptr = realloc(ptr, num_bytes);
```

Realloc does:

- Find space for new allocation
- Copy original data into new space
- Free old space
- Return pointer to new space

Realloc may return:

- same pointer
- different pointer
- NULL

```c
cp = realloc(cp, n);
//If realloc returns NULL cp is lost --> Memory Leak!

//Correct way:
void *tmp;
if((tmp = realloc(cp,...)) == NULL)
{
	/* realloc error */
} else {
	cp = tmp;
	//free(temp); NOOOO, cp and tmp points to the same mem
}
```

- Memory Visualization
    
    ![Screen Shot 2021-12-01 at 03.04.21.png](Dynamic%20Allocation%206be6f8ef5ad342ea8c542f51cef8a5f6/Screen_Shot_2021-12-01_at_03.04.21.png)
    
    ![Screen Shot 2021-12-01 at 03.04.28.png](Dynamic%20Allocation%206be6f8ef5ad342ea8c542f51cef8a5f6/Screen_Shot_2021-12-01_at_03.04.28.png)
    

### Edge cases

- realloc(NULL, n) = malloc(n);
- realloc(cp, 0) = free(cp); // only on some compilers
- These can be used to make realloc work in a single loop design
to build a dynamic structure such as a linked list.

```c
int size = 0;     /* Size of "array" */
int *ip = NULL;   /* Pointer to "array" */
int *temp;
int i;
char buffer[80];
while(fgets(buffer, 80, stdin) != NULL) {
    size++; 
    if((temp = realloc(ip, size*sizeof(*temp))) == NULL){
        fprintf(stderr, "Realloc failure\n");
        exit(EXIT_FAILURE);
    }
    ip = temp;
    ip[size-1] = strtol(buffer, NULL, 10);
}
```

# Dynamic Allocation: Pitfalls

- Allocate a block and lose it by losing the value of the
pointer
- Allocate a block of memory and use the contents
without initialization
- Read or write beyond the boundaries of the block
- Free a block but continue to use the contents
- Call realloc to expand a block of memory and then –
once moved – keep using the old address
- FAIL TO NOTICE ERROR RETURNS

- In-class quiz question 1
    
    ![Screen Shot 2021-12-01 at 03.09.26.png](Dynamic%20Allocation%206be6f8ef5ad342ea8c542f51cef8a5f6/Screen_Shot_2021-12-01_at_03.09.26.png)
    

# Malloc Implementations

## Outline

K&R Malloc Implementation

- Headers
- Heap Layout
- Allocating the Correct Amount of Memory
- malloc(): Getting the memory for work
- free(): Recycling the memory when done
- morecore(): OS requests for real memory