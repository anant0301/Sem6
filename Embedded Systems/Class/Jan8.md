## Ports ##

###  GPIO Ports Working and Programming for input or output ###
- All GPIO ports have Read-Modify-Write 
- The direction of 1 port pin can be specified .. whether input or output
- The ports are by deafult closed and can be opened by setting there clock gating register as such
- Decide the use of the port, as in the way the input-output flows


1. ### Digital IO Ports ### 
    - Usually ports support this input form unless the ports are divided to serve a particular function
1. ### Analog IO Port ###
    - Usually there is a conversion required from Analog to digital by ADC
    - The resolution of the port = Range / 2 ^ (output_bits)
1. ### Pulse Width Modulation (PWM) Port ###
    - These ports are used to reduce average power delivered by an electrical signal. This is done by effectively chopping it into discrete parts.
    ![Duty Cycle](./Images/Duty%20Cycle.png)
    - This chopping down percentage is called duty cycle
    - > = Ton / (Ton + Toff)
    - > Output Voltage = duty cycle * Max input voltage
1. ### Serial Peripheral Interface (SPI) Port ###
    - Full Duplex and Synchronus Communication between 
    - Mainly used for short distance communication
    - Uses Master-Slave communication, the 4 type of signals are:
        - SCLK: Serial Clock (output from master)
        - MOSI: Master Out Slave In (data output from master)
        - MISO: Master In Slave Out (data output from slave)
        - SS: Slave Select (often active low, output from master)
        ![SPI Signals](./Images/SPI%20MasterSlave.png)
        ![SPI Communication](./Images/SPI%20Communication.png)
        ![SPI Communication](./Images/SPI%20Communication2.png)
1. ### Integrated Integrated Circuit (I2C- I-squared-C) Port ### 
    - Synchronous 
    - 2 Wire interface - Only 2 of this type ports are present in the 

        ![2 Wire Interface](./Images/I2C_2%20Wire%20Interface.png)
1. ### Interrupt  ###
    - These are not actual ports but an feature of ports to pass the input to the hardware when an event occurs.
    - These may be internal or external 
    - These are used as;
        - Detect Pin Change
        - Watchdog Timer
        - Timer Interrupt for comuptation
1. ### UART GPIO Port ##
    - Asynchronous Communication
    - Add start stop bits before and after diagram
1. ### Control Area Network (CAN) ### 
1. ### Peripheral Interface ### 
 