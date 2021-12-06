# C Keywords and Storage

Type: Quiz 4 Material

# Notes

- C is **procedural**; no objects or classes
    - **C structs** are used in place of classes

## Type Qualifiers

- Part of the type (unlike Storage Class)
- Not mutually exclusive with a Storage class
- They contain no methods
- All data members are publicly visible

### Const

- The value of this variable may not be changed after initialization
- Defines a variable as constant (value cannot be changed)
    - Ex. const int x = 5;

### Volatile

- It doesn't change the scope or storage of a variable
- Tells the compiler NOT to optimize away the variable
- Use this for device registers
- The volatile keyword is intended to prevent the compiler from applying any optimizations on objects that can change in ways that cannot be determined by the compiler. Objects declared as volatile are **omitted from** optimization because their values can be changed by code outside the scope of current code at any time.
- the compiler may not optimize references to this variable (e.g. it’s a device register that may change value asynchronously)

### Restrict

- For the lifetime of a pointer, only the pointer itself or a value directly derived from it may be used to access the object to which it points. This allows better optimization.

## Storage Class Specifiers

- tells us **where the data will be stored** and **who will be able to see it**
- Not part of the type; it only affects the variables defined or declared using it

![Screen Shot 2021-11-10 at 14.20.05.png](C%20Keywords%20and%20Storage%206dae0f432d294ccab47f86067ca9c0c5/Screen_Shot_2021-11-10_at_14.20.05.png)

### Auto

- refer to table

### Static

- **static** defined functions are not visible outside of its C file (like private in java)
- **static** defined global variables are not visible outside of its C file (like private in java)
- **static** defined local variables do not lose values between function calls
    - Local variables are normally stored on the stack
    - This isn’t possible for static locals, since they need to persist.
- Has two meanings:
    1. *Inside a function:* static changes the storage location to static memory, either data or BSS segment (the scope stays local)
    2. *Outside a function:* static changes the scope (visibility) to be only visible within the file (the storage location stays in static memory)
- example
    
    ```c
    void funcCounter(void) {
      static int counter = 0;  // one instance, static memory
      counter++;           // visible only in function
      printf(“This function was called %d times.\n”, counter);
    }
    ```
    
    - the counter is allocated once in the Initialized Data static area of memory
    - the counter is NOT located on the stack
    - Every call to funcCounter() sees the same shared instance of counter.
    - It is only initialized to 0 once at program load (not every time function is called).
    - It’s the analog of .fill from LC-3

### Extern

- **extern** tells the compiler that the variable has been defined in another file
- Example
    
    other.c
    
    ```c
    int x = 5; /*global var*/
    ```
    
    main.c
    
    ```c
    extern int x;
    int main(void) {
         printf("%d", x) /*prints 5*/
    }
    ```
    
- Compiler does NOT allocate storage
- For type checking of the identifier name only
- Another C file must allocate storage by defining that var name(or function)
- A function prototype is automatically given the extern storage class
- Example: Static inside a function
    
    ![Screen Shot 2021-11-10 at 14.22.08.png](C%20Keywords%20and%20Storage%206dae0f432d294ccab47f86067ca9c0c5/Screen_Shot_2021-11-10_at_14.22.08.png)
    
    Static variable is initialized at compile time. Not at Runtime
    
    First time call function - prints 1
    
    Second time - prints 2
    
    Third time - prints 3
    
    Fourth time - prints 4
    

### Register

- It used to be applied to local variables
- It doesn't change the scope, but it requests that the variable only be in a register and not in the local variables in the stack frame.
    - The compiler is not obliged to listen
- not very important nowadays, just know it used to be applied to local variables. It doesn't change the scope, but it requests that the variable only be in a register and not in the local variables in the stack frame. The compiler is not obliged to listen :p

## Other Keywords

### Unsigned

- Uses the value of the leftmost bit to contribute to the magnitude of the number as opposed to the sign of the number
- An unsigned is **an integer that can never be negative**

### Enum

- Enumeration (or enum) is a user-defined data type in C. It is mainly used to assign names to integral constants, the names make a program easy to read and maintain.

## Structs

- In C, a struct (structure) is a data type that is used to group together multiple values in one block of memory
- They look similar to classes in Java; however, they do not have methods—they are just data bundled together
- Typically define structs by global variables outside of a function
- Struct members occupy a namespace unique to the containing struct. That means that “struct b { int b} b;” is legal and not ambiguous.
- You can *declare* a struct type, and *define* an instance (or multiple instances) of the variable at the same time.
- Structures may
    - be copied or assigned
    - have their address taken with &
    - have their members accessed
    - be passed as arguments to functions
    - be returned from functions
- Structures may not
    - be compared
- Properties:
    - Contain no methods
    - All data members are publicly visible
    - only bundled data
    - structs tag declares the type
    - Use named, not structural, type equivalence
    - Untagged structs are each a different type
    - Use the . operator to access variables inside a struct
    - If given a pointer to a struct, use the -> operator to simultaneously dereference and access it
        - The left operand must be a pointer to struct and the right operand a **struct** member.
        - It is literally a shorthand for * and .
            
            ```c
            struct myStruct {
            	int a, b;
            } *p; // p is a pointer to struct myStruct
            
            // same meaning below
            (*p).a = (*p).b;
            p->a = p->b;
            ```
            
- How struct is laid out in memory
    
    ![Screen Shot 2021-11-03 at 18.49.27.png](C%20Keywords%20and%20Storage%206dae0f432d294ccab47f86067ca9c0c5/Screen_Shot_2021-11-03_at_18.49.27.png)
    
- Struct Declaration
    
    ```c
    struct [ <optional tag> ] [ {
    	<type declaration>;
    	<type declaration>;
    	...
    } ] [ <optional variable list> ];
    ```
    
    - Struct declarations that have a **member list** in curly braces define a **new type**, specifically a struct type.
    - If the optional tag is omitted it creates an unnamed struct type that’s different from every other struct type.
    - Struct member names are in yet another name space local to the structure type, e.g. every structure type could have a member named “next”
- Struct car example
    
    *The type declared here is 'struct car', not just 'car':*
    
    ```c
    struct car {
    
    	char mfg[30];
    	
    	char model[30];
    	
    	int year;
    
    }
    ```
    
    **Names following the struct tag define instances of the struct**
    
    struct car mikes_car, joes_car;
    
    **You can declare a struct type, and define an instance (or multiple instances) of the variable at the same time.**
    
    ```c
    struct car {
    
    	char mfg[30];
    	
    	char model[30];
    	
    	int year;
    
    } mikes_car;
    ```
    
    struct car is a data type
    
    mikes_car is a variable of type struct car
    
- Referencing Structurer Members Example
    
    The . operator is used just as in Java to reference members of a struct
    
    ```c
    printf("%s\n", mikes_car.model);
    
    johns_car.mfg = "Chevrolet"; —> WRONG!!
    
    // Instead: Use strcpy(), a library function
    
    strcpy(johns_car.mfg, "Chevrolet");
    ```
    

## Scope

### Global vs Local

```c
// x is a global variable stored in the "data" section of our memory
// y is a local variable stored on the stack (specifically, on the stack frame for main)
int x = 4;
int main(void) {
    int y = 3;
    return 0;
}
```

- Scope Example
    
    ```c
    #include <stdio.h>
    int i = 0;
    void f(int);
    
    int main (int argc, char *argv[]) {
    	i = 1; //points to line 2 (int i = 0;)
    	int i = 0;
    	i = 2; //points to line 7 (int i = 0;)
    	for (int i = 0; i < 10; i++) {
    		f(i); //points to line 9 loop int i
    		int i = 2;
    		f(i); //points to line 11 int i = 2
    	}
    	f(i); //points to line 7 (int i = 0; i = 2;)
    }
    
    void f(int j) {
    	printf("%d\n", i); ////points to line 2 int i = 0, prints line 6 i = 1
    }
    ```
    

### Static vs Extern

- The keywords extern and static control whether the name is seen in other files

![Screen Shot 2021-11-10 at 13.38.15.png](C%20Keywords%20and%20Storage%206dae0f432d294ccab47f86067ca9c0c5/Screen_Shot_2021-11-10_at_13.38.15.png)

- Scope Example
    
    file1.c:
    
    ```c
    int a[10];    // external definition
    static struct r *p;  // this file only
    extern float c[100]; // ref to c in file2.c
    ...
    ```
    
    file2.c:
    
    ```c
    extern int a[10];   // ref to arr in file1.c
    static struct r *p; // NOT the p above
    float c[100];   // definition
    ...
    ```
    

## Functions

- Pass by value always (not by reference)
- **Copies** of arguments are pushed on the stack
- example w/ breakdown
    
    ```c
    int mult(int a, int b) {
    	return a*b;
    }
    ```
    
    - Two arguments (int), pushed on the stack
    - Returns an int

### main()

```c
int main(int argc, char *argv[]) {
	return 0;
}
```

- main() is just another function
- It is the first function invoked when you run your program from the command line
- Convention: return 0 on success, or non-0 on error
- Hint: type echo $? in the Linux shell to see the return value from main()
- argc is the number of arguments
    - Including the program name itself
    - *Think “argument count”*
- argv is an array of strings
    - More properly, an array of pointer to char
    - *Think “argument values”*
- command line example
    
    ```c
    $ ./myprogram cs2110 rocks
    ```
    
    - argc == 3
    - argv[0] is “./myprogram”
    - argv[1] is “cs2110”
    - argv[2] is “rocks”

### void

```c
void func(void) {
	printf(“Hello\n”);
}
```

- void is a special keyword
- **return type void**: function does not return a value
- **arguments of void:** function takes no arguments

## C Data Types and Sizes

- Unlike in Java, the exact sizes of number types is not specified in the C standard
- There are minimums in the standard as well as some conventions
- The exact sizes are implementation-specific and may vary between compilers or systems—you should never assume a given type is a given size
    - One exception: POSIX (another standard) requires char to be 8 bits, so we can pretty much always assume it is
- You can use the sizeof operator to determine the size of a C type (in bytes)
    - Always use sizeof() to express/use the size of a type.

| char | Exactly 8 bits |
| --- | --- |
| short | At least 16 bits (usually 16) |
| int | At least 16 bits |
| long | At least 32 bits |
| long long | At least 64 bits |
| float | Unspecified, usually 32 bits |
| double | Unspecified, usually 64 bits |
| long double | Unspecified, usually 64, 96 or 128 bits |

You can also safely assume the following about sizes: 

- sizeof(long long) ≥ sizeof(long)
- sizeof(long) ≥ sizeof(int)
- sizeof(int) ≥ sizeof(short)
- sizeof(short) ≥ sizeof(char)
- sizeof(long double) ≥ sizeof(double)
- sizeof(double) ≥ sizeof(float)
- sizeof(float) ≥ sizeof(char)
- Pretty much, this means that no type is smaller than the one above it in the table (and float is no smaller than char).

# Questions & Answers

- `static` is a pretty overloaded keyword in C; it can be used in three different places!
    - What does it mean for a function to be marked `static`?
    - **Student Solution**
        
        static defined functions are not visible outside of its C file (like private in java)
        
    - **TA Solution**
        
        ***The function is not visible outside of its C file (like private in Java)***
        
    - What does it mean for a global variable (outside of a function) to be marked `static`?
    - **Student Solution**
        - Outside a function : static changes the scope (visibility) to be only visible within the file (the storage location stays in static memory)
        - static defined global variables are not visible outside of its C file (like private in java)
    - **TA Solution**
        
        ***The global variable is not visible outside of its C file (like private in Java)***
        
    - What does it mean for a variable inside of a function to be marked `static`?
        - This one is especially important!
    - **Student Solution**
        - inside a function : static changes the storage location to static memory, either data or BSS segment (the scope stays local)
        - static defined local variables do not lose values between function calls
            - Local variables are normally stored on the stack
            - This isn’t possible for static locals, since they need to persist. Where can we store them instead?
        - Static local variables are stored in the data segment as we don’t want to lose their values when the stack frame is torn down
    - **TA Solution**
        - ***Variables inside a C function are called local variables***
        - ***The local variable does not lose values between function calls since they are stored in the data section of memory***
        - ***The static initialization line inside a function only happens once (later calls to the function skip that line)***
    - **Better Answer**
        
        ```
        void foo()
        {
            static int x = 5;
            x++;
            printf("%d", x);
        }
        
        int main()
        {
            foo();
            foo();
            return 0;
        }
        ```
        
        There are two issues here, lifetime and scope.
        
        The **scope** of a variable is where the variable name can be seen. Here, `x` is visible only inside function `foo()`.
        
        The **lifetime** of a variable is the period over which it exists. If `x` were defined without the keyword static, the lifetime would be from the entry into `foo()` to the return from `foo()`; so it would be re-initialized to 5 on every call.
        
        The keyword static acts to extend the lifetime of a variable to the lifetime of the program; e.g. initialization occurs once and once only and then the variable retains its value - whatever it has come to be - overall future calls to `foo()`.
        
- What does `extern` mean? When would you use it?
    - Does declaring a variable with `extern` reserve any additional space?
    - **TA Solution**
        - ***No!***
- **Student Solution**
    - Variable is defined in another class
    - The compiler does NOT allocate storage since it is defined elsewhere
    - For type checking of the identifier name only
    - Another C file must allocate storage by defining that var name (or function) used to extend the visibility of variables/functions
- **TA Solution**
    - ***Tells the compiler that the variable has been defined in another file***
    - ***You would use it when using variables that have already been defined and populated with data in another file***
- What is the difference between the following two function prototypes?
    - `void f();`
    - `void f(void);`
- **Student Solution**
    - any number of arguments can be passed while calling the f() function, but no argument can be passed in f(void).
    
    ```c
    void f(); // declaration and prototype
    void f(void); // declaration but not prototype
    ```
    
- **TA Solution**
    - void f();
        - ***There can be any amount of any type of parameters passed (including none)***
    - void f(void);
        - ***There must be no passed parameters***
- Practice question:
    
    Let's say file1.c contains the following code:
    
    ```c
        extern int foo;
        static int bar;
    
        static int baz(void) {
          volatile int i = 0;
          i++;
          return i;
        }
    ```
    
    And file2.c contains the following code:
    
    ```c
        int foo;
        static int bar;
    
        static int baz(void) {
          static unsigned int j = 0;
          j++;
          return j;
        }
    ```
    
    For the variables/functions foo, bar, baz, i, and j, answer the following:
    
    - Is the variable private to file1.c, private to file2.c, or visible to both files?
    - **Student & TA Solution**
        - foo : visible to both
        - bar : private to file1.c and private to file2.c
        - baz : private to file1.c and private to file2.c
        - i : private to file1.c
        - j : private to file2.c
    - Is the variable stored on the stack or in global/static memory?
    - **Student & TA Solution**
        - foo : global/static
        - bar : global/static
        - baz : global/static
        - i : stack
        - j : global/static
    - Is space reserved for this variables from both of the files (two separate variables with the same name), or from only one of the files?
    - **Student & TA Solution**
        - If both are static - Separate space is reserved for two separate variables in two separate files with the same name
        - If one is extern - Space is reserved for the variable in the file where it is declared (not the one that uses “extern”)

---

- You encounter the following definition **before the first function definition** in a file. What is its scope and where is F stored?
    
    ```c
    double F;
    ```
    
    1. Scope is all functions in the file; stored on the stack
    2. Scope is all functions in all files; stored in static memory
    3. Scope is the first function in the file; stored in static memory
    4. Scope is all functions in all files that include a corresponding **extern** declaration; stored on the stack
    5. Scope is all functions in all files that include a corresponding **extern** declaration; stored in static memory
    - Prof Solution
        
        **E**
        
- What is the type of p:
    
    ```c
    static const int *p;
    ```
    
    1. pointer to int
    2. static pointer to const int
    3. static pointer to int
    4. pointer to const int
    - Prof Solution
        
        **D**
        
        Remember:
        
        - Storage classes are not part of the type
        - Type qualifiers ARE part of the type
- Is the assignment legal?
    
    ```c
    struct mystruct_tag {
    	int myint;
    	char mychar;
    	char mystr[20];
    } ms;
    ms.mystr = "foo";
    ```
    
    1. The assignment is legal
    2. The assignment is illegal because “foo” is a different size than ms.mystr
    3. The assignment is illegal because “foo” is stored in the constant data section of memory
    4. The assignment is illegal because it is trying to assign an array to an array
    - Prof Solution
        
        **D**
        
- Is the initializer legal?
    
    ```c
    struct mystruct_tag {
    	int myint;
    	char mychar;
    	char mystr[20];
    };
    struct mystruct_tag ms = {42,'b',"Boo!"};
    ```
    
    1. The initializer is legal because a character array can be initialized to a string as a special case
    2. The initializer is illegal because “Boo!” is a different size than ms.mystr
    3. The initializer is illegal because “Boo!” is stored in the constant data section of memory
    4. The initializer is illegal because it is trying to assign an array to an array
    - Prof Solution
        
        **A**