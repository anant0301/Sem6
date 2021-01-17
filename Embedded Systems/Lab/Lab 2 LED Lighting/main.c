#include <time.h>
void seconds(int sec);
int main() {
    // Enable Port F from the clock gating register
    *((unsigned int *) 0x400FE608U) = 0x20;
    // Put the direction of the Port F as output = 1 for 3 LEDs in the bit position 1, 2, 3 => 0x0E
    *((unsigned int *) 0x40025400U) = 0x0E;
    // Enable digital transfer between the Port F and the output
    *((unsigned int *) 0x4002551CU) = 0x0E;
    
    while (1)
    {
        // Red LED
        *((unsigned int *) 0x40025008U) = 0x02;
        // seconds(1);
        *((unsigned int *) 0x40025008U) = 0x00;
        
        // Blue LED
        *((unsigned int *) 0x40025010U) = 0x04;
        // seconds(2);
        *((unsigned int *) 0x40025010U) = 0x00;
        
        // Green LED
        *((unsigned int *) 0x40025020U) = 0x08;
        // seconds(3);
        *((unsigned int *) 0x40025020U) = 0x00;
    }
    return 0;
}

void seconds(int sec) {
    for (int i = 0; i < sec; ++i) 
    {
        for (int j = 0; j < CLOCKS_PER_SEC - 10; ++j);
    }
}