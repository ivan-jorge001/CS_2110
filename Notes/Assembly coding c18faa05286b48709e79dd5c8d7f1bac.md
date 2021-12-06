# Assembly coding

Type: Quiz 3 Material

Translate ASSEMBLY LANGUAGE to MACHINE LANGUAGE

## First Pass Assembly —>Generating the Symbol Table

![Screen Shot 2021-10-18 at 15.53.58.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_15.53.58.png)

## Second Pass - generating the ML program

![Screen Shot 2021-10-18 at 15.55.45.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_15.55.45.png)

## Assembly to Machine Example

![Screen Shot 2021-10-18 at 15.57.46.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_15.57.46.png)

## Pseudo-instructions

![Screen Shot 2021-10-18 at 16.00.14.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.00.14.png)

HALT —> Call a system utility routine(TRAP). Trap takes one 8-bit unsigned number(0-255)

TRAP x25 —> Computer stops.

HALT is a pseudo instruction that contains TRAP x23

![Screen Shot 2021-10-18 at 16.03.07.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.03.07.png)

RET —> Jump(1100) to R7

# Make instructions using ML

## Substract

NOT R3, R3 ;flip the bits of R3

ADD R3, R3, #1 ;add 1 to R3 ;now R3 is -R3

ADD R1, R2, R3

## OR(R1 = R2 | R3)

NOT R2, R2     ;R2 = ~R2

NOT R3, R3     ;R3 = ~R3

AND R1, R2, R3     ;R1 = ~R2 & ~R3

NOT R1, R1     ;R1 = ~(~R2 & ~R3)

## Clear

AND R1, R1, #0 ;R1 = R1 & 0

;anything and zero is zero

## R1 = R2

ADD R1, R2, #0     ;R1 = R2+0; R1 = R2

# BR vs JMP

![Screen Shot 2021-10-18 at 16.13.15.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.13.15.png)

## BR!!

![Screen Shot 2021-10-18 at 16.15.17.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.15.17.png)

# WHILE

![Screen Shot 2021-10-18 at 16.23.01.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.23.01.png)

![Screen Shot 2021-10-18 at 16.18.21.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.18.21.png)

![Screen Shot 2021-10-18 at 16.19.55.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.19.55.png)

# IF statement

![Screen Shot 2021-10-18 at 16.21.49.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.21.49.png)

- IF(A == 0 && B == 0)
    
    ![Screen Shot 2021-10-18 at 16.24.24.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.24.24.png)
    
- IF(A == 0 || B == 0)
    
    ![Screen Shot 2021-10-18 at 16.25.49.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.25.49.png)
    
- Example
    
    ![Screen Shot 2021-10-18 at 16.27.15.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.27.15.png)
    
    ![Screen Shot 2021-10-18 at 16.27.31.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.27.31.png)
    

# FOR loop

![Screen Shot 2021-10-18 at 16.22.35.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.22.35.png)

- Example
    
    ![Screen Shot 2021-10-18 at 16.28.12.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.28.12.png)
    
    ![Screen Shot 2021-10-18 at 16.28.22.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.28.22.png)
    
- Example2
    
    

# Do while

![Screen Shot 2021-10-18 at 16.23.33.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.23.33.png)

# Array Addressing

![Screen Shot 2021-10-18 at 16.30.45.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.30.45.png)

# Indexing into an Array

![Screen Shot 2021-10-18 at 16.33.31.png](Assembly%20coding%20c18faa05286b48709e79dd5c8d7f1bac/Screen_Shot_2021-10-18_at_16.33.31.png)