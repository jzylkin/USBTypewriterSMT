//This code launches the calibration mode (only happens when teachpin is low on startup).

void teach(){
  byte keypressed;
  PrintInstructions();
  
//CYCLE THROUGH CHARACTERS:
 // for (char learnChar = KEY_A;  learnChar <= KEY_Z ;  learnChar++){  //key_a and key_z are variables declared in usbkeyboard.h
for (byte learnChar = KEY_A; learnChar <= KEY_Z; learnChar ++){
   USBSend(learnChar);
   USBSend(51,UPPER);  //51 is USB code for ";"  but shift left makes it ":"
   GetTeachKey(learnChar);
   USBSend(KEY_ENTER);
  }  

for (byte learnChar = KEY_1; learnChar <= KEY_0; learnChar ++){
   USBSend(learnChar);
   USBSend(51,UPPER);  //51 is USB code for ";"  but shift left makes it ":"
   GetTeachKey(learnChar);
   USBSend(KEY_ENTER);
  }  
//Learn which key is the spacebar.  (this code is optional)

   USBSend(KEY_PERIOD);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_PERIOD);
   USBSend(KEY_ENTER);
   
   USBSend(KEY_COMMA);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_COMMA);
   USBSend(KEY_ENTER);
   
   USBSend(KEY_SLASH);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_SLASH);
   USBSend(KEY_ENTER);
   
   USBSend(KEY_SEMICOLON);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_SEMICOLON);
   USBSend(KEY_ENTER);
   
   USBSend(KEY_QUOTES);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_QUOTES);
   USBSend(KEY_ENTER);
   
   USBSend(KEY_B);
   USBSend(KEY_A);
   USBSend(KEY_C);
   USBSend(KEY_K);
   USBSend(KEY_S);
   USBSend(KEY_P);
   USBSend(KEY_A);
   USBSend(KEY_C);
   USBSend(KEY_E);
   USBSend(KEY_R);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_BACKSPACE);
   USBSend(KEY_ENTER);
   
      
   USBSend(KEY_D);
   USBSend(KEY_E);
   USBSend(KEY_L);
   USBSend(KEY_E);
   USBSend(KEY_T);
   USBSend(KEY_E);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_DELETE);
   USBSend(KEY_ENTER);

   
   USBSend(KEY_DASH);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_DASH);   
   USBSend(KEY_ENTER);
   
   USBSend(KEY_EQ);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_EQ);   
   USBSend(KEY_ENTER);

   USBSend(KEY_BACKSLASH);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_BACKSLASH);   
   USBSend(KEY_ENTER);

   USBSend(KEY_LBRACKET);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_LBRACKET);   
   USBSend(KEY_ENTER);   
   
   USBSend(KEY_RBRACKET);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_RBRACKET);   
   USBSend(KEY_ENTER);
   
   USBSend(KEY_TILDE,UPPER);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_TILDE);   
   USBSend(KEY_ENTER);   
   
   USBSend(KEY_L,UPPER);
   USBSend(KEY_E,UPPER);
   USBSend(KEY_F,UPPER);
   USBSend(KEY_T,UPPER);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_LEFT);   
   USBSend(KEY_ENTER);   
   
   USBSend(KEY_R,UPPER);
   USBSend(KEY_I,UPPER);
   USBSend(KEY_G,UPPER);
   USBSend(KEY_H,UPPER);
   USBSend(KEY_T,UPPER);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_RIGHT);   
   USBSend(KEY_ENTER);   
   
   USBSend(KEY_U,UPPER);
   USBSend(KEY_P,UPPER);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_UP);   
   USBSend(KEY_ENTER);   
   
   USBSend(KEY_D,UPPER);
   USBSend(KEY_O,UPPER);
   USBSend(KEY_W,UPPER);
   USBSend(KEY_N,UPPER);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_DOWN);   
   USBSend(KEY_ENTER);  
   
   USBSend(KEY_T,UPPER);
   USBSend(KEY_A,UPPER);
   USBSend(KEY_B,UPPER);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_TAB);   
   USBSend(KEY_ENTER);
      
   USBSend(KEY_E,UPPER);
   USBSend(KEY_S,UPPER);
   USBSend(KEY_C,UPPER);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_ESC);
   USBSend(KEY_ENTER);
   
   USBSend(KEY_2,UPPER);
   USBSend(KEY_SEMICOLON,UPPER); 
   GetTeachKey(KEY_AT);
   USBSend(KEY_ENTER);
   
   for (int f_index = 1; f_index<=12;f_index++){
     USBSend(KEY_F,UPPER);
     sendnumber(f_index);
     USBSend(KEY_SEMICOLON,UPPER);
     GetTeachKey(KEY_F1+f_index-1);
     USBSend(KEY_ENTER);
   }
   
   USBSend(KEY_S);
   USBSend(KEY_P);
   USBSend(KEY_A);
   USBSend(KEY_C);
   USBSend(KEY_E);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_SPACE);
   USBSend(KEY_ENTER);
   
   USBSend(KEY_E);
   USBSend(KEY_N);
   USBSend(KEY_T);
   USBSend(KEY_E);
   USBSend(KEY_R);
   USBSend(KEY_SEMICOLON,UPPER);
   GetTeachKey(KEY_ENTER);
   USBSend(KEY_ENTER);
   
   USBSend(KEY_C);
   USBSend(KEY_A);
   USBSend(KEY_L);
   USBSend(KEY_I);
   USBSend(KEY_B);
   USBSend(KEY_R);
   USBSend(KEY_A);
   USBSend(KEY_T);
   USBSend(KEY_I);
   USBSend(KEY_O);
   USBSend(KEY_N);
   USBSend(KEY_SPACE);
   USBSend(KEY_S);
   USBSend(KEY_A);
   USBSend(KEY_V);
   USBSend(KEY_E);
   USBSend(KEY_D);
   USBSend(KEY_1,UPPER);
   USBSend(KEY_ENTER);
   //end of optional code   
   
   
   
//STORE ARRAY IN EEPROM:
  for (int key_i = 1; key_i <=200; key_i++){ 
    EEPROM.write(key_i,keytocharARRAY[key_i]);  //store key/char pair in eeprom.  key # is the eeprom address,  keytocharARRAY(key_i) is the character stored there.
  }
  
//  for (int key_i = 200; key_i <=214; key_i++){ 
//    EEPROM.write(key_i,keytocharARRAY[key_i]);  //store key/char pair in eeprom.  key # is the eeprom address,  keytocharARRAY(key_i) is the character stored there.
//  }
  TEACH_MODE = false; // exit teach mode
//  Serial.print("done programming");

}

void GetTeachKey(byte teachkey){
   int keypressed = 0;    
   while(keypressed == 0){
   keypressed = waitForKeystroke();
   }
//   keytocharARRAY[keypressed] = teachkey;
       if (digitalRead(S2) == 0){
        keytocharARRAY[keypressed+100] = teachkey;   
        sendnumber(keypressed+100);
      }
      else{
        keytocharARRAY[keypressed] = teachkey;
        sendnumber(keypressed);
      }
  
   mycounter = 0;
   while(mycounter<30){}// implement 500ms delay
   mycounter = 0;
}
  
