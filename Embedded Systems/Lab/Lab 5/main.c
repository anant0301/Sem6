#define SYSCTL_RCGCGPIO_R (*((volatile unsigned long *)0x400FE608))
#define SYSCTL_RCGCADC_R (*((volatile unsigned long *)0x400FE638))

#define GPIO_PORTF_DIR_R (*((volatile unsigned long *)0x40025400))
#define GPIO_PORTF_DEN_R (*((volatile unsigned long *)0x4002551C))
#define GPIO_PORTF_DATA_R (*((volatile unsigned long *)0x400253FC))

#define GPIO_PORTE_AFSEL_R (*((volatile unsigned long *)0x40024420))
#define GPIO_PORTE_DIR_R (*((volatile unsigned long *)0x40024400))
#define GPIO_PORTE_AMSEL_R (*((volatile unsigned long *)0x40024528))

#define ADC0_ACTSS_R (*((volatile unsigned long *)0x40038000))
#define ADC0_EMUX_R (*((volatile unsigned long *)0x40038014))
#define ADC0_SSMUX3_R (*((volatile unsigned long *)0x400380A0))
#define ADC0_SSCTL3_R (*((volatile unsigned long *)0x400380A4))
#define ADC0_PSSI_R (*((volatile unsigned long *)0x40038028))
#define ADC0_RIS_R (*((volatile unsigned long *)0x40038004))
#define ADC0_SSFIFO3_R (*((volatile unsigned long *)0x400380A8))
#define ADC0_ISC_R (*((volatile unsigned long *)0x4003800C))

int main()
{
    // Register settings
    SYSCTL_RCGCGPIO_R    = 0x08 | 0xE0;     /* clock gating                                         = PORTE | PORTF                 */
    SYSCTL_RCGCADC_R    |= 0x1;             /* analog clock gating for the PORTE                    = PORTE                         */
    GPIO_PORTF_DIR_R     = 0xFF;            /* portF direction register                             = PF[3:0]                       */
    GPIO_PORTF_DEN_R     = 0xFF;            /* portF digital function register                      = PF[3:0]                       */
    GPIO_PORTE_AFSEL_R  |= 0x8;             /* enable alternate function for bit 4 from left        = PE[0]                         */
    GPIO_PORTE_DIR_R    &= ~0x8;            /* disable digital function for bit 4 from left         = PE[0]                         */
    GPIO_PORTE_AMSEL_R  |= 0x8;             /* enable analog function for bit 4 from left           = PE[0]                         */
    ADC0_ACTSS_R        &= ~0x8;            /* disable SS3 during configuration for                 = SS[2:0]                       */
    ADC0_EMUX_R         &= ~0xF000;         /* software trigger conversion --> Sample Sequencer 3   = SS[3] all analog functions    */
    ADC0_SSMUX3_R       &= 0x0;             /* get input from channel 0                             = [3:0] are enabled for input   */
    ADC0_SSCTL3_R       |= 0x6;             /* take one sample at a time, set flag at 1st sample                                    */
    ADC0_ACTSS_R        |= 0x8;             /* enable ADC0 Sample sequencer 3                       = SS[3]                         */

    volatile int result;

    while (1)
    {
    ADC0_PSSI_R     |= 0x8;                 /* start a conversion Sample Sequence 3 SS[3]   */
        if ((ADC0_RIS_R & 8) == 0)          /* wait for conversion complete                 */
        {
            result   = ADC0_SSFIFO3_R;      /* read conversion result from ADCSSFIFO        */
            if (result < 2000)
            {
                GPIO_PORTF_DATA_R   = 0x00; /* Set data PORTF Data Switch off LED           */
            }
            else if (2000 <= result && result < 3000)
            {
                GPIO_PORTF_DATA_R   = 0x02; /* Set data PORTF Data for Red LED              */
            }
            else if (3000 <= result && result < 4000)
            {
                GPIO_PORTF_DATA_R   = 0x04; /* Set data PORTF Data for Blue LED             */
            }
            else if (result > 4000)
            {
                GPIO_PORTF_DATA_R   = 0x08; /* Set data PORTF Data for Green LED            */
            }
        }
        ADC0_ISC_R  = 8;                    /* clear completion flag                        */
    }

    return 0;
}