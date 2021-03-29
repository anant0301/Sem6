#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tm4c123gh6pm.h"

#define BLACK 0x00U
#define RED 0x02U
#define BLUE 0x04U
#define GREEN 0x08U
#define PURPLE 0x06U
#define YELLOW 0x0AU
#define CYAN 0x0CU
#define WHITE 0x0EU

// Define delay funciton
void delayMs(int n)
{
  for (int i = 0; i < n; ++i)
    for (int j = 0; j < 3180; ++j)
      ;
}

char readChar(void)
{
  char c;
  while ((UART0_FR_R & (1 << 4)) != 0)
    ;
  c = UART0_DR_R;
  return c;
}

void printChar(char c)
{
  while ((UART0_FR_R & (1 << 5)) != 0)
    ;
  UART0_DR_R = c;
}

void printString(char *string)
{
  while (*string)
  {
    printChar(*(string++));
  }
}

char *readString(char delimiter)
{
  int stringSize = 0;
  char *string = (char *)calloc(10, sizeof(char));
  char c = readChar();
  printChar(c);

  while (c != delimiter)
  {

    *(string + stringSize) = c; // put the new character at the end of the array
    stringSize++;

    if ((stringSize % 10) == 0) // string length has reached multiple of 10
    {
      string = (char *)realloc(string, (stringSize + 10) * sizeof(char)); // adjust string size by increasing size by another 10
    }

    c = readChar();
    printChar(c); // display the character the user typed
  }

  if (stringSize == 0)
  {
    return "\0"; // null character
  }
  return string;
}

void UART_Setup()
{
  // Enable the UART module using the RCGCUART register.
  SYSCTL_RCGCUART_R |= (1 << 0);

  // Enable the clock to the appropriate GPIO module via the RCGCGPIO register (see page 340).
  // To find out which GPIO port to enable, refer to Table 23-5 on page 1351.
  SYSCTL_RCGCGPIO_R |= (1 << 0);

  // Set the GPIO AFSEL bits for the appropriate pins.
  GPIO_PORTA_AFSEL_R = (1 << 1) | (1 << 0);

  // Configure the GPIO current level and/or slew rate as specified for the mode selected (see
  // page 673 and page 681

  // Configure the PMCn fields in the GPIOPCTL register to assign the UART signals to the appropriate
  // pins (see page 688 and Table 23-5 on page 1351).
  GPIO_PORTA_PCTL_R = (1 << 0) | (1 << 4);

  GPIO_PORTA_DEN_R = (1 << 0) | (1 << 1);

  // Find  the Baud-Rate Divisor
  // BRD = 16,000,000 / (16 * 9600) = 104.16666666666666666666666666666666666666666666666666
  // UARTFBRD[DIVFRAC] = integer(0.166667 * 64 + 0.5) = 11

  // With the BRD values in hand, the UART configuration is written to the module in the following order

  // Disable the UART by clearing the UARTEN bit in the UARTCTL register
  UART0_CTL_R &= ~(1 << 0);

  // Write the integer portion of the BRD to the UARTIBRD register
  UART0_IBRD_R = 104;
  // Write the fractional portion of the BRD to the UARTFBRD register.
  UART0_FBRD_R = 11;

  // Write the desired serial parameters to the UARTLCRH register (in this case, a value of 0x0000.0060)
  UART0_LCRH_R = (0x3 << 5) | (1 << 4); // 8-bit, no parity, 1-stop bit

  // Configure the UART clock source by writing to the UARTCC register
  UART0_CC_R = 0x0;

  // Enable the UART by setting the UARTEN bit in the UARTCTL register.
  UART0_CTL_R = (1 << 0) | (1 << 8) | (1 << 9);

  // Configure LED pins
  SYSCTL_RCGCGPIO_R |= (1 << 5);                          // enable clock on PortF
  GPIO_PORTF_DIR_R = (1 << 1) | (1 << 2) | (1 << 3);      // make LED pins (PF1, PF2, and PF3) outputs
  GPIO_PORTF_DEN_R = (1 << 1) | (1 << 2) | (1 << 3);      // enable digital function on LED pins
  GPIO_PORTF_DATA_R &= ~((1 << 1) | (1 << 2) | (1 << 3)); // turn off leds
}

void PortF_Setup()
{
  SYSCTL_RCGCGPIO_R = 0x20U;
  GPIO_PORTF_DIR_R = 0x0EU;
  GPIO_PORTF_DEN_R = 0x1FU;
  GPIO_PORTF_CR_R = 0xFFU;
  GPIO_PORTF_PUR_R = 0x11U;
  GPIO_PORTF_LOCK_R = 0x4C4F434BU;
}

// Question Functions
char *Questions[] = {"Are you there in your office?", "Are you happy?", "Are you hungry, want to have lunch?", "Are you thirsty, want to meet for a beverage?", "Shall I come to your office to talk?"};
int QuestionsColors[] = {RED, YELLOW, GREEN, BLUE, CYAN};
char QEncodeValue[] = {(char)0x30, (char)0x31, (char)0x32, (char)0x33, (char)0x34};

// Answer functions
char *Answers[] = {"Yes", "Maybe", "No"};
int AnswersColors[] = {WHITE, PURPLE, BLACK};
char AEncodeValue[] = {(char)0x35, (char)0x36, (char)0x37};

void QController()
{
  PortF_Setup();

  int counter = 0;
  GPIO_PORTF_DATA_R = QuestionsColors[counter];
  unsigned int leftState = 0, rightState = 0;

  while (1)
  {
    leftState = GPIO_PORTF_DATA_R & 16;
    rightState = GPIO_PORTF_DATA_R & 1;

    if (leftState == 0)
    {
      // delay for a while to counter bouncing effect
      delayMs(300);

      counter++;
      counter %= (sizeof(QuestionsColors) / sizeof(QuestionsColors[0]));
      GPIO_PORTF_DATA_R = QuestionsColors[counter];
    }

    if (rightState == 0)
    {
      // delay for a while to counter bouncing effect
      delayMs(300);

      // Send question
      printString(Questions[counter]);
      printString("\n\r");
    }
  }
}

void AController()
{
  PortF_Setup();

  int counter = 0;
  GPIO_PORTF_DATA_R = AnswersColors[counter];
  unsigned int leftState, rightState;

  while (1)
  {
    leftState = GPIO_PORTF_DATA_R & 16;
    rightState = GPIO_PORTF_DATA_R & 1;
    if (leftState == 0)
    {
      // delay for a while to counter bouncing effect
      delayMs(300);

      counter++;
      counter %= (sizeof(AnswersColors) / sizeof(AnswersColors[0]));
      GPIO_PORTF_DATA_R = AnswersColors[counter];
    }
    else if (rightState == 0)
    {
      // delay for a while to counter bouncing effect
      delayMs(300);

      // Send answer
      printString(Answers[counter]);
      printString("\n\r");
    }
  }
}
 
int main()
{
  UART_Setup();

  // QController();
  AController();

  return 0;
}
