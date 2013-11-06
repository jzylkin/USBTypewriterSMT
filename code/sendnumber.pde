void sendnumber(int number){
    int ones ;
    int tens;
    int hundreds;
    
    ones = number%10;
    tens = ((number - ones)%100)/10;
    hundreds = ((number - ones - 10*tens))/100;
  
    mycounter = 0;
    while(mycounter<2){}// implement  delay
  
     if (hundreds != 0){
      USBSendString("ALT");
      USBSend(KEY_EQ,UPPER);
    }
    else{
//      USBSend(39,LOWER);
    }
  
    mycounter = 0;
    while(mycounter<2){}// implement delay
     
    if (tens != 0){
      USBSend(29+tens,LOWER);
    }
    else{
      USBSend(39,LOWER);
    }

   mycounter = 0;
   while(mycounter<2){}// implement delay  
 
    if (ones!=0){
      USBSend(29+ones,LOWER);
    }
    else{
      USBSend(39,LOWER);
    }
    
   mycounter = 0;
   while(mycounter<2){}// implement delay 
    
}
