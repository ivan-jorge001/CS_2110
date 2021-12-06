# Subroutine and Stack

Type: Quiz 3 Material

Subroutine is another name for function

There is no “function” abstraction in LC-3 assembly. Need to create our own abstraction

![Screen Shot 2021-10-18 at 16.56.14.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_16.56.14.png)

## JSR(Jump to Subroutine)

Saves the PC value into R7 and then sets PC to the target1.

R7 = PC*

*PC = PC** + PCOffset11

PC-offset addressing (usually called with a label)

Note the order is important; we need to save the PC before changing it

## JSRR(Jump to Subroutine, Register)

Same as JSR, but uses a register for the subroutine's address instead of a label/offset

R7 = PC*

PC = SR

## RET(Return)

A special case of JMP. Equivalent to JMP R7

PC = R7

This is actually a “pseudo-instruction” since it assembles to the exact same bits as JMP R7

# The Stack

- The stack is a location in memory that is useful for storing temporary program data
    - Subroutine calls –parameters, return values
    - Local variables –what if our 8 registers aren’t enough

Grows “downwards” towards smaller memory addresses from a fixed starting location

LAST IN FIRST OUT

![Screen Shot 2021-10-18 at 17.01.20.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.01.20.png)

![Screen Shot 2021-10-18 at 17.01.55.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.01.55.png)

![Screen Shot 2021-10-18 at 17.02.37.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.02.37.png)

![Untitled](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Untitled.png)

How to call a subroutine

- Push Argument in reverse order
- JSR

After subroutine returns

- Pop return value(on the stack)
- Pop the arguments
    
    If don't pop, the stack overflow
    
    ![Screen Shot 2021-10-18 at 17.27.39.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.27.39.png)
    
- Example - Calling a subroutine
    
    ![Screen Shot 2021-10-18 at 17.31.54.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.31.54.png)
    
- Symmetry of Caller
    
    ![Screen Shot 2021-10-18 at 17.32.22.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.32.22.png)
    

# Frame Pointer

![Screen Shot 2021-10-18 at 17.03.40.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.03.40.png)

# Calling Conventions

![Screen Shot 2021-10-18 at 17.04.22.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.04.22.png)

![Screen Shot 2021-10-18 at 17.22.32.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.22.32.png)

![Screen Shot 2021-10-18 at 17.37.05.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.37.05.png)

![Screen Shot 2021-10-18 at 17.40.35.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.40.35.png)

If you only have one variable, subroutine will always be the same

If there are two or more, need to allocate more space

# Building up the stack

![Screen Shot 2021-10-18 at 17.04.50.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.04.50.png)

![Screen Shot 2021-10-18 at 17.33.36.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.33.36.png)

![Screen Shot 2021-10-18 at 17.34.08.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.34.08.png)

# Subroutine calling a subroutine

![Screen Shot 2021-10-18 at 17.05.16.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.05.16.png)

![Screen Shot 2021-10-18 at 17.06.37.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.06.37.png)

# Questions

- What is the stack? What is it used for?
- What do the values in R5, R6, and R7 represent in the LC-3?

R5 - frame pointer

R6 - stack pointer

R7 - return address

- What is a "frame pointer"? Why do we need it?

Points to the first local variable on the stack. Exists to directly reference everything under it (stack frame up to that point is constant and never different. Everything after the frame pointer is dynamic and cant literally point to anything consistently.

- How do you push a value onto the stack?

![Untitled](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Untitled%201.png)

DO NOT HAVE TO INITIALIZE R6 

- How do you pop a value off of the stack?

![Untitled](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Untitled%202.png)

- What if stack is already full/empty?
    - Before pushing, test overflow
    - Before popping, text underflow
- Stack points to heap —> Stack Overflow

![Untitled](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Untitled%203.png)

![Screen Shot 2021-10-18 at 17.45.02.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.45.02.png)

![Screen Shot 2021-10-18 at 17.45.13.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.45.13.png)

![Screen Shot 2021-10-18 at 17.45.29.png](Subroutine%20and%20Stack%20a5115851daa24e1d9143dc721a3717ce/Screen_Shot_2021-10-18_at_17.45.29.png)