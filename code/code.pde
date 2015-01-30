//#define usbInterruptIsReady()   (usbTxLen1 & 0x10)

#include "UsbKeyboard.h"
#include "WString.h"

//THIS IS THE MAIN FILE FOR THE USB TYPEWRITER SOFTWARE
//IT IMPLEMENTS THE SETUP AND MAIN ROUTINES AND CALLS OUT NEEDED LIBRARIES

#define clearbit(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#define setbit(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))

#include <EEPROM.h>
#include "variables.h"
#include <avr/interrupt.h>
volatile static unsigned int mycounter = 0;

//Setup initializes ports, variables, and so on, then delays 3s.  It also checks if this is teach mode or not.
void setup() {
  configPorts();
  digitalWrite(13,HIGH);
  delayMs(5);//delay 5ms.
  initializeTypewriter(); // Call initialize function.
  initializeUSB();
  SetupTimer2(); // set up timer2 to run every 20 ms (50Hz). timerLoadValue is the value loaded into timer2
  mycounter = 0;

 
  sensitivity = EEPROM.read(EEP_SENSE); //load sensitivity value
  if(sensitivity == 255 || sensitivity == 0){
    sensitivity = DEFAULT_SENSITIVITY;
    EEPROM.write(EEP_SENSE, sensitivity);
  }
  
  doubletaptime = EEPROM.read(EEP_DOUBLETAP); //load doubletap sensitivity value
  if(doubletaptime == 255 || doubletaptime == 0){
    doubletaptime = DEFAULT_DOUBLETAP;
    EEPROM.write(EEP_DOUBLETAP, doubletaptime);
  }

//  TEACH_MODE = true;//debug only!!!
  while (mycounter<200){} //wait for 200*16ms = 3s
}

//Loop is controls whether we are in the Teach, Recall, or Listen thread.
void loop() {
  if(BEEP_MODE){
      pinMode(SPEAKERpin,OUTPUT);

  int speakerdelay = 1000;
  while(1){
    bool octave = false;
    if  (digitalRead(reed1)){octave = !octave;}
    if  (digitalRead(reed2)){octave = !octave;}
    if  (digitalRead(reed3)){octave = !octave;}
    if  (digitalRead(reed4)){octave = !octave;}
 
    if(octave){
      speakerdelay = 500;
    }
    else{
      speakerdelay = 1000;
    }
    
    digitalWrite(SPEAKERpin, HIGH);
    delayMicroseconds(speakerdelay);
    digitalWrite(SPEAKERpin, LOW);
    delayMicroseconds(speakerdelay);
}

  }
  else if(QUICKTEACH_MODE){
    quickTeach();
  }
  else if(TEACH_MODE){
    teach();
  }
  else if(RECALL_MODE){
    recall();
  }
  else if(SENSITIVITY_MODE){
    sensitivityAdjust();
  }
  
  
  else{
 // USBSend(KEY_L);
    listen();
  }
}



