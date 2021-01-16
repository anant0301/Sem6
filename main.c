int main() {


    *((unsigned int *) 0x400F608U) = 0x20;
    *((unsigned int *) 0x40025400U) = 0x0E;
    *((unsigned int *) 0x4002551CU) = 0x0E;
    
    while (1)
    {
        *((unsigned int *) 0x40025008U) = 0x02;
        *((unsigned int *) 0x40025008U) = 0x00;


        *((unsigned int *) 0x40025010U) = 0x04;
        *((unsigned int *) 0x40025010U) = 0x00;


        *((unsigned int *) 0x40025020U) = 0x08;
        *((unsigned int *) 0x40025020U) = 0x00;
    }
    return 0;
}