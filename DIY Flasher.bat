:start
avrdude -c avrispmkii -p ATMEGA328P -P usb -F -U lock:w:0x3F:m -U efuse:w:0x00:m -U hfuse:w:0xdF:m -U lfuse:w:0xff:m -U flash:w:diycode2_8.hex:i -U lock:w:0x0F:m
echo YOU ARE DONE%TIMESTAMP%
pause
goto start

REM to preserve EEPROM values, use hfuse:w:0xd7:m 
REM to erase EEPROM and store default: use hfuse:w:0xdF:m

