:start
avrdude -c avrispmkii -p ATMEGA328P -P usb -U eeprom:r:eepromreadout.hex:i
echo Completed %TIMESTAMP%
pause
goto start

REM to preserve EEPROM values, use hfuse:w:0xd7:m 
REM to erase EEPROM and store default: use hfuse:w:0xdF:m

