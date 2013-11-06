//This is a very low level routine to pulse a pine high then low again, or vice versa.

void pulseLow(int pintopulse){
  delay10us();
  digitalWrite(pintopulse,LOW);
  delay10us();
  digitalWrite(pintopulse,HIGH);
  delay10us();
}

void pulseHigh(int pintopulse){
  delay10us();
  digitalWrite(pintopulse,HIGH);
  delay10us();
  digitalWrite(pintopulse,LOW);
  delay10us();
}

void clockShiftRegisters(){
   digitalWrite(SERpin,HIGH);
   pulseHigh(RCLKpin);
   digitalWrite(SERpin,LOW);
   asm("nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;");
   asm("nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;");
}
