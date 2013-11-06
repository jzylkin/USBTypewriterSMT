void configPorts() {
  pinMode(SERpin, OUTPUT);
  pinMode(RCLKpin, OUTPUT);
  pinMode(KEYpin, INPUT);
  pinMode(reed1, INPUT);
  pinMode(reed2,INPUT);
  pinMode(reed3,INPUT);
  pinMode(reed4,INPUT);
  pinMode(S1,INPUT);
  pinMode(S2,INPUT);
  pinMode(S3,INPUT);        

  
  digitalWrite(S1,HIGH);//activate internal pullup resistor 
  digitalWrite(S2,HIGH);
  digitalWrite(S3,HIGH);
  digitalWrite(reed1,HIGH);
  digitalWrite(reed2,HIGH);
  digitalWrite(reed3,HIGH);
  digitalWrite(reed4,HIGH);

     asm("nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;");
     
  polarity1 = digitalRead(reed1);
  polarity2 = digitalRead(reed2);
  polarity3 = digitalRead(reed3);
  polarity4 = digitalRead(reed4);


}
