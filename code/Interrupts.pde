//Timer2 overflow interrupt vector handler
//Every time the timer2 overflows, an update command is sent.  This must happen at least once every 50ms.
//This is also a good time to increment a system counter -- mycounter.

ISR(TIMER2_OVF_vect) {

  mycounter = mycounter + 1;

  UsbKeyboard.update(); //this needs to be called every 50ms so the host computer doesn't get bored with us.
  TCNT2 = 1;
}
