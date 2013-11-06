void USBSendString(String s){
    int mylength = s.length();
    char singlechar;
    int usbcode;
    
    mycounter = 0;
    while(mycounter<2){}// implement  delay
  
   for (int i = 0; i <= mylength; i ++ ){
      singlechar = s.charAt(i);
      usbcode = singlechar + (KEY_A - ASCII_A); // add character to an offset that corrects for the difference between USB code and ascii code.
      USBSend(usbcode,UPPER);
   }
    
   mycounter = 0;
   while(mycounter<2){}// implement delay 
    
}
