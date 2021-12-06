# Logic and Truth Tables

Type: Quiz 1 Material

# Notes

## Combinational Logic

- A combination of AND, OR, NOT (plus NAND & NOR)
- The same inputs always produce same output
- Logic Gates
    
    ![Untitled](Logic%20and%20Truth%20Tables%20e9022e375d5545b6aeb130e28e9b2b60/Untitled.png)
    

## Boolean Logic

- Master Table:
    
    
    | A | B | A' | B' | A'B' | (A'B')' | A'+B' | (A'+B')' | A+B | AB |
    | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
    | 0 | 0 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 0 |
    | 0 | 1 | 1 | 0 | 0 | 1 | 1 | 0 | 1 | 0 |
    | 1 | 0 | 0 | 1 | 0 | 1 | 1 | 0 | 1 | 0 |
    | 1 | 1 | 0 | 0 | 0 | 1 | 0 | 1 | 1 | 1 |

## Formulas

### AND

```c
x & y = y & x
x & (y & z) = (x & y) & z
x & OxFFFF = x
x & 0 = 0
x & x = x
```

### OR

```c
x & y = y & x
x & (y & z) = (x & y) & z
x & OxFFFF = x
x & 0 = 0
x & x = x
```

### NOT

```c
~(~x) = x
```

### XOR

```c
x ^ y = y ^ x
x ^ (y ^ z) = (x ^ y) ^ z
x ^ 0 = x
x ^ y ^ y = x
x ^ x = 0
x ^ 0xFFFF = ~x
// Additionally, XOR can be composed using the 3 basic operations (AND, OR, NOT)
a ^ b = (a | b) & (~a | ~b)
a ^ b = (a & ~b) | (~a & b)
```

### Others

```c
x | (x & y) = x
x & (x | y) = x
~(x | y) = ~x & ~y
~(x & y) = ~x | ~y
x | (y & z) = (x | y) & (x | z)
x & (y | z) = (x & y) | (x & z)
x & (y ^ z) = (x & y) ^ (x & z)
x + y = (x ^ y) + ((x & y) << 1)
x - y = ~(~x + y)
```

### Boolean Algebra

- Boolean Summary
    - Algebraic Properties
        
        ![Untitled](Logic%20and%20Truth%20Tables%20e9022e375d5545b6aeb130e28e9b2b60/Untitled%201.png)
        
    - Algebraic Identities
        
        ![Untitled](Logic%20and%20Truth%20Tables%20e9022e375d5545b6aeb130e28e9b2b60/Untitled%202.png)
        
    - Useful Simplification Rules
        
        ![Untitled](Logic%20and%20Truth%20Tables%20e9022e375d5545b6aeb130e28e9b2b60/Untitled%203.png)
        
    - DeMorgan's Laws
        
        ![Untitled](Logic%20and%20Truth%20Tables%20e9022e375d5545b6aeb130e28e9b2b60/Untitled%204.png)
        
        ---
        
        ![Untitled](Logic%20and%20Truth%20Tables%20e9022e375d5545b6aeb130e28e9b2b60/Untitled%205.png)
        
- Simplification Example:
    1. F = A'B'C' + A'B'C + AB'C' + AB' C
    2. F = A'B'(C'+C) + AB'(C'+C)
    3. F = A'B' + AB'
    4. F = B'(A'+A)
    5. F = B

# Questions & Answers

**Convert the following boolean expressions to truth tables:**

- A | ~B
- A & (B ^ C), where (^) denotes XOR
- ~(~A & B)

**Using De Morgan’s law, which of the following expressions is equivalent to the expression A & ~B & C?**

- A | ~B | C
- ~(A | ~B | C)
- ~A | B | ~C
- ~(~A | B | ~C)

**Use De Morgan's law to rewrite the expression** ~(~A | (B & C)) **to use only AND (**&**) and NOT** **(**~**) operations**

**Simplify the following Boolean expression:** E = ABCD + BC + A’BC **or** (E = A&B&C&D | B&C | ~A&B&C)

E = ABCD + BC + A’BC

[use identity: a + ab = a]

ABCD + BC = BC

BC + A’BC = BC

E = BC