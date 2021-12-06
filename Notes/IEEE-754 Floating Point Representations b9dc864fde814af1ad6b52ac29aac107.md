# IEEE-754 Floating Point Representations

Type: Quiz 1 Material

# Notes

[Online Converter](https://www.h-schmidt.net/FloatConverter/IEEE754.html)

## IEEE-754 Double Breakdown

| 63 (1 bit) | 62...52 (8 bits) | 51...0 (23 bits) |
| --- | --- | --- |
| 0 | 00000000 | 00000000000000000000000 |
| sign | exponent | mantissa (significant) |

(-1)^**S** * 1.**M** * 2^(**E**-1023)

- Sign: (-1)^**S**
- 1 is understood: 1.
- Mantissa (w/o leading 1): .**M**
- Base: 2
- Exponent: **E**-1023

### Edge Cases

|  | E == 0 | 0 < E < 2047 | E == 2047 |
| --- | --- | --- | --- |
| M == 0 | 0 | Powers of Two | ∞ |
| M ≠ 0 | Non-normalized typically underflow | Ordinary Old Numbers | Not A Number |

## Properties

- Same basic idea as scientific notation
- Precise representation at the bit level
- Precise behavior of arithmetic operations
- Efficiency (Space & Time)
- Special values: not-a-number, +/-infinity, etc.
- Correct rounding
- Sortable without FP hardware
- Edge case for tiny numbers: E==0 is special, so 2-126 is smallest exponent; we use underflow case for anything smaller, like 2-127; note E==0 is computed as E==1
- the 32-bit form the exponent is biased by 127

## NaN Properties

- Suppose A is a floating point number set to NaN
- A != B is *true*, when B is another floating point number, NaN, infinity, or anything
- Interestingly A != A is true as well
- Also, if A or B is NaN, the following are always false:
    - A < B, A > B, A == B

## Converting variable types

- In CS 1331 we noted:
    
    ```c
    float f;
    int i;
    f = i;
    i = (int)f;
    ```
    
- What does this imply?
    1. Converting floats to ints we may lose information
    2. Converting ints to floats we may lose information
    3. Converting either way we may lose information

## Comparing Two FP Numbers

- The layout of the representation allows certain operations (like > ) to be performed with no conversion
- If either is NaN, the comparison is defined as “unordered” (all comparisons to it except != are false)
- If either is -0.0, replace with +0.0
- If the signs (high bit) are different, the positive number is bigger
- Compare the rest of the bits as integers
- If the signs are both negative reverse the comparison
- Example:
    
    A 0 10111000 11**0**01010 11001010 1100101
    
    B 0 10111000 11**1**01010 11001010 1100101
    
    |B| > |A|
    
    - Treat as 31-bit unsigned whole numbers
        - without the sign bits (bit 31)
    - And compare the two magnitudes bit by bit, left to right - until you find different values
    - Both are positive, so B>A

# Questions & Answers

**What’s the formula for finding what value a regular floating point number represents in terms of its sign, exponent, and mantissa?**

**How is the exponent represented? What are the range of possible values for the exponent?**

- **Challenge conceptual question: why do we not use a 2's complement number for the exponent part?**

## **Edge cases**

- **Given the sign, exponent bits, and mantissa, how can you tell when a floating point number is the following:**
    - **Infinity/negative infinity**
    - **Subnormal (a.k.a. denormalized)**
    - **0.0 or -0.0**
    - **Power of 2**
    - **NaN**
    - **A regular number (none of the above)**
- **What does "normalization" mean in the context of IEEE-754?**
- **What is a subnormal number? How is the formula for computing the value of a subnormal number different from the usual formula?**

**What are the different values that an IEEE-754 floating point number could represent if:**

- **It had a mantissa of 00000000000000000000000?**
- **It had an exponent of 00000000?**
- **It had an exponent of 11111111?**