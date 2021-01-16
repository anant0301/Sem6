## Design Consideration of Embedded Systems ##

__Primary Goal__: The system does the work it is made for

But in consideration for secondary goals there can be many more upgrades to the way the answer is achieved:
- Speed
- Quality
- Cost

The above when upgraded to a limit cause the trade off among themselves.
That is if we increase speed the cost increases and quality is also affected.


Common Design Metrics:
- __Non-Rexursing Engineering (NRE) Cost__: One-time initial cost of design the system
- __Unit Cost__: Cost invovled in making 1 copy of the emmbedded systen without NRE Cost
- __Size__: The physical size of the embedded system
- __Performance__: Measured in terms of time taken or throughput
- __Power__: The amount of power consumed by the system
- __Flexibility__: The ability to change the functionality without changing the purpose of the embedded system
- __Maintainability__: Wase/Difficulty of managing/modifying the system
- __Safety__: Adverse of product on operating environment
- __Time to Prototype__
- __Time to Market__
- Another Tradeoff is formed between: Performance, Size, Power and NRE Cost
    ![Sales vs Time](./Images/Sales%20vs%20Time%20Embedded%20System.png)

Dealing with the tradde-offs the need is to have a knowledge of software and hardware, but this process can be time consuming and hence the need for time to prototype and time to market.

The other way to improve the embedded system would be to use an optimized set of instructions... ARM set of instructions

The images contain the information explained in the class
![ARM versions](./Images/ARM%20versions.png)

ARM is RISC based:
- RISC is based on executing instructions in one cycle at a high clock frequency.
- The features in the design are:
    - Instruction - reduced/single cycle/fixed length
    - Pipelines - Decode in 1 stage / no need for microcode
    - Redisters
    - Load and Store
ARM is different from RISC:
- Some instrucrtinos have variable cycle execution
- In live barrel shifter in more complex inistrucction
- Thumb 16-bit instructoin set
- Conditional Execution
- Enhanced Instruction

![ARM prev Architecture](./Images/ARM%20prev%20Architecture.png)
![ARM Architecture](./Images/ARM%20Architecture.png)
