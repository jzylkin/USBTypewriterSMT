void sensitivityAdjust(){ //CALIBRATING: PLEASE TYPE THE FOLLOWING KEYS

//  sensitivity = EEPROM.read(EEP_SENSE);//load sensitivity value
//  if (sensitivity == 0){sensitivity = DEFAULT_SENSITIVITY;}

  
USBSend(KEY_S,UPPER);
USBSend(KEY_E,UPPER);
USBSend(KEY_N,UPPER);
USBSend(KEY_S,UPPER);
USBSend(KEY_E,UPPER);
USBSend(KEY_SPACE,UPPER);
USBSend(KEY_T,UPPER);
USBSend(KEY_I,UPPER);
USBSend(KEY_M,UPPER);
USBSend(KEY_E,UPPER);
USBSend(KEY_SEMICOLON,UPPER);

sendnumber(sensitivity);
USBSend(KEY_ENTER,LOWER);

while (digitalRead(S3) == HIGH){
  if(digitalRead(S1)==LOW){
    sensitivity++;
    EEPROM.write(EEP_SENSE, sensitivity);
    sendnumber(sensitivity);
    USBSend(KEY_ENTER,LOWER);

  }
  if(digitalRead(S2)==LOW){
    if(sensitivity){sensitivity--;}
    EEPROM.write(EEP_SENSE, sensitivity);
    sendnumber(sensitivity);
    USBSend(KEY_ENTER,LOWER);
  }
}

USBSend(KEY_D,UPPER);
USBSend(KEY_O,UPPER);
USBSend(KEY_U,UPPER);
USBSend(KEY_B,UPPER);
USBSend(KEY_L,UPPER);
USBSend(KEY_E,UPPER);
USBSend(KEY_SPACE,UPPER);
USBSend(KEY_T,UPPER);
USBSend(KEY_A,UPPER);
USBSend(KEY_P,UPPER);
USBSend(KEY_SPACE,UPPER);
USBSend(KEY_T,UPPER);
USBSend(KEY_I,UPPER);
USBSend(KEY_M,UPPER);
USBSend(KEY_E,UPPER);
USBSend(KEY_SEMICOLON,UPPER);

sendnumber(doubletaptime);
USBSend(KEY_ENTER,LOWER);
    
while (digitalRead(S3) == HIGH){
  if(digitalRead(S1)==LOW){
      doubletaptime++;
    EEPROM.write(EEP_DOUBLETAP, doubletaptime);
    sendnumber(doubletaptime);
    USBSend(KEY_ENTER,LOWER);

  }
  if(digitalRead(S2)==LOW){
 
    if (doubletaptime){doubletaptime--;}
    EEPROM.write(EEP_DOUBLETAP, doubletaptime);
    sendnumber(doubletaptime);
    USBSend(KEY_ENTER,LOWER);
  }
}

USBSend(KEY_O,UPPER);
USBSend(KEY_K,UPPER);
USBSend(KEY_ENTER,LOWER);

SENSITIVITY_MODE = false;
RECALL_MODE = true;


}

