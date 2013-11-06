//This is the meat of the code.   It shifts bits down the shift registers until a signal is received back at the KEYpin, which tells it what key has been pressed.

byte waitForKeystroke(){
  byte key = 0;
  int debounce  = 0;
  byte keyfromlastscan = 0;
  
//LOOP UNTIL A KEY IS PRESSED 
  while((key == 0) || (debounce < sensitivity)) { //10ms of looping per sensitivity level
   key = 0;
   
   clockShiftRegisters();
   
    for (int shift_i = 1; shift_i<95;shift_i++){
      pulseHigh(RCLKpin);
      if (digitalRead(KEYpin) == HIGH){
        key = shift_i;
      }
    }

   if(key == 0){
     NOCONTACTPRESSED = true;
   }
   else{
     NOCONTACTPRESSED = false;
   }

   if(digitalRead(reed1) != polarity1 && shiftkey!=reed1){key = 96;} 
   if(digitalRead(reed2) != polarity2 && shiftkey!=reed2){key = 97;}
   if(digitalRead(reed3) != polarity3 && shiftkey!=reed3){key = 98;}
   if(digitalRead(reed4) != polarity4 && shiftkey!=reed4){key = 99;}
   if (key != 0 && key == keyfromlastscan){
     debounce ++;
   }
   else{
     debounce = 0;
     if(waitcount<30000){waitcount++;}//increment waitcount whenever no key is detected
   }
  
   keyfromlastscan = key;
 } 
    
    return key;
}
