### Pipelining ###
A k-stage pipelining reduced the time from 
> T = n * t 

to 

> T = ((k-1) + N) * t

### Mode in ARM ###

Mode | Normal 
---|--- 
User | Normal execution, can be interrupted by modes of higher priority
Fast Interrupt Query (IRQ) | High priority interrupt request 
Interrupt Request (IRQ) | Low priority interrupt
Supervisor | A protected mode for the OS
Abort | Used to handle memory access violation
Undefined | used to handled undefined instructions
System | Run privelege OS task
