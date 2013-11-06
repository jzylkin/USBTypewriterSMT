//This code sends a keystroke then waits a very short amount of time (to avoid glitching and double strokes)

void USBSend(byte usbkeycode){
    mycounter = 0;
    while(mycounter == 0){} //wait till next interrupt completes
    delay1000us();
    UsbKeyboard.sendKeyStroke(usbkeycode);  //note:usbkeycode is not ascii, it is defined by usb standard
    mycounter = 0;
    while(mycounter <5){} //implement 5*16ms = 80ms delay;
    mycounter = 0;
}

//the function can also be called with a mode, such as LOWER, UPPER, or CTRL
void USBSend(byte usbkeycode, byte mode){
    mycounter = 0;
    while(mycounter == 0){}  //wait till next interrupt completes  -- thats so a send command doesn't get interrupted.
    delay1000us();
    if(mode==0){
      UsbKeyboard.sendKeyStroke(usbkeycode);
    }
    else{
      UsbKeyboard.sendKeyStroke(usbkeycode,mode);
    }
    mycounter = 0;
    while(mycounter <5){} //implement 5*16ms = 80ms delay;
    mycounter = 0;
}

