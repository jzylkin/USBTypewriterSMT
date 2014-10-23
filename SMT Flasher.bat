:start
timeout /t 1
avrdude -c avrispmkii -p ATMEGA328P -P usb -F -U lock:w:0x3F:m -U efuse:w:0x00:m -U hfuse:w:0xdF:m -U lfuse:w:0xff:m -U flash:w:code.hex:i -U lock:w:0x0F:m
pause
goto start

REM to preserve EEPROM values, use hfuse:w:0xd7:m 
REM to erase EEPROM and store default: use hfuse:w:0xdF:m

