# State Machines

Type: Quiz 2 Material

One-hot Scheme

- Requires less amount of combinational logic to decode states
- better time margin
- Good for eco
- Good for FPGA and ASIC

Encoded Scheme

- Requires less # of flops
- Better for ASIC
    - not restricted by flops
    
    ![Untitled](State%20Machines%208774d3e15eed4fd18968d1996e8696e8/Untitled.png)
    
    # Questions and Answers
    
    ### What’s the difference between a one-hot state machine and a binary-reduced state machine?
    
    - Binary reduced is basically simplified version of one hot state machine
    
    [https://lh4.googleusercontent.com/CkMRmzWntNl0T4qpx6IlBW4Vf2FwxCA38OHxfqAOliVYcsrWzhxrAh-BAEU4GAekpBzm5BetCI2NdahrhdHQU-L5UvJsw0fa70cwDant_udvbCZDnxZ5aBb8yn9bwTcpWSldFf2D=s0](https://lh4.googleusercontent.com/CkMRmzWntNl0T4qpx6IlBW4Vf2FwxCA38OHxfqAOliVYcsrWzhxrAh-BAEU4GAekpBzm5BetCI2NdahrhdHQU-L5UvJsw0fa70cwDant_udvbCZDnxZ5aBb8yn9bwTcpWSldFf2D=s0)
    
    - Which would generally be faster (in terms of performance/maximum clock speed)?
        - One Hot
    - Which would generally be easier to create by hand?
        - One Hot (see [https://edstem.org/us/courses/8915/discussion/645529](https://edstem.org/us/courses/8915/discussion/645529))
            - In the one-hot example, the logic checking the state can simply use the one-hot bits for the multiplexing.
            - For the binary-encoded state, the logic has to include a load of decoder logic to convert the binary value to a one-hot value before it can do the multiplexing.
    - Which would generally require fewer logic gates to implement?
        - Binary encoded since it’s simplified
    
    ### Practice converting state diagrams to truth tables and vice versa
    
    - Review both of the problems on Homework 3
    
    ### Practice reading state machine circuits and translating them to state diagrams
    
    - For example: given the circuit of your one-hot state machine in Homework 3, translate it back into the state diagram without looking at the original
    - While you won’t need to actually build state machine circuits like in Homework 3, you should still be comfortable with the concepts from Homework 3.