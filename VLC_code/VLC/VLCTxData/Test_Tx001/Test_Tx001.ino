#define LED 12
#define ArrayLen(x)       (sizeof(x) / sizeof(x[0]))
//         1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8, 1, 2, 3, 4, 5, 6, 7, 8,
int data[] = {1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0};

void setup() {
  // put your setup code here, to run once:
  pinMode(LED, OUTPUT);
  Serial.begin(9600);
  digitalWrite(LED, HIGH);
  delay(2000);

}

void loop() {
  blinkBit(2, data);
  digitalWrite(LED, LOW);
  delay(2000);
}

void blinkBit(int enc, int x[]) {
  for (int i = 0; i < ArrayLen(x); i++) {
    Bit(enc, x[i]);
    Serial.print(">");
    Serial.println(x[i]);
  }
}

void blinkData(int enc, int x[]) {
  int d;
  for (int i; i < ArrayLen(x); i++) {
    d = x[i];
    for (int a = 0; a < 8; a++) {
      if ((d >> a) & 0x01 == 1)
      {
        Bit(enc, 1);
      }
      else
      {
        Bit(enc, 0);
      }
    }
  }
}

void Bit(int enc, int on) {
  switch (enc) {
    case 1: // Manchester Encording 1 > ON OFF  0 > OFF ON
      SW((on == 1) ? 1 : 0);
      SW((on == 1) ? 0 : 1);
      break;
    case 2: // 1 > ON  0 > OFF
      SW((on == 1) ? 1 : 0);
      break;
    case 3:
      break;
  }
}

void SW(int a) {
  digitalWrite(LED, (a == 1) ? HIGH : LOW);
  Serial.print(">>");
  Serial.println(a);
  delay(100);
}

