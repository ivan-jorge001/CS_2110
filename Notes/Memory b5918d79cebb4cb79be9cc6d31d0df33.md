# Memory

Type: Quiz 2 Material

Address Space -- How many addresses are possible?

Addressability -- How big is each memory location

- If you have a memory with a 16-bit address in which each byte is given a distinct memory address, the addressability of the memory this memory is 8 bit.
- If you have a memory with a 16-bit address in which each byte is given a distinct memory address, the address space of this memory is $2^{16}=65536$

# Basic building block of a memory

- Register
    - Gated D Latch
- Decoder
- Multiplexors
- A $2^3*3$-bit Word Memory
    
    ![Screen Shot 2021-09-27 at 14.36.17.png](Memory%20b5918d79cebb4cb79be9cc6d31d0df33/Screen_Shot_2021-09-27_at_14.36.17.png)
    

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

# Questions & Answers

### If you have a memory with a 16-bit address in which each byte is given a distinct memory address, what is the addressability of this memory?

8 bits

### If you have a memory with a 16-bit address in which each byte is given a distinct memory address, what is this memory’s address space?

$2^{16}=$ 65536

### **What is the difference between address space and addressability?**

Computer memory is made up of distinct memory addresses, each containing some amount of data

- Address space: the number of memory addresses that exist
- Addressability: the amount of data stored at any given memory address
    - An n-bit address line can represent 2n memory addresses

### What are the address space and addressability if

- A memory address is 13 bits, and there are 16 bits of data at each memory address?
    - Address space: $2^{13}$
    - Addressability: 16 bits
- There are 1024 memory addresses and the memory is byte-addressable?
    - Address space: 1024
    - Addressability: 8 bits
- There are 2048 memory addresses and the memory is 8KiB (8⨯1024⨯8 bits) in total?
    - Address space : 2048
    - Addressability : 65536 / 2048 = 32 bits
- A memory unit has 4KiB (4⨯1024⨯8 bits) of total storage and every bit has its own address?
    - Address space: 4x1024x8
    - Addressability: 1 bit since every bit has its own address
- The "address" input of a memory unit is 16 bits wide and the "data" input of the memory unit is 32 bits wide?
    - Address space: $2^{16}$
    - Addressability: 32