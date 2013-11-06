//this routine loads key values from the eeprom.

void recall(){
  //GET THE KEY/CHAR PAIRS THAT HAVE BEEN STORED IN EEPROM
  for (byte recall_i =0; recall_i <= 99; recall_i++){
  keytocharARRAY[recall_i] = EEPROM.read(recall_i); 
  }
    RECALL_MODE = false; // end of recall mode

  for (byte recall_i =100; recall_i <= 199; recall_i++){
  keytocharARRAY[recall_i] = EEPROM.read(recall_i); 
  }
  

    RECALL_MODE = false; // end of recall mode
}

  

