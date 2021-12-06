# Bitwise Operations

Type: Quiz 1 Material

# Notes

## What is “Bitwise”?

- Traditional Boolean functions are defined on Boolean values (i.e. True and False)
- When we have two strings of bits, we often apply a Boolean function to pairs of respective bits in the two strings
- We refer to this operation on two arrays of bits as a “bitwise” operation

## Operations

- *Can only be applied to integral operands*

### AND, &

```c
// 4 bit example:
0101 & 0110 = 0100
```

### OR, +, |

- Truth Table:
    
    
    | A | B | A OR B, A | B, A + B |
    | --- | --- | --- |
    | 0 | 0 | 0 |
    | 0 | 1 | 1 |
    | 1 | 0 | 1 |
    | 1 | 1 | 1 |

```c
// 4 Bit Example
0101 | 0110 = 0111
```

### NOT, Complement, Inversion

- Truth Table:
    
    
    | A | NOT A, ~A, A' |
    | --- | --- |
    | 0 | 1 |
    | 1 | 0 |

### XOR, ^

- Truth Table
    
    
    | A | B | A XOR B, A ^ B |
    | --- | --- | --- |
    | 0 | 0 | 0 |
    | 0 | 1 | 1 |
    | 1 | 0 | 1 |
    | 1 | 1 | 0 |

```c
// 4 Bit Example:
0101 ^ 0110 = 0011
```

### NAND, ~(A & B)

- Truth Table
    
    
    | A | B | A NAND, B ~(A & B) |
    | --- | --- | --- |
    | 0 | 0 | 1 |
    | 0 | 1 | 1 |
    | 1 | 0 | 1 |
    | 1 | 1 | 0 |

```c
// 4 Bit Example:
~(0101 & 0110) = 1011
```

### NOR, ~(A | B)

- Truth Table:
    
    
    | A | B | A NOR B, ~(A | B) |
    | --- | --- | --- |
    | 0 | 0 | 1 |
    | 0 | 1 | 0 |
    | 1 | 0 | 0 |
    | 1 | 1 | 0 |

```c
// 4 bit example:
~(0101 | 0110) = 1000
```

### Shifting

- *The left shift and right shift operators should not be used for negative numbers. The result of is undefined behavior if any of the operands is a negative number.*
- Left Shift, <<
    
    ```c
    // 4 Bit Example:
    7 << 2 // 0111 Leftshift 10
    0111 // Before
    1100 // After
    ```
    
- Right Shift, >>
    
    ```c
    // 4 Bit Example #1:
    7 >> 2 // 0111 Rightshift 10
    0111 // Before
    0001 // After
    // 4 Bit Example #2:
    13 >> 2 // 1101 Rightshift 10
    1101 // Before
    0011 /* or */ 1111 // After
    ```
    

## Comprehensive Boolean Functions Truth Table

| P | Q | FALSE | P AND Q | ~(P → Q) P AND ~Q | ~(Q → P) ~P AND Q | P ≠ Q P XOR Q | P or Q |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 | 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 1 | 0 | 0 | 0 | 1 |

| P | Q | P NOR Q | P == Q ~(P XOR Q) | ~Q | Q → P P or ~Q | ~P | P → Q ~P or Q  | P NAND Q | TRUE |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 1 |
| 1 | 1 | 0 | 1 | 0 | 1 | 0 | 1 | 0 | 1 |

## Bit Vectors

- Sometimes for reasons of space efficiency we can effectively store a group of booleans packed together in a single byte/word/etc.
- Diagram:
    
    
    | Position | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
    | --- | --- | --- | --- | --- | --- | --- | --- | --- |
    | Value | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
    - Note that Item 5 & 2 are in use
- Often we use a constant (a.k.a. **mask**) with a boolean function (four bit examples)
- CLEAR:: $wxyz_2$ & $1111_2 == wxyz_2$
    - So put a zero in any bit you want to clear
        - $wxyz_2$ & $1101_2 == wx0z_2$
- SET:: Identity: $wxyz_2 | 0000_2 == wxyz_2$
    - So put a one in any bit you want to set
        - $wxyz_2 | 0100_2 == w1yz_2$
- TOGGLE: $wxyz_2$ ^ $1111_2=w'x'y'z'_2$
    - So put a one in any bit you want to toggle
        - $wxyz_2$ ^ $1000_2 == w'xyz_2$
- TEST
    - To test a bit, clear all the rest
        - $wxyz_2$ & $0010_2 == 00y0_2$
        - Now you can test $00y0_2 == 0000_2$
- To put a 1 in any bit position n in a mask, shift left by n
    - $1 << 2 == 0100_2$
- To put a zero in position in a mask, put a one in that position and complement
    - $~(1 << 2) == 1011_2$
    - (creates as many leading ones as you need)

# Questions & Answers

**How would you set bits 7, 8, and 9 (indexed from 0) of a number? Clear them? Toggle them?**

**How can you use << and >> to make a mask in more complicated problems?**

**How can you multiply a number by 8 using bitwise arithmetic?**

**You are given a 16-bit unsigned binary number, x. To test if bit 8 (numbered from right to left starting at 0) is 1, you could use which of the following:**

- **~x + 256 == ~1**
- **x | 256 != 0**
- **x & (1<<8) ≠ 0**
- **X & (1>>8) != 0**

x & (1<<8) ≠ 0

**Why is x = x & ~077 better than x = x & 0177700?**

First one is independent of word length(no extra cost...evaluated at compile time)

**What does this do? (x >> (p+1-n)) & ~(~0 << n);**

```c
/* getbits: get n bits from position p */
unsigned getbits(unsigned x, int p, int n) {
    return (x >> (p + 1 - n)) & ~(~0 << n);
}
```

**How would you negate in 2’s complement using bitwise operators and the plus operator?**

~x+1