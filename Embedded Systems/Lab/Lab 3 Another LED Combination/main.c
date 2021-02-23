#include "headers.h"
int main (void)
{
    SYSCTL_RCGCGPIO_R = 0x20; // Enable clock for PORT F
    GPIO_PORTF_LOCK_R = 0x4C4F434B; // Unlock commit reg
    GPIO_PORTF_CR_R = 0x01; // Unlock PF0
    GPIO_PORTF_DEN_R = 0x1F; // Enable pins 0 to 4
    GPIO_PORTF_DIR_R = 0x0E; // Pins 0 and 4 input - pins 1,2,3 output
    GPIO_PORTF_PUR_R = 0x11;
    unsigned int SW1;
    unsigned int SW2;
    unsigned int counter = 0;
    unsigned long i = 0;
    while (1)
    {
        // switch debouncing 
        for(i = 0; i < 500000; ++i);
      
        SW1 = GPIO_PORTF_DATA_R & 0x10; // Read PF4 into SW1
        SW2 = GPIO_PORTF_DATA_R & 0x01; // Read PF0 into SW2

        if (!SW1 && !SW2) { // Both pressed
          counter = 0;
        } else if (!SW1) { // SW1 pressed
            counter += 0x02; 
        } else if (!SW2) { 
            counter -= 0x02; 
        }
        counter %= 16;
        GPIO_PORTF_DATA_R = counter;
    }
}