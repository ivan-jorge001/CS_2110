# Digital Logic

Type: Quiz 2 Material

## Transistors

- N-type vs P-type
    - N-type
        
        With the supply voltage applied to the device, the transistor acts like a closed or connected switch
        
        ![Screen Shot 2021-09-22 at 15.59.26.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_15.59.26.png)
        
        ![Screen Shot 2021-09-22 at 15.59.40.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_15.59.40.png)
        
    - P-type
        
        With the supply voltage applied to the device the transistor acts like a open or disconnected switch
        
        ![Screen Shot 2021-09-22 at 15.58.58.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_15.58.58.png)
        
        ![Screen Shot 2021-09-22 at 15.58.36.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_15.58.36.png)
        

## Boolean Logical gates

![Screen Shot 2021-09-22 at 16.02.06.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_16.02.06.png)

Check HW2 for gate designs

- De Morgan's Law
    
    ![Screen Shot 2021-09-22 at 16.05.20.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_16.05.20.png)
    
    ![Untitled](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Untitled.png)
    
- Conte Bubble Theorem
    
    ![Screen Shot 2021-09-22 at 16.06.58.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_16.06.58.png)
    
- Larger Gates
    
    ![Screen Shot 2021-09-22 at 16.07.38.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_16.07.38.png)
    

## Combinational Logic

A combination of AND, OR, NOT (plus NAND & NOR), The same inputs always produce same output.

- Decoder
    
    For a decoder of n bit input, there is $2^n$ output at most.
    
    ![Screen Shot 2021-09-22 at 16.11.31.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_16.11.31.png)
    
    /t
    
- Multiplexer
    
    The basic multiplexer has 1 output, n control lines, and $2^n$ inputs. 
    
    In truth table terms: output is on left, input is at bottom, case fulfills on right
    
    ![Screen Shot 2021-09-22 at 16.13.45.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-22_at_16.13.45.png)
    
- Full Adder
    
    ![Screen Shot 2021-09-27 at 03.48.38.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-27_at_03.48.38.png)
    
    Truth table:
    
    ![Screen Shot 2021-09-27 at 03.49.22.png](Digital%20Logic%20d7da40971e8f47efa6b6c520e42a50d9/Screen_Shot_2021-09-27_at_03.49.22.png)
    

# Questions and Answers

- Basics
    - Be able to read basic circuits (as presented in CircuitSim) and understand the symbols used for common logic gates and other components
        - Common gates ([N]AND, [N]OR, X[N]OR, NOT, etc.)
        - Splitters
        - Multiplexers, decoders
        - Adders, registers
    - Converting boolean expressions to and from logic gates
- Decoders
    - What is the high-level purpose of a decoder? What are some circumstances where a decoder is useful?
        - Decoders set exactly one output based on which of the input bits are set.
        - A decoder has the property that exactly one of its outputs is 1 and all the rest are 0s. The one output that is logically 1 is the output corresponding to the input pattern that it is expected to detect.
        - Circumstances where a decoder is useful
            - The [Decoders](https://en.wikipedia.org/wiki/Decoder) were used in analog to digital ==conversion in analog decoders.
            - Used in electronic circuits to convert instructions into CPU control signals.
            - They are mainly used in [logical circuits](https://www.elprocus.com/basic-logic-gates-with-truth-tables/), data transfer.
    - If a decoder has a 5-bit input/selector, what is the maximum number of outputs it can have?
        - $2^5=32$
    - If a decoder has an n-bit input/selector, what is the maximum number of outputs it can have?
        - $2^n$
    - If you need a decoder with 23 outputs, how many input bits do you need?
        - 5 since 4 would only get you 16 outputs
    - Know how to visually trace through circuits containing a decoder (e.g., determine what a combinational circuit using a decoder would output for a given input)
- Multiplexer
    - What is the high-level purpose of a multiplexer? What are some common applications for multiplexers? Where did you need to use multiplexers in Homework 2?
        - Selects between inputs using a selector
        - Multiplexers are used in various applications wherein multiple data need to be transmitted by using a single line (ex: communication system, computer memory, telephone network)
        - In Hw2, muxes were used in the ALU, depending on the code, an arithmetic operation would be performed and outputted.
    - If a multiplexer has an n-bit selector, how many inputs can it have?
        - $2^n$
    - If a multiplexer has 23 inputs, how many selector bits do you need?
        - 5 since next highest power of 2 after 23 is 32
    - If a multiplexer has a 6-bit selector, how many outputs does it have?
        - There is only 1 output no matter the number of selector bits.
    - Know how to visually trace through circuits containing a multiplexer (e.g., determine what a combinational circuit using a multiplexer would output for a given input)