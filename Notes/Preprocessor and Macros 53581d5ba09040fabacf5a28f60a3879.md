# Preprocessor and Macros

Type: Quiz 4 Material

# Notes

## The C Preprocessor

- Runs before the compiler
- C doesn't check for **runtime errors**

The C preprocessor does:

- File inclusion(#include)
- Macro expansion(#define)

Syntax:

- Preprocessor always starts with **#**
- Preprocessors do **not** end in semicolons.

Conventionally, we only include files that end in “.h” —> consist of declarations (including function prototypes) and macro definitions but no executable code

## Declare functions before you call them

```c
int foo(int);        —> function prototype(declaration)
int bar(char *);  —> function prototype(declaration)
int main() {
	foo(1);
	bar("Bye")
}

int foo(int i) {
	// stuff
}

int bar(char *s) {
	// stuff
}
```

Add function declaration above main() since main needs to know about the functions it will call

## #Include

- C does not have an "import" system
- The lines in an #included file are literally copied in place of the #include
- Preprocessor copies all C code from filename and replaces the include statement with that code
    - #include-ing a header file is like copy-pasting the declarations you need
- #include <filename> for system header files
- #include "filename" for header files you write

If you surround the file name with double quotes(""):

- The preprocessor looks in the current directory and then the system directories for the file and then the system directories for the file

If you surround the file name with angle brackets(<>):

- It looks only in the system directory(e.g. /usr/include)
- Example
    
    ```c
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include ”mylibrary.h"
    ```
    

## Macro Processing

Macro Processing is a text search-and-replace operation on your source code file

> *Since macros are literal text substitution, this could be dangerous or lead to unexpected behavior because when directly replacing a macro with code you could run into arithmetic precedence issues (PEMDAS issues)*
> 

If you invoke the compiler with **gcc –E**, it will show you the pre-processed input file with all the includes and macros expanded

**How to macros as constant:**

- #define MACRO_NAME TEXT_REPLACEMENT
- Example of macros as constants
    
    ```c
    #define NUL_CHAR ‘\0’
    #define MAXWORDLEN 256
    
    char buf[MAXWORDLEN];
    ...
    while (buf[i] != NUL_CHAR && i < MAXWORDLEN)
        i++;
    
    /**After the C Preprocessor, the code becomes:**/
    
    char buf[256];
    ...
    while (buf[i] != ‘\0’ && i < 256)
    i++;
    ```
    

**How to macros with argument:**

- #define MACRO_NAME(ARGUMENTS) TEXT_REPLACEMENT
- Example of macros with argument
    
    ```c
    #define PRODUCT(a,b) ((a)*(b))
    ```
    
    —> PRODUCT(x+3,y+4) now expands to ((x+3)*(y+4))
    
    text search-and-replace
    operation on your source code file
    

## Guards

Lab 10 - Intro to C.pdf - Slides 19-20 for content

- Slides 19 - 20
    
    ![Screen Shot 2021-11-17 at 11.49.32.png](Preprocessor%20and%20Macros%2053581d5ba09040fabacf5a28f60a3879/Screen_Shot_2021-11-17_at_11.49.32.png)
    
    ![Screen Shot 2021-11-17 at 11.49.41.png](Preprocessor%20and%20Macros%2053581d5ba09040fabacf5a28f60a3879/Screen_Shot_2021-11-17_at_11.49.41.png)
    

# Questions & Answers

- What is the preprocessor, and what is its role in C? At what stage does it run in the compilation pipeline?
- **Student Solution**
    - The C preprocessor does two main things
        - File inclusion (#include)
        - Macro expansion (#define)
    - Runs before the compiler
- **TA Solution**
    - ***Preprocessor reads through all the code, finds the macros, and replaces the macros with their associated text. It also copies all the code from external files referenced using “#include”***
    - ***Preprocessor runs at stage 1 in the compilation pipeline***
    - ***Stages: (1) Preprocessor (2) Compiler (3) Assembler (4) Linker***
- What does the `#include` directive do in the preprocessor?
    - **Student Solution**
        - Conventionally, we only include files that end in “.h”
        - These consist of declarations (including function prototypes)
    - What is a header file? List two reasons why we use header files in C
    - **Student Solution**
        - In C, you can't use a function/variable before you declare it
        - Header files contain function declarations and global variables
            - They have a .h extension
            - Like the "interface" of what a file exposes
        - Shouldn't include function implementations
    - What kind of code do we usually put in header files?
    - **Student Solution**
        - Header files typically contain
            - Macro definitions
            - Type Declarations
            - Function Prototypes
            - NOT Code!!!
    - Why shouldn't you `#include` a `.c` source file?
    - **Student Solution**
        - .c files include function implementations, not just declarations. While that may seem innocuous, if you included them, it can be extremely difficult to find if you accidentally included an implementation twice. Including a declaration twice is fine, as long as they're the same. But including an implementation twice is a compiler error that's hard to find.
        - All this is to say that to include .h files, rather than .c files, decreases the likelihood of errors, and makes debugging easier.
- What is a macro? What are some cases in which we might want to use a macro?
- **Student Solution**
    - Macro processing is just text substitution using some very specific rules
    - Text replacement
    - Use cases : constants, can use macros as functions kind of
        - #define PRODUCT(a,b) a*b
        - PRODUCT(4,5) would expand to 4*5
- **TA Solution**
    - ***A macro is a defined text replacement for C coding***
    - ***Macros could be useful to define well known values like pi which is 3.1415 or to define an arithmetic expression that is repeatedly used in your code such as ((a) + (3*b))***
- Write a macro that will expand `PI` into the value `3.14159`
- **Student & TA Solution**
    
    ```c
    #define PI 3.141593
    ```
    
- C does not have particularly safe or powerful macros; its preprocessor macros essentially perform text substitution into your program! How could this be dangerous or lead to unexpected behavior?
- **Student Solution**
    - Incorrect use of parentheses -> incorrect order of operations
    - Macro Perils
        - Wrap every variable you use in parentheses
        - Include outer parentheses when your macro produces an expression
- **TA Solution**
    
    ***Since macros are literal text substitution, this could be dangerous or lead to unexpected behavior because when directly replacing a macro with code you could run into arithmetic precedence issues (PEMDAS issues)***
    
- Write a macro `AVG3` that computes the average of three numbers, evaluating to a double. For example, `AVG3(4, 5, 6)` should evaluate to `5.0`.
    - Watch out for the danger from the point above! Write your macros safely so it doesn't lead to unexpected results
    - Watch out for integer division
- **Student & TA Solution**
    
    ```c
    #define AVG3(a,b,c) (((a) + (b) + (c))/3.0)
    ```
    

Challenge practice question (conceptual, just to test your understanding, harder than what you'll see on the quiz):

Let's say I define the following macro and the following function:

```c
#define SQUARE(x) ((x)*(x))
double square(double x) { return x * x; }
```

Can you think of at least two different kinds of scenarios in which using the macro instead of the function leads to different behavior at runtime (i.e. changing `square` to `SQUARE` could change the output of the program)?

- **Student & TA Solution**
    - *Calling a function builds on the stack.*
    - *Macro square can take in any type, so you can 'pass in' ints to it whereas the function only takes and returns a double*