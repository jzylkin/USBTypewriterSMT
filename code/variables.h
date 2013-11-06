//This code defines all variables

#define SERpin  12 // SERpin (serial input)
#define RCLKpin  13 // RCLKpin (shift register clock)

#define S1 17
#define S2 16
#define S3 15
#define TEACHpin S1   //pushbutton that goes into teachmode
#define FNpin S2
#define CMDpin S3
#define BEEPpin S3
#define SENSITIVITYpin S2

#define KEYpin 6
#define reed1 7
#define reed2 8
#define reed3 10
#define reed4 11

#define SPEAKERpin 1

#define INVALID 0

#define TIMER2FREQ 10//Timer2 interrupts occur every 20ms.


#define DEFAULT_SENSITIVITY  10//number of cycles to debounce (each cycle is 2ms)
#define DEFAULT_DOUBLETAP 10//number of cycles to wait between consecutive presses of the same key.

bool SENSITIVITY_MODE = false;
bool BEEP_MODE = false;
bool TEACH_MODE = false;
bool RECALL_MODE = false;
bool debugLED = false;
bool CTRLflag = false;
bool NOCONTACTPRESSED = false;
int MODE  =  0;

int shiftkey = 0;
bool shiftpolarity;
char keytocharARRAY[200]; //1-99: primary keymap.  100-199: secondary keymap (accessed with Function Key).  
int lastkeypressed = -1;
int lastREEDpressed = -1;
long lastkeytime = 0;
long keytime;
int waitcount = 0;
long repeatcount = 0;
unsigned int timerLoadValue;
int  beepdelay = 1000; //in microseconds
byte sensitivity; //how long each key is held before registering (actually stored in eeprom)
byte doubletaptime; //how long to wait before the same key can be pressed twice


bool polarity1;
bool polarity2;
bool polarity3;
bool polarity4;
bool polarityalt;
bool polarityctrl;

float millisTMR2 = 0;

#define clockTime 10   //each clock pulse must be x microseconds to do anything.
#define keyCheckTime 500  //wait this long (in microseconds) after clocking the shift register before checking if a key has been pressed.

//CUSTOM LETTERS:

//see usbkeyboard.h -- these are the bit numbers of the mofifier keys
#define CTRL_F 0 //ctrl is bit 0 of modifier byte
#define SHIFT_F 1  
#define ALT_F 2
#define CMD_F 3 //cmd flag is bit three 

//and here are the combinations of those flags:
#define LOWER 0  //lower case, no modifiers, mode = b00000000
#define UPPER MOD_SHIFT_LEFT 

#define EEP_SENSE 245//EEPROM location of sensitivity amount
#define EEP_DOUBLETAP 244//EEPROM Location of double tap delay/sensitivity to two consecutive taps on the same key

#define KEY_SEMICOLON 51
#define KEY_PERIOD 55


#define KEY_PERIOD 55
#define KEY_COMMA 54
#define KEY_BACKSPACE 42
#define KEY_DELETE  76
#define KEY_SLASH 56
#define KEY_QUOTES 52
#define KEY_1 30
#define KEY_0 39
#define KEY_8 37
#define KEY_ESC 41
#define KEY_TAB 43
#define KEY_EQ  46 
#define KEY_DASH 45
#define KEY_BACKSLASH 49
#define KEY_LBRACKET 47
#define KEY_RBRACKET 48
#define KEY_TILDE 53
#define KEY_AT 250

#define KEY_F1 58

#define KEY_RIGHT 79
#define  KEY_LEFT 80
#define KEY_DOWN 81
#define KEY_UP 82

#define ASCII_A 65
#define SHIFTEEP 200
#define SHIFTPOLEEP 201
