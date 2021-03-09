#include "tm4c123gh6pm.h"

#define BLACK 0x00U
#define RED 0x02U
#define BLUE 0x04U
#define GREEN 0x08U
#define PURPLE 0x06U
#define YELLOW 0x0AU
#define CYAN 0x0CU
#define WHITE 0x0EU

// delay n milliseconds (16 MHz CPU clock)
void delay(int n)
{
  int delay = n * 3180;
  while (delay--)
    ;
}

int main()
{
    // PWM duty cycle
    int duty_cycle = 15999;
    // Enable Peripheral Clocks
    SYSCTL_RCGCPWM_R            |=  2;              // enable clock to PWM1
    SYSCTL_RCGCGPIO_R           |=  0x20;           // enable clock to PORTF
    SYSCTL_RCC_R                &=  ~0x00100000;    // no pre-divide for PWM clock
    // Enable port PF2 for PWM1 M1PWM7
    GPIO_PORTF_AFSEL_R          =   0x0E;           // PF2 uses alternate function
    GPIO_PORTF_PCTL_R           |=  0x000005550;
    GPIO_PORTF_DEN_R            =   0x0E;           // pin digital
    PWM1_2_CTL_R                =   0;              // stop counter
    PWM1_2_GENB_R               =   0x0000008C;     // M1PWM6 output set when reload,
    PWM1_3_CTL_R                =   0;              // stop counter
    PWM1_3_GENA_R               =   0x0000008C;     // M1PWM6 output set when reload,
    PWM1_3_GENB_R               =   0x0000008C;     // M1PWM6 output set when reload,
    // clear when match PWMCMPA
    PWM1_2_LOAD_R               =   16000;          // set load value for 1kHz (16MHz/16000)
    PWM1_2_CMPA_R               =   15999;          // set duty cycle to min
    PWM1_2_CTL_R                =   1;              // start timer
    PWM1_3_LOAD_R               =   16000;          // set load value for 1kHz (16MHz/16000)
    PWM1_3_CMPA_R               =   15999;          // set duty cycle to min
    PWM1_3_CTL_R                =   1;              // start timer
    PWM1_ENABLE_R               =   0xE0;           // start PWM1 ch7

    int colors[] = {RED, GREEN, BLUE};
    int colorIdx = 0;

    while (1)
    {
        GPIO_PORTF_DEN_R        =   colors[colorIdx]; // pin digital
        colorIdx                =   (colorIdx + 1) % (sizeof(colors) / sizeof(colors[0]));
        duty_cycle              =   duty_cycle - 50;
        if (duty_cycle <= 0)
        {
            while (1)
            {
            duty_cycle          =   duty_cycle + 50;
            if (duty_cycle >= 15999)
                break;
            PWM1_2_CMPA_R       =   duty_cycle;
            PWM1_3_CMPA_R       =   duty_cycle;
            delay(5);
            }
        }
        PWM1_2_CMPA_R           =   duty_cycle;
        PWM1_3_CMPA_R           =   duty_cycle;
        delay(5);
    }

    return 0;
}
