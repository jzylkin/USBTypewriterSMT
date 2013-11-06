//This code enumerates the USB to the host.  It also includes routines to make delays of different length to replace the Arduino's built in delay functions (which use interrupts that have been disabled).

void initializeUSB(){
    TIMSK0&=!(1<<TOIE0);  //disable Timer0 interrupts
    cli();   // Clear interrupts while performing time-critical operations
    
    // Force re-enumeration so the host will detect us 
    usbDeviceDisconnect(); 
    delayMs(250); 
    usbDeviceConnect();   
    
    // Set interrupts again  
    sei();
    
}

void delayMs(unsigned int ms){ 
    /** * Define our own delay function so that we don't have to rely on * 
operation of timer0, the interrupt used by the internal delay() */
  for (int ms_i = 0; ms_i < ms; ms_i++){   
    delayMicroseconds(1000); 
    }
} 

void delay10us(){
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
  asm("nop;nop;nop;nop;");
}

void delay1000us(){
  for(int del_i =0; del_i<100; del_i++){
    delay10us();
  }
}

