#include <ESP8266WiFi.h>

#define MAX_SRV_CLIENTS 3
#define NO_RPT 1
#define SP_CHAR 255

const char* ssid = "cpsa";
const char* password = "12345678";

WiFiServer server(21);
WiFiClient serverClients[MAX_SRV_CLIENTS];

#define LED 13
#define CLK0 20
#define CLK1 200
#define LEN 1
#define LONG_DELAY 800

/*Define state and write to state*/
int STATE = 0;

int ksm[] = {0};
int vsm[] = {255};
int tt[] = {0};
int Len = 0;

int xxx = 0;

int i = 0, d = 0, v = 0, a = 0;

String msg = "[";
byte msgc = 0;

void setup() {
  Serial1.begin(115200);
  pinMode(LED, OUTPUT);
  WiFi.begin(ssid, password);
  Serial1.print("\nConnecting to "); Serial1.println(ssid);
  uint8_t i = 0;
  while (WiFi.status() != WL_CONNECTED && i++ < 20) delay(500);
  if (i == 21) {
    Serial1.print("Could not connect to"); Serial1.println(ssid);
    while (1) delay(500);
  }
  Serial.begin(115200);
  server.begin();
  server.setNoDelay(true);
  Serial1.print("Ready! Use 'telnet ");
  Serial1.print(WiFi.localIP());
  Serial1.println(" 21' to connect");
}

void loop() {
  uint8_t i;
  if (server.hasClient()) {
    for (i = 0; i < MAX_SRV_CLIENTS; i++) {
      if (!serverClients[i] || !serverClients[i].connected()) {
        if (serverClients[i]) serverClients[i].stop();
        serverClients[i] = server.available();
        continue;
      }
    }
    //no free spot
    WiFiClient serverClient = server.available();
    serverClient.stop();
  }
  for (i = 0; i < MAX_SRV_CLIENTS; i++) {
    if (serverClients[i] && serverClients[i].connected()) {
      if (serverClients[i].available()) {
        while (serverClients[i].available()) {
          msgc = serverClients[i].read();
          if (msgc == 13 or msgc == 10) break;
          msg += (char)msgc;
        }
        msg += char(SP_CHAR);
        if (msg.length() > 2) {
          Serial.println(msg);
          for ( int x = 0; x < NO_RPT; x++)
            sendKeyValue(msg);
        }
        digitalWrite(LED, LOW);
        msg = char(SP_CHAR);
        //you can reply to the client here
      }
    }
  }
  if (Serial.available()) {
    size_t len = Serial.available();
    uint8_t sbuf[len];
    Serial.readBytes(sbuf, len);
    //bello is a broadcast to all clients
    for (i = 0; i < MAX_SRV_CLIENTS; i++) {
      if (serverClients[i] && serverClients[i].connected()) {
        serverClients[i].write(sbuf, len);
        delay(1);
      }
    }
  }
}

void sendKeyValue(String value) {
  //  blinkData(3, ksm, 1);
  //  blinkString("");
  //  blinkData(3, vsm, 1);
  blinkString(value);
  delay(LONG_DELAY);
}

void blinkString(String val) {
  int len = val.length() + 1;
  char buf[len];
  int xv[len];
  val.toCharArray(buf, len);
  for (int i = 0; i < len - 1; i++) {
    xv[i] = int(buf[i]);
  }
  //  for (int j = 0; j < len - 1; j++)
  //    Serial.println(xv[j]);
  blinkData(3, xv, len - 1);
}

void blinkBin(int enc, int x[]) {
  d = 0;
  for (i = 0; i < LEN; i++) {
    Bit(enc, x[i]);
  }
}

void blinkData(int enc, int x[], int dlen) {
  d = 0; v = 0;
  for (i = 0; i < dlen; i++) {
    d = x[i];
    SW(1);
    SW(1);
    for (a = 0; a < 8; a++) {
      v = d >> a & 0x01;
      Bit(enc, v);
    }
    Bit(3, 0);
  }
}

void Bit(int enc, int on) {
  switch (enc) {
    case 1: // Manchester Encording 1 > ON OFF  0 > OFF ON
      SW(on);
      SW(!on);
      break;
    case 2: // 1 > ON  0 > OFF
      SW(on);
      break;
    case 3: // 1 > OFF ON ON ON  0 > OFF ON
      SW(0);
      SW(1);
      if (on == 1) {
        SW(1);
        //        SW(1);
      }
      break;
  }
}

void SW(int a) {
  if (a == 1) {
    digitalWrite(LED, HIGH);
    delayMicroseconds(CLK1);
//        Serial.print(1);
  }
  else {
    digitalWrite(LED, LOW);
    delayMicroseconds(CLK0);
//        Serial.print(0);
  }
}

