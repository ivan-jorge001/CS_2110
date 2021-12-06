# LC-3 Basics

Type: Quiz 2 Material

# Legendary LC3 video:

[https://www.youtube.com/watch?v=6hhNNj67w1E&t=2685s](https://www.youtube.com/watch?v=6hhNNj67w1E&t=2685s)

![Screen Shot 2021-09-27 at 15.49.12.png](LC-3%20Basics%20434adee1546d4a6a9dbb75b8f729a224/Screen_Shot_2021-09-27_at_15.49.12.png)

![Screen Shot 2021-09-27 at 17.45.27.png](LC-3%20Basics%20434adee1546d4a6a9dbb75b8f729a224/Screen_Shot_2021-09-27_at_17.45.27.png)

![Screen Shot 2021-09-27 at 14.54.10.png](LC-3%20Basics%20434adee1546d4a6a9dbb75b8f729a224/Screen_Shot_2021-09-27_at_14.54.10.png)

# Questions and Answers

- What is a bus?
    
    A 16-bit wire that transfers data between many components
    
- Why can we only have one value on the bus at a time (what would happen otherwise)? What component do we use to control which value is on the bus?
    - Only one value at a time to prevent short circuit
    - Transit buffer
        - Helps in making sure there is only one value on the bus
        - Allow us to choose whether or not to write a value
            
            ![Screen Shot 2021-09-27 at 15.47.54.png](LC-3%20Basics%20434adee1546d4a6a9dbb75b8f729a224/Screen_Shot_2021-09-27_at_15.47.54.png)
            
- What does the value in the PC represent?
    - holds the current program counter-address of the next instruction to execute
    - three ways to update PC
        - PC + offset
        - PC + 1
        - Given a value for the PC via the bus
- What does the value in the IR represent?
    - holds the value of the current instruction
    - having the correct value in the IR helps the FSM determine the current state and send the correct control signals
    - a new value can be read from the bus (with signal LD.IR) and the current value is directly connected to relevant components
    - 
        
        [https://lh3.googleusercontent.com/yO2Nrup_dIPpiwb6AShJLACYuUdbaCuknnYYQVrT-6iQ0v7OKsUlK4OYVEcTQ-PxGRTajxDdIPhmbxoN6odLiUJpuPoLGQ3Fu3MmZnf5i8yvT-ZlwaawkH4O49tYjwYSfH1qrDis=s0](https://lh3.googleusercontent.com/yO2Nrup_dIPpiwb6AShJLACYuUdbaCuknnYYQVrT-6iQ0v7OKsUlK4OYVEcTQ-PxGRTajxDdIPhmbxoN6odLiUJpuPoLGQ3Fu3MmZnf5i8yvT-ZlwaawkH4O49tYjwYSfH1qrDis=s0)
        
- What is the role of the microcontroller in the LC-3
    - Finite State Machine (FSM)
    - Every instruction has a series of states to execute it
    - Like in HW3, each state has
        - A set of outputs (control signals like ALUK, LdReg, etc.)
        - The next state to go to
    - Ensure that correct operations take place while preventing short circuits
        
        [https://lh6.googleusercontent.com/CHhxb9CAan_42Qv3cuEVceyou879P53oUC1-o7u60uyLCuz9tvXGK034weEcsmh7uwkos86Cc-EGvhNRq6k5tfSzoraTlICNrR-_e3ftM4YdI8_UA7BxTMi30SWGWY5euen_xa9M=s0](https://lh6.googleusercontent.com/CHhxb9CAan_42Qv3cuEVceyou879P53oUC1-o7u60uyLCuz9tvXGK034weEcsmh7uwkos86Cc-EGvhNRq6k5tfSzoraTlICNrR-_e3ftM4YdI8_UA7BxTMi30SWGWY5euen_xa9M=s0)
        
- Instructions
    
    [https://www.youtube.com/watch?v=yZChqRqPluI](https://www.youtube.com/watch?v=yZChqRqPluI)