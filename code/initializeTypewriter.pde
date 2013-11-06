void initializeTypewriter() {
    TEACH_MODE = false;
    RECALL_MODE = false;
    BEEP_MODE = false;
    SENSITIVITY_MODE = false;
  
  
  if(digitalRead(TEACHpin) == LOW && digitalRead(BEEPpin)==LOW){
    QUICKTEACH_MODE = true;
  }
  else if(digitalRead(BEEPpin)==LOW){
    BEEP_MODE = true;
  }
  else if(digitalRead(SENSITIVITYpin) == LOW){
    SENSITIVITY_MODE = true;
  }
   else if(digitalRead(TEACHpin) == LOW){  //spacebar controls teachmode 
    TEACH_MODE = true;
  }
  else{
    RECALL_MODE = true;
}

 
 //PUT SHIFT REGISTER INTO A KNOWN STATE (all zeros) AND INITIALIZE KEYTOCHARARRAY TO ALL -1 
  digitalWrite(SERpin,LOW); //clock 100 zeros into the shift register
  for (int init_i=0; init_i <= 199; init_i++){
     pulseHigh(RCLKpin);
     keytocharARRAY[init_i] = INVALID;// until explicity programmed, each value in the array returns invalid.
  }

  
}
