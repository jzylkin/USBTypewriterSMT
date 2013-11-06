void quickTeach(){
   USBSendString("BACKSPACE");
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_BACKSPACE);
   USBSend(KEY_ENTER);
   
   USBSendString("ESC");
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_ESC);
   USBSend(KEY_ENTER);

   USBSendString("TAB");
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_TAB);   
   USBSend(KEY_ENTER);
   
   USBSendString("ENTER");
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_ENTER);
   USBSend(KEY_ENTER);
   
   USBSendString("SPACE");
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_SPACE);
   USBSend(KEY_ENTER);
   
   USBSendString("SHIFT");
   USBSend(KEY_SEMICOLON,UPPER);
   while (shiftkey == 0){
   if(digitalRead(reed1) != polarity1){shiftkey=reed1; shiftpolarity = polarity1;} 
   if(digitalRead(reed2) != polarity2){shiftkey=reed2; shiftpolarity = polarity2;}
   if(digitalRead(reed3) != polarity3){shiftkey=reed3; shiftpolarity = polarity3;}
   if(digitalRead(reed4) != polarity4){shiftkey=reed4; shiftpolarity = polarity4;}
   }
   USBSend(KEY_ENTER);
  
  for (int key_i = 96; key_i <=99; key_i++){ 
    EEPROM.write(key_i,keytocharARRAY[key_i]);  //store key/char pair in eeprom.  key # is the eeprom address,  keytocharARRAY(key_i) is the character stored there.
  }
  
 EEPROM.write(SHIFTEEP,shiftkey);
  EEPROM.write(SHIFTPOLEEP,shiftpolarity);
  
  
  QUICKTEACH_MODE = false;
  
}
