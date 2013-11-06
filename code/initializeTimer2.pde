//this code sets the configuration bits that initialize the timer.

void SetupTimer2(){   //timeoutFrequency must be less than 60Hz (every 16 ms)
  
   //Timer2 Settings:  Timer Prescaler /1024 = 16kHz or 16ms per overflow (coincidentally).
  TCCR2A = 0;
  TCCR2B = (1<<CS22 | 1<<CS21 | 1<<CS20);

  //Timer2 Overflow Interrupt Enable
 TIMSK2 = 1<<TOIE2; 

  //Timer2 Overflow Interrupt Enable
 // TIMSK |= (1 << TOIE2);
  TCNT2 = 1;


}
