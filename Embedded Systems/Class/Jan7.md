## Introduction to Embedded Systems ## 

**Definition**: Embedded system is a system where aa microcontroller based on a microprocessor based programmable system is embedded in a larger system.

**Microcontroller Compoenents**
- Ports, Sensors, Actuators, Interfaces, Software (firmware), Hardware

### Things about of Embedded System ###
1. Special Purpose
    - The purpose of complete embedded system is 1 but to make this purpose happen there can be many functions in this but only 1 purpose of the complete system
1. Tight Constraints
    - Low Price
    - Low Power
    - Portable
1. Reactive
    - The system should react to external input any form it is meant to.
1. Real Time
    - The real time constraints include- finish the job before the deadline 
1. Software
    - Inside embedded system software is called firmware
    - Stored in the ROM or flash drive not hard-drive like storage

Some features 
1. Stand Alone
1. Real Time
    - Soft Real Time- Constraints are like a deadline, doing before the job is acceptable
    - Hard Real Time- Constraints on time are more particular and doing at the time of job is the only acceptable format
1. Network Information Application 
    - Useful in the IoT devices
    - Cyber Physical System
1. Mobile Devices

### Architectures Processors ###
--- 
| von-Neumann Architecture | Howard Architecture |
| --- | --- |
| Memory Shared between data and code | Separate Mempry for data and code |
| Different number of clock cycles for operations of data and code | Same number of clock cycles for data and code operations |
| Simple Design | Complex Design |
| High Speed, less time |  Low Speed, more time.. relatively |
--- 

### Differentiating Processors ###
Basis - Instruction Set Architecture (**ISA**)
- ISA defined complexity of processor
- ISA differs in every processor
- Two Types of ISA
    - RISC - Reduced Instruction Set Computer
    - CISC - Complex Instruction Set Computer

--- 
| CISC | RISC |
| --- | --- |
| Large Set of instructions | Smaller set of instruction |
| Variable instruction length | same instruction length |
| More instructions so easy to program | Difficult to program due to limited instruction set |
| Simple to design | Complex design |
| Many Addressing mode | Particular Addressing mode |
| High Clock speed | Low Clock speed |
| Pipelining not possible | Pipelining Possible |
---

### Element of Embedded System boards ###
1. Connectivity elements- USB, RJ45-Ethernet
1. Computation Elements- CPU, Timer, Interuppt Controller
1. Memory Interface- DDR1, DDR2..  ## no idea what it means but i think some kind of memory device and 
1. Graphics- GPU = Graphical Processing Unit
1. Storage Interfaces- MMC, SD-Card, SDIO
1. Input-Output Interfaces- Sensors and Actuators- UART, SPI, 12C, CAN
 