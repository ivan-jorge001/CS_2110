# Pointers/Arrays/Pointer Arithmetic

Type: Quiz 4 Material

# Notes

## Pointers

- Act like dot operator
- No runtime checking
- Pointers contain memory addresses (or NULL)
    - If you try to dereference a pointer containing NULL you will cause a segmentation fault
- They also have a type
    - This refers to the type of the data AT that memory address.
    - There is also a special case: void pointers which point to a memory address but there is no type for the data at the address

& is the “address of” operator; you use it to obtain a pointer to
an existing data item

- used in place of object references
- example1
    
    ![Screen Shot 2021-11-03 at 19.49.01.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_19.49.01.png)
    
    &b —> Address of b. & means the address of
    
    * is a pointer to the address
    

To reference what a pointer points to, we use the dereference
operator * (acts like “indirect” in LC-3 loads and stores)

- In a type declaration, * means “pointer to” and is part of the type
    - ** would mean pointer to pointer to
- In an expression, * is the “dereference” operator – it acts as the “indirect” in the LC-3 loads and stores
- When applied to a pointer, * makes the expression mean “What this pointer points to”

![Screen Shot 2021-11-03 at 19.52.30.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_19.52.30.png)

Declaration: *px —> pointer to px

Expression: get the data px points to

- example2
    
    ![Screen Shot 2021-11-03 at 19.49.21.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_19.49.21.png)
    
    RHS: *badder —> the int that badder points to.
    
    *badder + 2 is the int result of the addition
    
    LHS *badder shows the direction it goes
    
- example3
    
    ![Screen Shot 2021-11-03 at 19.49.50.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_19.49.50.png)
    
    The value stored at b has been changed to 18; baddr still contains the address of b
    
- example4
    
    ![Screen Shot 2021-11-03 at 19.56.34.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_19.56.34.png)
    

## Pointers and Arrays

int a[10]; —> a is an array, size 10, of int

int *p; —> p is a pointer to int (memory address)

***In an expression, an array name becomes a constant pointer to the first element***

- a is the memory address where the array starts
- a can’t be changed (but its contents can)
- In other words, it’s the address of a[0] (or specifically &a[0])
- Example
    
    ![Screen Shot 2021-11-03 at 20.03.22.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_20.03.22.png)
    
- Arrays can decay to pointers to their first element. And you can treat a pointer like an array, since array notation is a shorthand for pointer arithmetic
- But they are not the same:
    - Arrays are fixed-size and cannot be reassigned. They refer to a specific region of memory.
    - A pointer is just a variable that holds a memory address.

## Strings and Pointers

char str[6] = “Hello”;

char *s;  —> pointer to the first character of str

## Pointer Arithmetic

Can ADD and SUBTRACT pointers and integers

int *p = &i;

p = p + 1;   —> is interpreted as p = p + 1 * sizeof(*p);

(if p is an int pointer, p + 1 is the address of the next int – the address in p is incremented by the size of an int)

- Cheat Sheet
    
    [https://lh4.googleusercontent.com/XXzriagAsg60VzXPTSxdCL-xmoTvgBv8eZbCePxQmAw0qzxHMLJyzVI_QTFsY65Z-cO9BvXtAIn2KZQoxfTikqhp4QUh-_Ms7ZpDFFxmxzNq7r6d1O-N_5KQ3Gm8VB8FhICbLl2j](https://lh4.googleusercontent.com/XXzriagAsg60VzXPTSxdCL-xmoTvgBv8eZbCePxQmAw0qzxHMLJyzVI_QTFsY65Z-cO9BvXtAIn2KZQoxfTikqhp4QUh-_Ms7ZpDFFxmxzNq7r6d1O-N_5KQ3Gm8VB8FhICbLl2j)
    
- Example
    
    ![Screen Shot 2021-11-03 at 20.07.54.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_20.07.54.png)
    
- Pointer Arithmetic example
    
    ![Screen Shot 2021-11-03 at 20.09.19.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_20.09.19.png)
    
- More Pointer Arithmetic example
    
    ![Screen Shot 2021-11-03 at 20.10.44.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_20.10.44.png)
    

This also applies to arrays: 

1. int arr[4]; 
2. arr[3] = 12; 
3. *(arr + 3) = 12
- The above evaluates to **arr + 3*sizeof(int)** to get the correct physical address of the fourth element.
- pointer arithmetic automatically takes the sizeof the element type into account in pointer arithmetic
    - ***Ex 1:***
        
        ```c
        *int arr[4];
        arr[3] = 12;* //Same as prev line...evaluates to *(arr + 3*sizeof(int))
        ```
        
    - ***Ex 2:***
        
        ```c
        int *y;
        y+2; // evaluates to y+2*sizeof(int)
        ```
        

## Pointers to Structs

—***> Operator***

***The left operand must be a pointer to struct and the right operand a struct member***

A shorthand for *

- Example
    
    ![Screen Shot 2021-11-03 at 20.12.29.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-03_at_20.12.29.png)
    

## Implementing a call-by-reference function with pointers

SWAP function

No pointers(bad!)

![Screen Shot 2021-11-10 at 15.36.07.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.36.07.png)

![Screen Shot 2021-11-10 at 15.36.14.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.36.14.png)

![Screen Shot 2021-11-10 at 15.36.21.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.36.21.png)

![Screen Shot 2021-11-10 at 15.35.28.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.35.28.png)

- Pointers(Good!)
    
    ![Screen Shot 2021-11-10 at 15.36.50.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.36.50.png)
    
    ![Screen Shot 2021-11-10 at 15.37.01.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.37.01.png)
    
    ![Screen Shot 2021-11-10 at 15.37.09.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.37.09.png)
    
    ![Screen Shot 2021-11-10 at 15.37.17.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.37.17.png)
    
- Another way to do pointers
    
    ![Screen Shot 2021-11-10 at 15.38.01.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.38.01.png)
    

# Arrays

- They declare a fixed-size sequence of same-typed elements
- They are laid out consecutively in memory
- You can also make arrays of pointers
- Unlike in Java, you cannot count on uninitialized data to be NULL or 0; it is simply un-initialized (just like assembly!)
- Like in assembly, arrays are essentially just two pieces of information: the address of the first element and the length of the array
- “Address of first element” == “pointer to first element”
- Arrays decay to pointers: we can choose to lose the length and implicitly convert an array to a pointer to its first element

Find the dimension of an Array IN SCOPE(not a parameter):

sizeof(ary) / sizeof(ary[0])

If the array is passed as a parameter:

Must pass the length with the array

## Initializing Arrays

Use values in braces "{}"

int ib[5] = {5,4,3,2,1};

or:

int ib[] = {5,4,3,2,1,0};

or

char cb[] = {'x', 'y', 'z'};

or

char cb[] = "hello";  —> cb: h e l l o \0, size = 6

or 

char *cb = "hello"; —> pointer to the address that contains "hello", size is the size of the memory address

- Example cb[] vs *cb
    
    char c1[] = "hello" 
    
    char #c2 = "hello"
    
    sizeof(c1) == 6 //array size including the null terminator \0
    
    sizeof(c2) == 8 //size of a pointer on your system
    
    strlen(c1) == 5 
    
    strlen(c2) == 5
    
    ![Screen Shot 2021-11-10 at 16.18.25.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.18.25.png)
    
    ![Screen Shot 2021-11-10 at 16.19.46.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.19.46.png)
    
- More array example(POINTER ARITHMETIC)
    
    ![Screen Shot 2021-11-10 at 16.24.10.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.24.10.png)
    
    ![Screen Shot 2021-11-10 at 16.24.39.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.24.39.png)
    
    ia is a constant, cannot assign value to a constant
    
    ![Screen Shot 2021-11-10 at 16.25.09.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.25.09.png)
    
    ![Screen Shot 2021-11-10 at 16.26.17.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.26.17.png)
    
    IT WORKS!!! But don't write it like this
    

- In-class Quiz
    
    ![Screen Shot 2021-11-10 at 16.29.16.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.29.16.png)
    
    #2 is illegal since we cannot assign something to an array name
    
- In-class Quiz
    
    ![Screen Shot 2021-11-10 at 16.30.09.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.30.09.png)
    
    Cannot assign value to an array name
    

- Looping through an array(POINTER ARITHMETIC)
    
    ![Screen Shot 2021-11-10 at 16.44.21.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.44.21.png)
    
    Pointer Arithmetic doesn't have multiplication(ia[i])
    
- Looping through an array(SWAP)
    
    ![Screen Shot 2021-11-10 at 16.48.21.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.48.21.png)
    
    Correct implementation of swap_pointers
    
    ![Screen Shot 2021-11-10 at 16.47.26.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_16.47.26.png)
    
    **a —> pointer to a pointer to an int
    
    in the function, exchange pointers
    

## Array as arguments

char s[10] = “Hello”;

void test(char *s) {

printf(“%s\n”, s);

}

int main(int argc, char *argv[]) {

test(s);

test(&s[0]);

}

**To pass an array into a function, we pass a pointer to the first element.** 

**Note that an array name in an expression (function call) is automatically promoted to a pointer to its first element.** 

**This includes strings (arrays of char)**

### Sizeof()

- Know how the sizeof operator works in C
    - Know that the sizes of common datatypes like int are not guaranteed
    - Know that the size of a struct is the sum of the sizes of its components (we will be assuming that the compiler does not pad structs with empty space)
- cheat sheet
    
    [https://lh4.googleusercontent.com/kxeI3UXWRZVbzAWK1INvmaGQzx-QaRpoE3bOWlfoV3zGtuqxdWRon9qozujhA1fhG4IHg2xhO76hcchtVWvr7XfjvpiPHPSQ3LbXza9wJ_j6pDqBg7cQkQ5CWU5Q_eMue9xxBLw3](https://lh4.googleusercontent.com/kxeI3UXWRZVbzAWK1INvmaGQzx-QaRpoE3bOWlfoV3zGtuqxdWRon9qozujhA1fhG4IHg2xhO76hcchtVWvr7XfjvpiPHPSQ3LbXza9wJ_j6pDqBg7cQkQ5CWU5Q_eMue9xxBLw3)
    

# Questions & Answers

Practice question: Assume we're on a machine where `sizeof(int) = 4` and `sizeof(int *) = 4`. Given

```
int c[3];
```

Which of the following are equivalent to `c[1]`? There may be more than one correct answer.

- `&(c + 1)[0]`.
- `*(c + 1)`
- `*(int **)((char *) c + 4)`
- `*((char *) c + 4)`
- `(c + 3)[-2]`
- `*(int *)((char *) c + 1)`
- `1[c]`
- Aiden Solution
    - &(c + 1)[0] - ***Incorrect ; address of element at index 1 rather than the element itself***
    - (c + 1) ***Correct***
    - (int *)((char *) c + 4); ***Correct - ???***
    - ((char *) c + 4); ***Incorrect (Dereferencing a char pointer when we want an int)***
    - ((char *) c + 1); ***Incorrect (Dereferencing a char pointer when we want an int). Also offset is incorrect, that 1 is being multiplied by sizeof(char), which is 1, not sizeof(int), which is 4***
    - &c[1][0];  ***Correct***
- Student & TA Solution
    - &(c + 1)[0] ***Incorrect ; address of element at index 1 rather than the element itself***
    - (c + 1) **(this one)**
    - (int *)((char *) c + 4)**(this one)**
    - ((char *) c + 4)
    - (c + 3)[-2] **(This one) 3-2 = 1**
    - (int *)((char *) c + 1)
    - &c[1][0] **(this one)**

Practice question: Assume we're on a machine where `sizeof(int) = 4`. What would the following program print?

```c
int main(void) {
  struct coord {
    int x; // 0x4 bytes
    int y; // 0x4 bytes
  };
  struct coord coords[10];  // assume this starts at address 0x4000
  printf("%p\n", &coords[4].y);
}
```

- Student & TA Solution
    
    **0x4000 + #36 = 0x4024**
    

---

- In-class quiz questions
    
    ![Screen Shot 2021-11-10 at 15.39.30.png](Pointers%20Arrays%20Pointer%20Arithmetic%20405db25b4c99434bba1c7b74f32a954b/Screen_Shot_2021-11-10_at_15.39.30.png)
    
- why is &(c+1)[0] not equal to c[1] but &c[1][0] is equal to c[1]?
- TA Solution
    
    Basically, the pointer arithmetic is the same but using brackets (like [0]) also dereferences, so the second expression dereferences twice and the first only once. &(c+1)[0] gets the ADDRESS of the first index, while c[1] and &c[1][0] gets the actual VALUE of the first index