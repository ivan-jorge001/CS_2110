# Signed Integer Representations

Type: Quiz 1 Material

# Notes

**We will NOT ask you to do arithmetic or conversions on sign-magnitude or 1's complement numbers**

## Unsigned Integer

Unsigned Integer is a 32-bit datum that encodes a nonnegative integer in the range [0 to 4294967295]. 

### Binary to Decimal Conversion

- $0100 0100_2 = 68_{10}$
    
    
    | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
    | --- | --- | --- | --- | --- | --- | --- | --- |
    | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 |
- $0011 1111_2 = 63_{10}$
    
    
    | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
    | --- | --- | --- | --- | --- | --- | --- | --- |
    | 0 | 0 | 1 | 1 | 1 | 1 | 1 | 1 |

### Binary Addition and Subtraction

Carry in if the bit value is > 1. Borrow if < 0.

- $00001111_2+00010001_2=00100000_2$
    - 15+17=32
- $110000_2-000011_2=101101_2$
    - 48-3=45

## Signed Integer

Signed Integer is a 32-bit datum that encodes an integer in the range [-2147483648 to 2147483647] —> Can represent negative numbers.

- Table representation of the three main methods
    
    
    | Binary (N = 4) | Unsigned | Signed Mag | 1's Comp | 2's Comp |
    | --- | --- | --- | --- | --- |
    | 0000 | 0 | 0 | 0 | 0 |
    | 0001 | 1 | 1 | 1 | 1 |
    | 0010 | 2 | 2 | 2 | 2 |
    | 0011 | 3 | 3 | 3 | 3 |
    | 0100 | 4 | 4 | 4 | 4 |
    | 0101 | 5 | 5 | 5 | 5 |
    | 0110 | 6 | 6 | 6 | 6 |
    | 0111 | 7 | 7 | 7 | 7 |
    | 1000 | 8 | -0 | -7 | -8 |
    | 1001 | 9 | -1 | -6 | -7 |
    | 1010 | 10 | -2 | -5 | -6 |
    | 1011 | 11 | -3 | -4 | -5 |
    | 1100 | 12 | -4 | -3 | -4 |
    | 1101 | 13 | -5 | -2 | -3 |
    | 1110 | 14 | -6 | -1 | -2 |
    | 1111 | 15 | -7 | -0 | -1 |

### Signed Magnitude

Flip the leading 0 to 1 to represent the negative sign.

### 1's Complement

Flip all the bits to represent the corresponding negative number.

- $-n=\backsim n$

### 2's Complement

Flip all the bits + 1 to represent the corresponding negative number

$-n=\backsim n + 1$

- What is 2's compliment representation for -13?
    
    $+13_{10} = 01101_{2}$
    
    $\backsim 01101_{2}=10010_{2}$
    
    $10010_{2}+1{2}=10011_{2}=-13_{10}$
    
    Binary Addition:
    
      $01101$
    
    +$10011$
    
    =$00000$
    
- Used in most computers today
- No need for a hardware subtractor, just a bitwise complement
- There exist only one 0
- Addition still works as expected from binary arithmetic (if you don’t wrap)
- The first bit still indicates the sign (as long as you will tolerate zero being positive)
- Easy calculation(Easy to find compliment of a number)
    - Since finding the complement is easy, there’s no need for subtraction: just complement and add

## Sign Extension

- Sign-extension is performed in order to be able to operate on bit patterns of **different lengths**. It does **not** affect the values of the numbers being represented.
- Positive Integer: +5 can be represented as 000101 or 0000000000000101
- Negative Integer: -5 can be represented as 11101 or 1111111111111011
- Example: +5 + -5 = 0
    - Incorrect: - not flipping leading 0s when representing negative integers
        
          $0000000000000101$
        
        +$0000000000111011$
        
        =$0000000001000000$
        
    - Correct: Flipping leading 0s when representing negative integers.
        
          $0000000000000101$
        
        +$1111111111111011$
        
        =$0000000000000000$
        
- More Sign Extension Examples
    - Add 3 and 64 (0011 and 01000000)
    - $0011+01000000=01000011$
    - Add -3 and 64 (1101 and 01000000)
        - $11111101+01000000=00111101$
            - Throw away the carried out 1

## Fractional Binary Numbers

| 8 | 4 | 2 | 1 | .5 | .25 | .125 | .0625 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | 0 | 1 | 0 | 1 | 1 | 0 | 0 |

$1101_{\land}1100=10.75_{10}$

# Questions & Answers

### **Conversions**

- **What's the formula for negating a binary number in 2's complement?**
    
    Invert all the bits and add one to the result
    
- **Convert the 2's complement binary number 0b11101010 into decimal**
- **Convert the decimal number -72 into 8-bit 2's complement binary**
- **How many bits would we need to represent the decimal number -1000 in 2's complement binary?**

**In 6-bit binary, what’s the range of possible values you can represent with:**

- **An unsigned number?**
- **A sign-magnitude number?**
- **A 1’s complement number?**
- **A 2’s complement number?**

**In n-bit binary, what’s the range of possible values you can represent with:**

- **An unsigned number?**
- **A sign-magnitude number?**
- **A 1’s complement number?**
- **A 2’s complement number?**

**On a conceptual level, why do we prefer 2’s complement over the other signed representations?**

- Used in almost all computers manufactured today
- Allows for low cost, high performance circuitry to do math operations
- There’s no need for a hardware subtractor, just a bitwise complement
- Useful Properties:
    - There is only one zero
    - Addition still works as expected from binary arithmetic (if you don’t wrap)
    - The first bit still indicates the sign (as long as you will tolerate zero being positive)
    - Finding the complement (additive inverse) of a number is easy
    - Since finding the complement is easy, there’s no need for subtraction: just complement and add
- Useful new pattern:
    - You can find the two’s complement of any number by flipping the bits and adding 1.
    - And a two’s complement conveniently represents the additive inverse of the originally represented number!

### How does one compute the additive inverse of a two’s complement number?

Take the boolean NOT of each bit and add 1