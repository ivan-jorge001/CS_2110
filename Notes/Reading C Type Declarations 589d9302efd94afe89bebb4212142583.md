# Reading C Type Declarations

Type: Quiz 4 Material

# Notes

[C gibberish ↔ English Website](https://cdecl.org)

## C Data Types

### Base Types

- Integer types(Signed, add[unsigned] to unsigned)
    - [unsigned] char 8 bits
    - [unsigned] short [int] 16 bits
    - [unsigned] int 16/32 bits
    - [unsigned] long [int] 32/64 bits
    - [unsigned] long long [int] 64 bits
- Floating-point types
    - float 32 bits
    - double 64 bits
    - long double 80/128 bits
- Aggregate types
    - array
    - struct
    - union (later)
- Pointers (a special kind of integer)

### Derived Types

- Every data has zero or more derived types:
    - * — "pointer to..."
    - [] — "array of..."
    - [n] — "array of n ..."
    - ... (...)(args) — "function taking args and returning ..."

## Size

Depends on the platform. 16-bit and 64-bit computer has different size

Minimum size

- char – exactly 8 bits
- short int – at least 16 bits
- int – at least 16 bits
- long int – at least 32 bits

### Sizeof()

sizeof is a compile-time constant reflecting the number of bytes held by a data type or instance

sizeof(char) <= sizeof(short) <= sizeof(int) <= sizeof(long)

sizeof char is 1

## Boolean

C historically did not have a Boolean data type. Instead, we can **use integers** to represent Boolean values.

- Any integer that is 0 is evaluated as False
- Any non-zero integer evaluates as True
- Also applies to a char
    - NUL character ‘\0’ evaluates to False
- Also applies to a pointer
    - A memory address that is 0x0 is evaluated as False

## String

- C does not include strings
    - Strings are arrays of characters, end with an ASCII NUL(0 or '\0')
    - And characters are 8-bit integers
- You can define a String like
    
    ```c
    char mystr[6];
    ```
    
- Intialization:
    - char mystr[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
    - char mystr[] = {'H', 'e', 'l', 'l', 'o', '\0'};
    - char mystr[] = "Hello";
    - The latter two are **special cases**, the compiler determines the length of the array from the initializer
- There are a number of library functions for dealing with strings, including **strlen()**, **strcpy()**, and **strdup()**

```c
char s[6] = "hello";   
// same as  
s.stringz "hello"; *// 6 memory locations, end with 0
//s is the memory address where the string starts*
```

- **Never use *sizeof(s)* to determine string length.**
    - This tells the size of the array/pointer, not the actual length of the string.
    - Use *strlen(s).* Must put: *#include <string.h>* —> import library

## Declaration vs Definition

A **declaration** in C introduces an identifier and describes its type, be it a scalar, array, struct, or function. A declaration is what the compiler needs to accept references to that identifier (for type checking). You may have as many declarations of an identifier as you want within a scope as long as they are consistent.

A **definition** in C actually instantiates/implements this identifier. For instance, a definition allocates storage for variables or defines the body of a function. You may only have one definition of an identifier within a scope.

### Declaration

There are two parts:

1. Base Type
    - This is the type (or struct s or a typedef), and optionally a storage class and/or a type qualifier
    - The Base Type applies to all names up until the semicolon
2. List of Declarations, separated by commas
    - Each of these declares a type fr each identifier(the variable name)
    - Each is based on the Base Type, but stands alone
    - Consists of sensible combinations of "pointer to", "array of", or "function returning", ending with the Base Type
- Declaration Example
    
    ![Screen Shot 2021-11-10 at 14.56.32.png](Reading%20C%20Type%20Declarations%20589d9302efd94afe89bebb4212142583/Screen_Shot_2021-11-10_at_14.56.32.png)
    
- Declaration Example 2(each declaration is separate)
    
    ![Screen Shot 2021-11-10 at 14.58.17.png](Reading%20C%20Type%20Declarations%20589d9302efd94afe89bebb4212142583/Screen_Shot_2021-11-10_at_14.58.17.png)
    

### Rules on Declaration

1. Remember the precedence of the declarators
    1. () and [] declarators get processed first
    2. gets processed last
    3. Parentheses change the precedence order (just as in expressions)
2. Read or form the declaration from the inside out
    1. Example: int *(**f)() —> f is a pointer to a pointer to a function returning a pointer to int.
    - More on the example above
        
        ![Screen Shot 2021-11-10 at 15.00.57.png](Reading%20C%20Type%20Declarations%20589d9302efd94afe89bebb4212142583/Screen_Shot_2021-11-10_at_15.00.57.png)
        

### Parsing

determining which grammar productions (rules) were used to generate a sentence

- Example
    
    ![Screen Shot 2021-11-10 at 15.12.31.png](Reading%20C%20Type%20Declarations%20589d9302efd94afe89bebb4212142583/Screen_Shot_2021-11-10_at_15.12.31.png)
    

### Declaring vs Using Pointers and Arrays

*, (), and [] have different meanings in declarations and executable statements. Therefore, their behavior allows you to “unwind” a type just as the declaration would wind it

- Example 1
    
    ![Screen Shot 2021-11-10 at 15.14.36.png](Reading%20C%20Type%20Declarations%20589d9302efd94afe89bebb4212142583/Screen_Shot_2021-11-10_at_15.14.36.png)
    
- Example 2
    
    ![Screen Shot 2021-11-10 at 15.24.50.png](Reading%20C%20Type%20Declarations%20589d9302efd94afe89bebb4212142583/Screen_Shot_2021-11-10_at_15.24.50.png)
    

## Typedef

Typedef is a shortcut that creates a new alias for a type. It does NOT create a new type

- Creates a new type that is an alias for an existing one
- Typedef is a shortcut that allows you to create a new alias for a type
- It does **not** create a new type
- Start the declaration with “typedef” and put the alias name where you would put the variable name
- Don’t let the syntax throw you: It just allows you to create another name for an existing type

*Start the declaration with “typedef” and put the alias name where you would put the variable name*

- Examples
    
    ```c
    // Define an array of 5 struct a named b
    struct a b[5];
    // Create a type alias for an array of 5 struct a
    typedef struct a sa5[5];
    //Now we can use sa5 as a type name:
    sa5 c;
    // Note that b and c are the same type!
    
    // Another example
    typedef unsigned long size_t;
    size_t position;
    // What type is position?
    unsigned long
    ```
    

## Reading and Forming Declarators

- Rule 1: Remember the precedence of the declarators
    - () and [] declarators get processed first
    - gets processed last
    - Parentheses change the precedence order (just as in expressions)
- Rule 2: Read or form the declarations from the inside out
- Example: int *(**f)()
    - f is a pointer to a pointer to a function returning a pointer to int.
- Example
    
    ![Screen Shot 2021-11-17 at 2.38.05 PM.png](Reading%20C%20Type%20Declarations%20589d9302efd94afe89bebb4212142583/Screen_Shot_2021-11-17_at_2.38.05_PM.png)
    
- **parsing:** determining which grammar productions (rules) were used to generate a sentence

### How to read a declaration

1. Find the identifier name, e.g. "x" in "int x;"
2. Read as far right as you can until:
    1. You hit a close paren ')', or
    2. You reach the end of the declaration
3. Go back and read as far left as you can until:
    1. You hit an open paren '(', or
    2. You reach the beginning of the declaration
4. If you hit parentheses, exit the parentheses
5. Go to 2 and repeat until you read the whole declaration

# Questions & Answers

- Translate the following declarations into English descriptions:
    - `char **c[3];`
    - Student & TA Solution
        
        declare c as array 3 of pointers to pointers to char
        
    - `char *(*d)[3];`
    - Student & TA Solution
        
        declare d as pointer to array 3 of pointers to char
        
    - `int (*cmp)(int, int);`
    - Student & TA Solution
        
        cmp is a pointer to a function taking in two int parameters and returning an int
        
    - `void (*f)(void);`
    - Student & TA Solution
        
        declare f as pointer to function taking no parameters and returning nothing
        
    - `void *(*g)();`
    - Student & TA Solution
        
        declare g as pointer to function taking any parameters returning pointer to void
        
    - `void *(**h[][6])[5];`
    - Student & TA Solution
        
        declare h as array of array of 6 pointers to pointers to an array of 5 pointers to a void
        
    - `int (*(*q)(char **))[];`
    - Student & TA Solution
        
        q is a pointer to a function taking one pointer to a pointer to a char and returning a pointer to an array of int
        
    - Super duper mega challenge problem. This is ***way*** harder than anything on the quiz; if you can answer the above, you'll be fine. Only look at this if you want a fun challenge!
        - `int const * const (*(*c)(void *(*[2])(void *), const int (*)[2], const int *[2]))[3];`
    - Student & TA Solution
        
        declare c as pointer to function (array 2 of pointer to function (pointer to void) returning pointer to void, pointer to array 2 of const int, array 2 of pointer to const int) returning pointer to array 3 of const pointer to const int
        
- Translate the following English descriptions to C types. The first one has been done for you.
    - Declare `c` to be a pointer to arrays, where the elements of the arrays are pointers to integers
        - `int *(*c)[];`
    - Student & TA Solution
        
        int *(*c)[];
        
    - Declare d to be an array of pointers to characters. The characters should not be able to be modified.
    - Student & TA Solution
        
        const char (*d[]);
        
    - Assume that we have declared a `struct student`. Declare `lookup` to be a pointer to a function that takes an int and returns an array of student structs.
    - Student & TA Solution
        
        struct student (*lookup)(int)[];
        
    - Say you want to store multiple lookup functions. Declare `lookups` to be an array of size 5, where each of the elements has the same type as `lookup` above.
    - Student & TA Solution
        
        struct student (*lookups[5])(int)[];
        

---

- In C, how many bits are the types short, int, and long?
    1. 16, 32, 64
    2. 32, 64, 64
    3. 32, 32, 64
    4. Any of the above
- Prof Answer
    
    **D**
    
- In C, a boolean value occupies
    1. 1 bit
    2. 8 bits
    3. 16 bits
    4. 32 bits
    5. Any size an integer can be.
- Prof Answer
    
    **E**
    
- You are given the C definition below. What is its type?
    
    ```c
    double **m[][];
    ```
    
    1. Pointer to pointer to array of array of doubles
    2. Pointer to array of pointers to array of doubles
    3. Array of array of pointers to pointers to doubles
    4. Array of pointers to array of pointers to doubles
- Prof Solution
    
    **C**