# Binary Arithmetic

Type: Quiz 1 Material

# Notes

Addition with unsigned or 2's complement binary numbers

Subtraction with 2's complement binary numbers

## Overflow

Extra digits that does NOT fit into the available bits.

Overflow occurs if:

- We get a carry in to sign bit but no carry out
- We get a carry out of the sign bit but no carry in

Overflow never occurs if we add a positive number with a negative number.

- Overflow Example
    
    ![Screen Shot 2021-09-12 at 15.47.06.png](Binary%20Arithmetic%20b51234ecae324798b0a379bf77d69a7f/Screen_Shot_2021-09-12_at_15.47.06.png)
    
    ---
    
    ![Screen Shot 2021-09-12 at 15.47.24.png](Binary%20Arithmetic%20b51234ecae324798b0a379bf77d69a7f/Screen_Shot_2021-09-12_at_15.47.24.png)
    

## Sign Extension

- Suppose we have a number which is stored in a four bit register
- We wish to add this number to a number stored in an eight bit register
- We have a device which will do the addition and it is designed to add two 8 bit numbers
- What issues do we need to deal with?
- To add bits to the left of a two’s complement number (i.e. make the number of bits bigger while representing the same numeric value)...
    - Fill the new bits on the left with the value of the sign bit!
- Example
    
    ![Untitled](Binary%20Arithmetic%20b51234ecae324798b0a379bf77d69a7f/Untitled.png)
    

## Adding a number to itself

$A+A=2\times A=A << 1$

- Examples
    
    ![Screen Shot 2021-09-12 at 15.52.37.png](Binary%20Arithmetic%20b51234ecae324798b0a379bf77d69a7f/Screen_Shot_2021-09-12_at_15.52.37.png)
    

# Questions & Answers

**How do you know overflow occurred when adding unsigned numbers?**

**What are the TWO ways to tell if overflow occurred in 2's complement addition/subtraction?**

**What is the sum of $101111_2$ and $001010_2$ ?**

$111001_2$