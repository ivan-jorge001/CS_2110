# Pseudo-ops and Memory Layout

Type: Quiz 3 Material

- Know the following pseudo-ops: `.orig`, `.end`, `.fill`, `.blkw`, `.stringz`
    - cheat sheet
        
        ![Untitled](Pseudo-ops%20and%20Memory%20Layout%202f58ea5b07ea460889cf8df82955bafa/Untitled.png)
        
    
    ## .FILL
    
    Reserve and fill a word with numeric value, initialization data with memeory
    
    - Example
        
        ![Screen Shot 2021-10-18 at 15.41.53.png](Pseudo-ops%20and%20Memory%20Layout%202f58ea5b07ea460889cf8df82955bafa/Screen_Shot_2021-10-18_at_15.41.53.png)
        
    - Fill array example(inefficient)
        
        ![Screen Shot 2021-10-18 at 15.42.56.png](Pseudo-ops%20and%20Memory%20Layout%202f58ea5b07ea460889cf8df82955bafa/Screen_Shot_2021-10-18_at_15.42.56.png)
        
    - Fill String example(inefficient)
        
        ![Screen Shot 2021-10-18 at 15.45.02.png](Pseudo-ops%20and%20Memory%20Layout%202f58ea5b07ea460889cf8df82955bafa/Screen_Shot_2021-10-18_at_15.45.02.png)
        
        .fill0 —> Identify where the String ends(Null terminator)
        
    
    ## .BLKW
    
    Block Word, Reserve n memories in a row —> Array 
    
    C.    .blkw 20 —> Set C to the current address and reserve 20 words of memory starting at C
    
    - Example(efficient)
        
        ![Screen Shot 2021-10-18 at 15.43.15.png](Pseudo-ops%20and%20Memory%20Layout%202f58ea5b07ea460889cf8df82955bafa/Screen_Shot_2021-10-18_at_15.43.15.png)
        
    
    ## .STRINGZ
    
    Store an ASCII string memory with a zero terminator, optionally naming it
    
    - Example
        
        ![Screen Shot 2021-10-18 at 15.46.08.png](Pseudo-ops%20and%20Memory%20Layout%202f58ea5b07ea460889cf8df82955bafa/Screen_Shot_2021-10-18_at_15.46.08.png)
        
    
    check slides for more info
    
    memory used is length of string + 1 (accounting for 0 to terminate string)
    
    Decimal: #
    
    Hex: x
    
    Binary: b
    
    - Times 6
        
        ![Screen Shot 2021-10-18 at 15.25.49.png](Pseudo-ops%20and%20Memory%20Layout%202f58ea5b07ea460889cf8df82955bafa/Screen_Shot_2021-10-18_at_15.25.49.png)
        
    
    BRP —> Branch if positive
    
    LC3 has 8 Registers R1 - R8
    
- What is the purpose of each of these pseudo-ops? How do they affect the resulting memory layout of your program?
- Example types of questions that you may be asked:
    - Compute the total amount of memory used by a sequence of pseudo-ops
    - Determine the address of data/an instruction based on `.orig`
    - Figure out what data gets placed at an address by a pseudo-op