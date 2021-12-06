# Sequential Logic

Type: Quiz 2 Material

![Screen Shot 2021-09-27 at 14.46.06.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_14.46.06.png)

[https://www.allaboutcircuits.com/textbook/digital/chpt-10/](https://www.allaboutcircuits.com/textbook/digital/chpt-10/edge-triggered-latches-flip-flops/)

- Requires STORAGE ELEMENT
- Output depends on input plus STATE
- Analogous to an RLR combination lock
- Used to build memory & STATE MACHINE

## RS Latch

The Q and not-Q outputs are supposed to be in opposite states.

Having both S and R equal to 1 is invalid/illegal

![Screen Shot 2021-09-27 at 04.32.41.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_04.32.41.png)

![Screen Shot 2021-09-27 at 04.31.06.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_04.31.06.png)

## Gated SR-Latch

When the E=0, the outputs of the two AND gates are forced to 0, regardless of the states of either S or R. Consequently, the circuit behaves as though S and R were both 0, latching the Q and not-Q outputs in their last states.

Only when the enable input is activated will the latch respond to the S and R inputs.

![Screen Shot 2021-09-27 at 04.42.52.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_04.42.52.png)

## Gated D-Latch

![Screen Shot 2021-09-27 at 04.43.24.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_04.43.24.png)

![Screen Shot 2021-09-27 at 04.45.51.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_04.45.51.png)

![Screen Shot 2021-09-27 at 04.56.09.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_04.56.09.png)

## Edge-triggered(Leader-Follow) Flip Flop

Edge-triggering: The circuit’s data inputs have control only during the time that the enable input is transitioning from one state to another. (It is desirable to limit the responsiveness of a latch circuit to a very short period of time instead of the entire duration that the enabling input is activated.)

- Positive Edge-trigger
    
    ![Screen Shot 2021-09-27 at 04.57.40.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_04.57.40.png)
    
- Negative Edge-trigger
    
    ![Screen Shot 2021-09-27 at 04.58.10.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_04.58.10.png)
    

![Screen Shot 2021-09-27 at 05.02.25.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_05.02.25.png)

![Screen Shot 2021-09-27 at 05.02.37.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_05.02.37.png)

Full circuit:

![Screen Shot 2021-09-27 at 14.29.49.png](Sequential%20Logic%20467920cebf01406bad97eb9555b0bd90/Screen_Shot_2021-09-27_at_14.29.49.png)

# Questions and Answers

- What’s the difference between sequential and combinational logic?
    - Sequential: outputs of the circuit depend on both the current inputs and previous values of the inputs
    - Combinational: the outputs of the circuit depend only on the current combination of inputs.
- Classify the following into examples of sequential or combinational logic:
    - An XOR gate ***Combinational***
    - An RS latch ***Sequential***
    - A state machine ***Sequential***
    - An ALU ***Combinational***
    - The LC-3 ***Sequential***
    - A register ***Sequential***
    - A multiplexer ***Combinational***
- Level-triggered vs. edge-triggered logic
    - What’s the difference between level-triggered and edge-triggered logic?
        - Level-triggered
            - RS Latch & Gated D-Latch
            - The output can only change when the enable bit is 1.
            - When the enable bit is set to 0, then the output is unaffected by changes in the input
        - Edge-triggered
            - D Flip-Flops (Rising edge-triggered), Registers, State Machines
            - Many sequential logic circuits are based on clocks instead of enable bits
            - Rising-edge triggered logic : The output can only change when the clock changes from 0 to 1
            - Falling-edge triggered logic : the output can only change when the clock changes from 1 to 0
        - What do each look like as waveforms? (Hint: a recent lab has a waveform diagram comparing level- and edge-triggered logic.)
            
            [https://lh3.googleusercontent.com/EFfGSPStoF7aAfbMegTVovHaF5ohVqh502ka_IUEoM68pocuTSOU4aVy_3mPS6qON-p8tXEEXByLkT14fD8kjE9nkRcqAMYSi5__kFNhGE_aDNphBYs2hArsWNZ7pmlwDu0UvygH=s0](https://lh3.googleusercontent.com/EFfGSPStoF7aAfbMegTVovHaF5ohVqh502ka_IUEoM68pocuTSOU4aVy_3mPS6qON-p8tXEEXByLkT14fD8kjE9nkRcqAMYSi5__kFNhGE_aDNphBYs2hArsWNZ7pmlwDu0UvygH=s0)
            
- What are the three fundamental sequential logic circuits we covered? Which ones are level-triggered and which ones are edge-triggered?
    - RS Latch (level)
    - Gated D-Latch (level)
    - D Flip-Flops (edge)
- The D flip-flop we covered is a kind of leader-follower flip flop. What does this mean, and what is the purpose of the leader-follower design?
    - The left D-latch updates when the clock is 0, and the right D-latch updates when it is 1.