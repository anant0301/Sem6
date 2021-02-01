#define SYSCTL_RCGCGPIO_R       (*((volatile unsigned long *)0x400FE608))
#define GPIO_PORTF_DIR_R        (*((volatile unsigned long *)0x40025400))
#define GPIO_PORTF_DEN_R        (*((volatile unsigned long *)0x4002551C))
#define GPIO_PORTF_DATA_R       (*((volatile unsigned long *)0x400253FC))
#define GPIO_PORTF_PUR_R        (*((volatile unsigned long *)0x40025510))
#define GPIO_PORTF_CR_R         (*((volatile unsigned long *)0x40025524))
#define GPIO_PORTF_PUR_R        (*((volatile unsigned long *)0x40025510))

int main() {
    // Enable Port F from the clock gating register
    SYSCTL_RCGCGPIO_R = 0x20;
    // Put the direction of the Port F as output = 1 for 3 LEDs and PF4 for pull up switch in the bit position 1, 2, 3, 4 => 0x1E
    GPIO_PORTF_DIR_R = 0x1E;
    // Enable digital transfer between the Port F and the output
    GPIO_PORTF_DEN_R = 0x0E;
    // remove write protect from the ports
    GPIO_PORTF_CR_R = 0xFF;
    // enable the pull up 
    GPIO_PORTF_PUR_R = 0x10;
    
    int counter = 0;
    while (1)
    {
        while (GPIO_PORTF_DATA_R & 0x10 == 0);
        // delay  to counter the debouncing effect
        // for (unsigned int i = 0; i < 100000; i++);
        counter += 2;
        GPIO_PORTF_DATA_R = counter;
        counter %= 16;
    }
}