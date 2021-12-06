# LC-3 Instructions🤫

Type: Quiz 3 Material

This video saves lives:

[https://www.youtube.com/watch?v=6hhNNj67w1E&t=1294s](https://www.youtube.com/watch?v=6hhNNj67w1E&t=1294s)

![Untitled](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Untitled.png)

- LC3 Reference Sheet
    
    ![Screen Shot 2021-09-30 at 02.47.26.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_02.47.26.png)
    

Every instruction starts with 4 phase:

Fetch

Fetch

Fetch

Decode —> FSM

## FSM

FSM execute microcode

![Screen Shot 2021-10-18 at 15.23.38.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-10-18_at_15.23.38.png)

## Confusions:

- Clock Cycle
    
    You want to maximize what happens during a single clock cycle. There are 2 main obstacles that help determine what cannot happen during a single clock cycle.
    
    1. A register is only updated with its new value on the rising edge of the clock. If you need to use the value of the register you just set, then you must wait till the next clock cycle. An example of this would be a load instruction. If you set the value of MAR in the first clock cycle, then you must wait until the next clock cycle to read MAR. You cannot set and read from the register in the same clock cycle.
    
    2. Only one value can be on the bus at any given time. If you need to set 2 different registers with **different values**, this will take 2 clock cycles since only one value can be on the bus. An example of this would be a store instruction. You need one clock cycle to set MDR and another to set MAR.
    
- LD.CC
    
    Any time you do an instruction that changes the value of a register in the register file, you need to set the condition codes because there is a possibility that we require the sign of that value to determine branching (BR) logic. The exception to this rule is for LEA. LEA will always load into a register a binary string that represents an address. It doesn't make sense for an address to be signed, so we do not set a condition code for it. That also means you should not complete Branching logic based on LEA! It's just an address in memory. Instead, it would make more sense to load the data at that address since that could be a more meaningful value. We have made this note in the LC-3InstructionsDetail.pdf
    
    For the remainder of instructions that do set condition codes, since there is a possibility that they could store a meaningful number/result of math/ value (ie: not an address) into a register that means we need to set the cc's. We might not BR based on the CC each time we do one of these operations, but since that possibility does exist, we have to include setting CC in these instructions microcodes.
    
    EDIT: please note that when we change a value in memory (ie: perform a store) we do not set condition codes. This is because memory is not a register
    

# Fetch

- **IR <= Mem[(PC)]**
    
    Control Instructions
    
    1. Clock Cycle 1:
        1. PCMUX selects PC.MUX + 1
        2. LD.PC
        3. Gate.PC - allow data to flow from PC to bus
        4. LD.MAR - Load the data to memory
    2. Clock Cycle 2:
        1. MEM.EN/R - Memory read data
        2. (MDRMUX select memory - take data from memory and send to the bus)
        3. LD.MDR - Write data into the MDR
    3. Clock Cycle 3:
        1. Gate.MDR - Write data to the main bus
        2. Load.IR - Read data to the IR

# OPERATE:

## Add

- Definitions
    
    [https://lh3.googleusercontent.com/V_Pic8bzkHjMGU56sUTPaoWsMemddPmI0uuYQYLTJPT4Py1hW0-hX2IZpN7vXgmXB6Czv0uqDLivCw5RN4RvisIujDWORmJnux3DxSyKnfti4I5q2AzloE_Ky33nJ6k_vRV7blNd=s0](https://lh3.googleusercontent.com/V_Pic8bzkHjMGU56sUTPaoWsMemddPmI0uuYQYLTJPT4Py1hW0-hX2IZpN7vXgmXB6Czv0uqDLivCw5RN4RvisIujDWORmJnux3DxSyKnfti4I5q2AzloE_Ky33nJ6k_vRV7blNd=s0)
    
- **DR = (SR1) + (SR2)**
    
    Control Instruction
    
    One clock cycle
    
    1. (SR1MUX select IR[8:6])
    2. SR2MUX selects OUT
    3. ALUK select add - add SR1 and SR2 - 00
    4. GateALU - send added data to the bus
    5. LD.REG - write the data to the destination register
    6. LD.CC
- **DR = (SR1) + SEXT[IR[4:0]]**
    
    Control Instruction
    
    One clock cycle
    
    1. SR1MUX select IR[8:6] - 1
    2. SR2MUX selects SEXT[IR[4:0]] - Sign extended SR2
    3. ALUK select add - add SR1 and SR2
    4. GateALU - send added data to the bus - 1
    5. LD.CC - 1
    6. LD.REG - write the data to the destination register - 1

## AND

- Definitions
    
    [https://lh6.googleusercontent.com/O0RncND8YY5vkx4gPf38o3Of3C6TGsCfh8L_HjiwrhhOLNS0Z3fhGNB-yhpEmhl435jA-SpHYqS3NMlXignxBJUmzGcfi3mLEI7vkotZg7vqBfIKvP3s48S-dICbxby-zBx888s0=s0](https://lh6.googleusercontent.com/O0RncND8YY5vkx4gPf38o3Of3C6TGsCfh8L_HjiwrhhOLNS0Z3fhGNB-yhpEmhl435jA-SpHYqS3NMlXignxBJUmzGcfi3mLEI7vkotZg7vqBfIKvP3s48S-dICbxby-zBx888s0=s0)
    
- **DR = (SR1).(SR2)**
    
    One clock cycle
    
    1. (SR1MUX select IR[8:6]) - 1
    2. SR2MUX select SR2 OUT
    3. ALUK select AND - 01
    4. Gate.ALU - 1
    5. LD.CC - 1
    6. LD.REG - 1

## NOT

- Definitions
    
    [https://lh3.googleusercontent.com/HH7mjnm8yIeWOhHE4xGfxYRduDstMsmhoIZbbJa8F3_Ffm_Gr0cIslyamIM_ThJclaEa7UzDbJEQoj55-xeG3mM_iJ0kPczVEDX4ZD3yKNTM7S4-v71Y7ajVsobLqq2wnRoLgl1d=s0](https://lh3.googleusercontent.com/HH7mjnm8yIeWOhHE4xGfxYRduDstMsmhoIZbbJa8F3_Ffm_Gr0cIslyamIM_ThJclaEa7UzDbJEQoj55-xeG3mM_iJ0kPczVEDX4ZD3yKNTM7S4-v71Y7ajVsobLqq2wnRoLgl1d=s0)
    
- DR <= (SR1’)
    
    One clock cycle
    
    1. SR1MUX select IR[8:6] - 1
    2. ALUK Select NOT
    3. Gate.ALU - 10
    4. LD.CC  - 1
    5. LD.REG - 1

# LOADS:

## LEA(LOAD EFFECTIVE ADDRESS)

- Definitions
    
    *Puts the effective address (PC+offset) itself into a register (no memory access!)*
    
    [https://lh4.googleusercontent.com/coeIAMRagc1NXhE28V8ZbPxXnHNrse7OYL-3MI9wFTpr4IAPXOuV4uEmd-HKc47W8Y1YSHxMcdUVmt_4aGC0-nw8B2rYiTPiOe-mow3Plf5UYQ19y3BOL9sbSpv_FjnT4U2hVhuI=s0](https://lh4.googleusercontent.com/coeIAMRagc1NXhE28V8ZbPxXnHNrse7OYL-3MI9wFTpr4IAPXOuV4uEmd-HKc47W8Y1YSHxMcdUVmt_4aGC0-nw8B2rYiTPiOe-mow3Plf5UYQ19y3BOL9sbSpv_FjnT4U2hVhuI=s0)
    
- DR <= (PC) + SEXT(IR[8:0])
    
    One clock cycle
    
    1. ADDR1MUX Select PC - 0
    2. ADDR2MUX Select SEXT(PCoffset9/IR[8:0]) - 10
    3. MARMUX select ADDER - ADD also send data to MARMUX.gate instead of PC - 1
    4. Gate.MARMUX - Send data to the main bus - 1
    5. LD.REG - Take data from bus and load to destination register - 1
- Binary Encoding Example
    
    ![Screen Shot 2021-10-18 at 14.50.47.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-10-18_at_14.50.47.png)
    

## LD(LOAD)

- Definitions
    
    Puts the contents of some memory at the effective address (PC+offset) into a register
    
    [https://lh5.googleusercontent.com/E522d9Hee5ACMbx9P7sEzGVxVMY7qC9nq0FSnyylAZlbB1rX5OEQqH1g0JTYtlTsi0aiW4zlRuUcUJESdTXoewJo3_Oni7X8xZk96BLGZ9M9aL_vAcymTUAGgcBCU1n2T2vTcY1z=s0](https://lh5.googleusercontent.com/E522d9Hee5ACMbx9P7sEzGVxVMY7qC9nq0FSnyylAZlbB1rX5OEQqH1g0JTYtlTsi0aiW4zlRuUcUJESdTXoewJo3_Oni7X8xZk96BLGZ9M9aL_vAcymTUAGgcBCU1n2T2vTcY1z=s0)
    
    ![Screen Shot 2021-09-30 at 03.17.44.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_03.17.44.png)
    
- DR <= Mem[(PC) + SEXT(IR[8:0])]
    1. ClockCycle 1
        1. ADDR1MUX select PC - 0
        2. ADDR2MUX select SEXT(PCoffset9) - 10
        3. MARMUX select ADDER - 1
        4. Gate.MARMUX - 1
        5. LD.MAR - 1
    2. Clock Cycle 2
        1. MEM.EN - 1
        2. LD.MDR (MDRMUX selects Memory) - 1
    3. Clock Cycle 3
        1. Gate.MDR
        2. LD.REG
        3. LD.CC
    - Binary Encoding Example
        
        []()
        

## LDI(LOAD INDIRECT)

- Definitions
    
    **Goes to the effective address (PC+offset) and gets a value. Treats that value as another memory address, and gets data from there, into a register (hits memory twice)**
    
    ![Screen Shot 2021-09-30 at 02.52.45.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_02.52.45.png)
    
    ---
    
    ---
    
    ![Untitled](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Untitled%201.png)
    
    ---
    
    ![Untitled](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Untitled%202.png)
    

- $DR <= Mem[Mem(PC)+SEXT(PCoffset9)]$
    1. Clock cycle 1
        1. ADDR1MUX Select PC - 0
        2. ADDR2MUX Select SEXT(PCoffset9) - 10
        3. MARMUX selects ADDER - 1
        4. Gate.MARMUX - 1
        5. LD.MAR - 1
    2. Clock Cycle 2
        1. MEN.EN - 1
        2. LD.MDR(MDRMUX select memory) - 1
    3. Clock Cycle 
        1. Gate.MDR - 1
        2. LD.MAR - 1
    4. Clock Cycle 4
        1. MEN.EN - 1
        2. LD.MDR(MDRMUX select memory) - 1
    5. Clock Cycle 5
        1. Gate.MDR - 1
        2. LD.CC - 1
        3. LD.REG - 1
- Binary Encoding Example
    
    ![Screen Shot 2021-10-18 at 14.37.20.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-10-18_at_14.37.20.png)
    

## LDR(LOAD BASE + OFFSET)

- Definitions
    
    **Puts the contents of the effective address (base register+offset) into a register.**
    
    ![Screen Shot 2021-09-30 at 03.08.05.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_03.08.05.png)
    
- DR < = Mem[IR[8:6] + SEXT(IR[5:0])]
    1. Clock Cycle 1
        1. ADDR1MUX selects SR1OUT - 1
        2. ADDR2MUX selects SEXT(IR[5:0]) - 01
        3. MARMUX selects ADDER - 1
        4. Gate.MARMUX - 1
        5. LD.MAR - 1
    2. Clock Cycle 2
        1. MEN.EN - 1
        2. LD.MDR(MDR.MUX select Memory) - 1
    3. Clock Cycle 3
        1. Gate.MDR - 1
        2. LD.CC - 1
        3. LD.REG - 1
    

# STORES:

## ST(STORE)

- Definitions
    
    Puts the contents of a register into memory at the effective address (PC+offset).
    
    ![Screen Shot 2021-09-30 at 03.13.43.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_03.13.43.png)
    
- Mem[(PC) + SEXT(IR[8:0])] < = SR
    1. Clock Cycle 1
        1. ADDR1MUX select PC - 0
        2. ADDR2MUX select SEXT(IR[8:0]) - 10
        3. MARMUX select ADDER - 1
        4. Gate.MARMUX - 1
        5. LD.MAR - 1
    2. Clock Cycle 2
        1. SR1 - 0
        2. ALUK selects PASS - 11
        3. Gate.ALU —> Pass to bus and send it to MDR - 1
        4. LD.MDR(MDRMUX select BUS) —> Take the source register from BUS - 1
    3. Clock Cycle 3
        1. MEM.EN - 1
        2. R.W - 1
    
- Binary Encoding Example
    
    

## STR(STORE BASE + OFFSET)

- Definitions
    
    Puts the contents of a register into memory at the effective address (base register+offset)
    
    ![Screen Shot 2021-09-30 at 03.41.21.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_03.41.21.png)
    
- Mem[(IR[8:6]) + SEXT(offset6)] < = SR
    1. Clock Cycle 1
        1. (SR1MUX select IR(8:6))
        2. ADDR1MUX select BaseR - 1
        3. ADDR2MUX select SEXT(offset6) - 01
        4. MARMUX select ADDER - 1
        5. Gate.MARMUX - 1
        6. LD.MAR - 1
    2. Clock Cycle 2
        1. Gate.ALUK - 1
        2. ALUK select PASS - 11
        3. LD.MDR - 1
    3. Clock Cycle 3
        1. MEM.EN - 1
        2. R.W. - 1
- Binary Encoding Example
    
    ![Screen Shot 2021-10-18 at 14.48.20.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-10-18_at_14.48.20.png)
    

## STI(STORE INDIRECT)

- Definitions
    
    Puts the contents of a register into a memory location whose address is stored in memory at the effective address (PC+offset). (Hits memory twice!)
    
    ![Screen Shot 2021-09-30 at 03.41.08.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_03.41.08.png)
    
- Mem[Mem[(PC) + SEXT(IR[8:0])]] < = SR
    1. Clock Cycle 1
        1. ADDR1MUX select PC - 1
        2. ADDR2MUX select SEXT(IR[8:0]) - 10
        3. MARMUX select ADDER - 1
        4. Gate.MARMUX - 1
        5. LD.MAR - 1
    2. Clock Cycle 2
        1. MEM.ER - 1
        2. LD.MDR (MDRMUX select Memory) - 1
    3. Clock Cycle 3
        1. GATE.MDR - 1
        2. LD.MAR - 1
    4. Clock Cycle 4
        1. Gate.ALUK - 1
        2. ALUK select PASS - 11
        3. LD.MDR - 1
    5. Clock Cycle 5
        1. MEM.EN - 1
        2. R.W. - 1

# CONTROL:

## JMP(JUMP)

- Definition
    
    ![Screen Shot 2021-09-30 at 03.42.12.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_03.42.12.png)
    
- PC < = (BaseR)
    1. (SR1MUX select IR[8:6])
    2. (ADDR1MUX select SR1OUT)
    3. ADDR2MUX select ZERO
        1. PCMUX select ADDER —> Add SR1 with 0(Changes nothing) and send to PC
    4. LD.PC

## BR(CONDITIONAL BRANCH)

- Definitions
    
    ![Screen Shot 2021-09-30 at 03.45.42.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_03.45.42.png)
    
- PC < = (PC) + SEXT(IR[8:0]) iif (N.n + Z.z + P.p)
    1. ADDR1MUX select PC
    2. ADDR2MUX select SEXT(IR[8:0])
    3. PCMUX select ADDER
    4. LD.PC iif (N.n + Z.z + P.p)
    

## JSR & JSRR(JUMP TO SUBROUTINE)

- Definition
    
    ![Screen Shot 2021-09-30 at 03.49.52.png](LC-3%20Instructions%F0%9F%A4%AB%20495c63032ed144c6ae5c72dd8b391358/Screen_Shot_2021-09-30_at_03.49.52.png)
    
- JSR
    
    R7 < = (PC).      PC < = (PC) + SEXT(IR[10:0])
    
    1. GatePC
    2. DRMUX select [111]
    3. LD.REG
    4. ADDR1MUX select PC
    5. ADDR2MUX select SEXT(IR[10:0])
    6. PCMUX select ADDER
    7. LD.PC
- JSRR
    
    R7 ≤ PC.    PC < = (BaseR)
    
    - Instruction 1
        1. GatePC
        2. DRMUX select [111]
        3. LD.REG
    

## TRAP