#define BUF_SIZE 400                            //reading buffer zise

#define D0 11                                   //sensor D0 pin
#define GND 10                                  //sensor GND pin
#define VCC 9                                   //sensor VCC pin

int cur_buf = -1;                               //buffer cursor
int begin_buf = 0;                              //buffer begin
int len_buf = 0;                                //buffer data length

unsigned int tp, tl, t;

int len = 0, bus_s = 0, cur = 0;

const byte ledPin = 13;
const byte interruptPin = 2;                    //arduino uno interrupt pin
volatile byte state = LOW;

byte byt = 0;

struct buf {
  boolean b;
  unsigned int tm;
};

buf bit_buf[BUF_SIZE];                        //reading buffer


buf tm;
int ri = 0, re = 0;
int i2 = -1;

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
int tm0L = 1;
int bb = 0 ;
void blinkI() {                                 //interrupt handler mathod
  state = !state;
  tp = tl;
  tl = millis();
  t = abs(tl - tp);
  //  t = floor(abs( tl - tp) / 10.0);
  //  if (cur_buf == BUF_SIZE - 1) return;
  if (state == 1 && t < 60) state = !state;
  if (state == 0) {//return;
    tm0L = t;
    return;
  }
  else if (t != 0) {
    //    t /= tm0L;
    t = ceil(t / 10.0);
    if (t < 25) bb = 0;
    else if (t < 45) bb = 1;
    else if (t > 50) bb = 100;
    else bb = 8888;
  }
  addBuf(state, bb);
  //  if (t < 30) addBuf(state, 0);
  //  else if (t < 100) addBuf(state, 1);
  //  else addBuf(state, 1000);
}

void addBuf(boolean b, unsigned long t) {
  if (len >= BUF_SIZE) {
    len = BUF_SIZE;
    bus_s++;
  }
  if (++cur == BUF_SIZE) cur = 0;
  bit_buf[cur].b = b;
  bit_buf[cur].tm = t;
  len++;
}

buf getBuf() {
  if (++bus_s == BUF_SIZE) bus_s = 0;
  len--;
  return bit_buf[bus_s];
}

void loop() {
  // put your main code here, to run repeatedly:
  if (len > 0) {
    buf tt = getBuf();
    Serial.print(tt.b);
    Serial.print(" ");
    Serial.println(tt.tm);
  }
}

void readBuf() {
  tm = getBuf();
  if (tm.tm == 1000 or ++i2 == 8) {
    if (byt == 0) {
      Serial.println();
      Serial.print("Key : ");
    }
    else if (byt == 255) Serial.print(" Value : ");
    else Serial.print(char(byt));
    i2 = -1;
    byt = 0;
    return;
  }
  byt += pow2(i2) * tm.tm;
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
