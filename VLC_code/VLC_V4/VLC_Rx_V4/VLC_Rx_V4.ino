#define BUF_SIZE 400                            //reading buffer zise

#define D0 11                                   //sensor D0 pin
#define GND 10                                  //sensor GND pin
#define VCC 9                                   //sensor VCC pin
#define SP_CHAR 255

int cur_buf = -1;                               //buffer cursor
int begin_buf = 0;                              //buffer begin
int len_buf = 0;                                //buffer data length

unsigned int tp, tl, t, tm0 = 10;

int tm0Len = 30, tm1Len = 100;

int len = 0, bus_s = 0, cur = 0;

const byte ledPin = 13;
const byte interruptPin = 2;                    //arduino uno interrupt pin
volatile byte state = LOW;

byte byt = 0;

struct buf {
  boolean b;
  byte tm;
};

buf bit_buf[BUF_SIZE];                        //reading buffer

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
  pinMode(D0, INPUT);
  pinMode(VCC, OUTPUT);
  pinMode(GND, OUTPUT);
  digitalWrite(VCC, HIGH);
  digitalWrite(GND, LOW);
  state = digitalRead(D0);
  pinMode(interruptPin, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(interruptPin), blinkI, CHANGE);
}

void bitAnalyzer() {
  if (len_buf == 0 ) ;                          //empty buf
}

buf tm;
int ri = 0, re = 0;
int i2 = -1;

boolean isE = false, isV = false;

void loop() {
  if (len > 0) {
    readBuf();
  }
}

void readBuf() {
  tm = getBuf();
  if (tm.tm == 100 or ++i2 == 8) {
    if (byt == SP_CHAR) {
      if (isV)
        Serial.println();
      isE = false;
      isV = false;
    }
    if (isE) {
      isV = true;
      Serial.print(char(byt));
    }
    if (byt == SP_CHAR) {
      isE = true;
    }
    i2 = -1;
    byt = 0;
    return;
  }
  byt += pow2(i2) * tm.tm;
}

void blinkI() {                                 //interrupt handler mathod
  state = !state;
  //  Serial.print(state);
  tp = tl;
  tl = micros();
  t = floor(abs( tl - tp) / 10.0);
  if (state == 1 && t < tm0) state = !state;
  if (state == 0) {
    //    Serial.print(0);
    return;
  }
  //  Serial.print(1);
  if (t < tm0Len) addBuf(state, 0);
  else if (t < tm1Len) addBuf(state, 1);
  else addBuf(state, 100);
}

void addBuf(boolean b, byte t) {
  if (len >= BUF_SIZE) {
    len = BUF_SIZE;
    bus_s++;
  }
  if (++cur == BUF_SIZE) cur = 0;
  bit_buf[cur].b = b;
  bit_buf[cur].tm = t;
  //  Serial.println(b);
  len++;
}

buf getBuf() {
  if (++bus_s == BUF_SIZE) bus_s = 0;
  len--;
  return bit_buf[bus_s];
}

int pow2(int i) {
  switch (i) {
    case 0: return 1; break;
    case 1: return 2; break;
    case 2: return 4; break;
    case 3: return 8; break;
    case 4: return 16; break;
    case 5: return 32; break;
    case 6: return 64; break;
    case 7: return 128; break;
  }
  return pow(2, i);
}
