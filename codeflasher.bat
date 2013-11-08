:start
avrdude -c avrispmkii -p ATMEGA328P -P usb -F -U lock:w:0x3F:m -U efuse:w:0x00:m -U hfuse:w:0xdF:m -U lfuse:w:0xff:m -U flash:w:code.hex:i -U lock:w:0x0F:m
timeout /t 1
avrdude -c avrispmkii -p ATMEGA328P -P usb -U eeprom:w:UnderwoodEEPROM.hex
set TIMESTAMP=%TIME:~0,2%_%TIME:~3,2%_%TIME:~6,2%
echo YOU ARE DONE%TIMESTAMP%
pause
goto start

REM to preserve EEPROM values, use hfuse:w:0xd7:m 
REM to erase EEPROM and store default: use hfuse:w:0xdF:m

