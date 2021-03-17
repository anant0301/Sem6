#include "tm4c123gh6pm.h"

void printChar(char c);
void printString(char* string);
char readChar(void);

int main() {
    SYSCTL_RCGCUART_R           |=  0x1;                                /* Enable UART module 0 */
    SYSCTL_RCGCGPIO_R           |=  (0x1<<0);                           /* Enable Port A */
    
    /* Port F Configuration */
    SYSCTL_RCGCGPIO_R           |=  (0x1<<5);                           /* Enable Port F */
    GPIO_PORTF_DEN_R            =   (0x1<<1) | (0x1<<2) | (0x1<<3);     /* Digital Enable PF[3:1] */
    GPIO_PORTF_DIR_R            =   (0x1<<1) | (0x1<<2) | (0x1<<3);     /* Output PF[3:1] */
    GPIO_PORTF_DATA_R           =  ~(0x1<<1) | (0x1<<2) | (0x1<<3);     /* Turn off PF[3:1] */

    /* Port A Configuration */
    GPIO_PORTA_AFSEL_R          =   (0x1<<1) | (0x1<<0);                /* Set Alternate function */       
    GPIO_PORTA_PCTL_R           =   (0x1<<4) | (0x1<<0);                /* Output from PA[1:0] */
    GPIO_PORTA_DEN_R            =   (0x1<<1) | (0x1<<0);                /* Enable PA[1:0] */

    /* UART Configuration */
    UART0_CTL_R                 &=  ~(1<<0);                            /* Disable the UART by clearing the UARTEN */

    /* Bits per Second = 9600 */
    /* BRD = 16,00,000 / (16 * 9600) = 104.166666666666666666666*/
    /* Baud Rate = 104.16667 */  
    UART0_IBRD_R                =   104;                                /* integer portion of the BRD */
    UART0_FBRD_R                =   11;                                 /* fractional portion of the BRD */
    
    UART0_LCRH_R                =   (0x3<<5);                           /* 8-bit, no parity, 1-stop bit */
    UART0_CC_R                  =   0x0;                                /* Confiure the UART clock source */
    UART0_CTL_R                 =   (0x1<<0) | (0x1<<8) | (0x1<<9);     /* Enable the UART by setting the UARTEN bit */

    char c;
    while(1) {
        printString("Enter the color code red= 1, blue= 2, green= 3\n\r");
        c = readChar();
        // acknowledgment
//        printString(recv_string);
        switch(c) {
            case 'r':
                GPIO_PORTF_DATA_R       =       (0x1<<1);
                break;
            case 'b':
                GPIO_PORTF_DATA_R       =       (0x1<<2);
                break;
            case 'g':
                GPIO_PORTF_DATA_R       =       (0x1<<3);
                break;
            default:
                GPIO_PORTF_DATA_R       &=       ~((0x1<<3) | (0x1<<2) | (0x1<<1));
        }
    }

    
}
void printString(char * string)                      /* print string function print char by char to FIFO txbuffert o comp */
{
    while(*string)
    {
        printChar(*(string++));
    }
}
void printChar(char c)                               /* each char stored in TX FIFO buffer and transfer it computer */
{
    while((UART0_FR_R & (1<<5)) != 0);
    UART0_DR_R = c;
}
char readChar(void)                                 /* read computer char by char to RX FIFO buffer */
{
    char c;
    while((UART0_FR_R & (1<<4)) != 0);
    c = UART0_DR_R;
    return c;
}