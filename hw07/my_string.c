/**
 * @file my_string.c
 * @author Andrew Friedman
 * @brief Your implementation of these famous 3 string.h library functions!
 *
 * NOTE: NO ARRAY NOTATION IS ALLOWED IN THIS FILE
 *
 * @date 11/03/2021
 */

// DO NOT MODIFY THE INCLUDE(s) LIST
#include <stddef.h>

#include "hw7.h"

/**
 * @brief Calculate the length of a string
 *
 * @param s a constant C string
 * @return size_t the number of characters in the passed in string
 */
size_t my_strlen(const char * s) {
    size_t total = 0;
    int index = 0;
    while ( * (s + index) != '\0') {
        total++;
        index++;
    }
    return total;
}

/**
 * @brief Compare two strings
 *
 * @param s1 First string to be compared
 * @param s2 Second string to be compared
 * @param n First (at most) n bytes to be compared
 * @return int "less than, equal to, or greater than zero if s1 (or the first n
 * bytes thereof) is found, respectively, to be less than, to match, or be
 * greater than s2"
 */
int my_strncmp(const char * s1, const char * s2, size_t n) {
    size_t index = 0;
    while (index <= n) {
        if ( * (s1 + index) - * (s2 + index) == 0) {
            index = index + 1;
        } else {
            if ( * (s1 + index) - * (s2 + index) > 0) {
                return 1;
            }
            return -1;
        }
    }
    return 0;
}

/**
 * @brief Copy a string
 *
 * @param dest The destination buffer
 * @param src The source to copy from
 * @param n maximum number of bytes to copy
 * @return char* a pointer same as dest
 */
char * my_strncpy(char * dest, const char * src, size_t n) {
    size_t index = 0;
    while (( * (src + index) != '\0') && (index < n)) {
        *(dest + index) = * (src + index);
        index++;
    }
    while (index < n) {
        *(dest + index) = '\0';
        index++;
    }
    return dest;
}
