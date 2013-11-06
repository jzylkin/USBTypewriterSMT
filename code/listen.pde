//this code detects a keystroke using waitforkeystroke() and then sends the result using USBSend().  It also checks that the key is valid and isn't a repeat.  It also adds shift, ctrl, and fn functionality.

void listen(){
//LISTEN FOR KEYSTROKE AND SEND IT TO PC 
    byte keypressed = 0;
    byte modekeys = 0;
    byte keytosend = 0;
    
    waitcount = 0;
    keypressed = waitForKeystroke();
    keytosend = (byte)keytocharARRAY[keypressed];
    
    if (digitalRead(S1) == 0){
          setbit(modekeys,CTRL_F);
    }

    if (digitalRead(shiftkey) != shiftpolarity){
          setbit(modekeys,SHIFT_F);
    }

    if (digitalRead(S2) == 0){  //S2 is used as a secondary alt pin
          if (keytocharARRAY[keypressed+100] != INVALID){keytosend = keytocharARRAY[keypressed+100];}
          else{setbit(modekeys,ALT_F);}
    }

    if (keytosend == KEY_AT){//at key is alway capitalized.
          setbit(modekeys,SHIFT_F);
           keytosend = KEY_2;//at key is actually the 2 key capitalized
    }
    
    if (digitalRead(S3) == 0){//s3 is the CMD key
         setbit(modekeys,CMD_F);
    }
    

//Debounce and send key over USB:
   if (keypressed == INVALID){}//do nothing if keypress is not valid.
   
   else if (keypressed%100 >= 96){ //if this is a reed switch
             
        if ( keypressed%100 != lastREEDpressed || waitcount > doubletaptime){// if this is not a repeat of the same REED switch or if all keys have been released for doubletaptime.
           USBSend(keytosend,modekeys);
        }
        
        lastREEDpressed = keypressed%100; //make sure holding a reed down only results in one send
        if(NOCONTACTPRESSED){lastkeypressed = 0;} //only clear lastkeypressed if all other keys are up -- holding down x and space should not produce "x x" unless you release x at some point while space is held.
            
    }
    
    else{  //if this is a contact on the sensor panel
      
        if ( keypressed%100 != lastkeypressed || waitcount>doubletaptime){ 
             USBSend(keytosend,modekeys);
        }
        
        lastkeypressed = keypressed%100;//make sure holding a key down only results in one send.
        lastREEDpressed = 0; // reset lastreedpressed so that a combination like space x space can happen consecutively
  

    }

}
