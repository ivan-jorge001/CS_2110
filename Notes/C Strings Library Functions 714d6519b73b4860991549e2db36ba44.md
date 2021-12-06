# C Strings/Library Functions

Type: Quiz 4 Material

# Notes

- C does not have print or I/O built-in
    - For strings and printing, use standard C libraries

## printf()

- A function in the standard IO library
    - ***#include <stdio.h>***
- The first argument is a format string.
- Characters in the format string are copied to standard output
- Format codes beginning with % reference arguments that come after the format string, in order
- Need to output a newline character **'\n'** to end a line
- printf format code:
    
    
    | %d | Decimal integer (int) |
    | --- | --- |
    | %x | Hex integer (int) |
    | %f | Floating number (float) |
    | %s | String (char * or char [1) |
    | %c | Character (char) |
    | %p | Pointer (for debugging) |
- Example
    
    ```c
    //prints —> Person: Dan GPA: 2.5
    printf(“Person: %s GPA: %f\n”, name, gpa);
    ```
    

## string.h functions

`#include <string.h>`

### strncpy() / strcpy()

[strncpy() documentation](https://www.tutorialspoint.com/c_standard_library/c_function_strncpy.htm)

- strncpy() code
    
    ```c
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
    ```
    

[strcpy() documentation](https://www.tutorialspoint.com/c_standard_library/c_function_strcpy.htm)

### strlen()

[Documentation](https://www.tutorialspoint.com/c_standard_library/c_function_strlen.htm)

- Code
    
    ```c
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
    ```
    

### strncmp() / strcmp()

[strncmp() documentation](https://www.tutorialspoint.com/c_standard_library/c_function_strncmp.htm)

- strncmp() code
    
    ```c
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
    ```
    

[strcmp() documentation](https://www.tutorialspoint.com/c_standard_library/c_function_strcmp.htm)

# Questions & Answers

Practice question: a programmer is attempting to copy a string `s1` into a buffer of characters `s2`. Can you spot the issue with the code below?

```c
strncpy(s2, s1, strlen(s1));
```

- TA Answer
    - ***The third parameter should be “strlen(s1)+1” to account for the null terminating character at the end of the string***