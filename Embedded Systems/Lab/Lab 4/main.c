#include <time.h>
#define SYSCTL_RCGCGPIO_R (*((volatile unsigned long *)0x400FE608))
#define GPIO_PORTC_DIR_R (*((volatile unsigned long *)0x40006400))
#define GPIO_PORTC_DEN_R (*((volatile unsigned long *)0x4000651C))
#define GPIO_PORTC_DATA_R (*((volatile unsigned long *)0x400063FC))

void delay(float );
int main()
{
    SYSCTL_RCGCGPIO_R = 0x04; // ClockGating Enable for PORTC
    GPIO_PORTC_DIR_R = 0xF0;  // Data Direction ==> Output 
    GPIO_PORTC_DEN_R = 0xF0;  // Digital Enable for PORTC ports
    while (1)
    {
        // Setting data values in the registers for output
        GPIO_PORTC_DATA_R = 0x00;
        delay(0.020); // 0000
        GPIO_PORTC_DATA_R = 0x10;
        delay(0.020); // 0001
        GPIO_PORTC_DATA_R = 0x20;
        delay(0.020); // 0010
        GPIO_PORTC_DATA_R = 0x30;
        delay(0.020); // 0011
        GPIO_PORTC_DATA_R = 0x40;
        delay(0.020); // 0100
        GPIO_PORTC_DATA_R = 0x50;
        delay(0.020); // 0101
        GPIO_PORTC_DATA_R = 0x60;
        delay(0.020); // 0110
        GPIO_PORTC_DATA_R = 0x70;
        delay(0.020); // 0111
        GPIO_PORTC_DATA_R = 0x80;
        delay(0.020); // 1000
        GPIO_PORTC_DATA_R = 0x90;
        delay(0.020); // 1001
        GPIO_PORTC_DATA_R = 0xA0;
        delay(0.020); // 1010
        GPIO_PORTC_DATA_R = 0xB0;
        delay(0.020); // 1011
        GPIO_PORTC_DATA_R = 0xC0;
        delay(0.020); // 1100
        GPIO_PORTC_DATA_R = 0xD0;
        delay(0.020); // 1101
        GPIO_PORTC_DATA_R = 0xE0;
        delay(0.020); // 1110
        GPIO_PORTC_DATA_R = 0xF0;
        delay(0.020); // 1111
    }
  return 0;
}
void delay(float sec)
{
  float millisec = 1000 * sec;
  clock_t startTime = clock();
  while (clock() < (startTime + millisec))
    ;
}
