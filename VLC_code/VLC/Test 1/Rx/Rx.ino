void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);

  //  ADCSRA &= ~(bit (ADPS0) | bit (ADPS1) | bit (ADPS2)); // clear prescaler bits

  ADCSRA = 0;             // clear ADCSRA register
  ADCSRB = 0;             // clear ADCSRB register
  ADMUX |= (0 & 0x07);    // set A0 analog input pin
  ADMUX |= (1 << REFS0);  // set reference voltage
  ADMUX |= (1 << ADLAR);  // left align ADC value to 8 bits from ADCH register

  // sampling rate is [ADC clock] / [prescaler] / [conversion clock cycles]
  // for Arduino Uno ADC clock is 16 MHz and a conversion takes 13 clock cycles

  ADCSRA |= bit (ADPS0);                               //   2
  //  ADCSRA |= bit (ADPS1);                               //   4
  //  ADCSRA |= bit (ADPS0) | bit (ADPS1);                 //   8
  //  ADCSRA |= bit (ADPS2);                               //  16
  //  ADCSRA |= bit (ADPS0) | bit (ADPS2);                 //  32
  //  ADCSRA |= bit (ADPS1) | bit (ADPS2);                 //  64
  //  ADCSRA |= bit (ADPS0) | bit (ADPS1) | bit (ADPS2);   // 128
  //ADCSRA |= (1 << ADPS2) | (1 << ADPS0);    // 32 prescaler for 38.5 KHz
  //ADCSRA |= (1 << ADPS2);                     // 16 prescaler for 76.9 KHz
  //ADCSRA |= (1 << ADPS1) | (1 << ADPS0);    // 8 prescaler for 153.8 KHz

  ADCSRA |= (1 << ADATE); // enable auto trigger
  ADCSRA |= (1 << ADIE);  // enable interrupts when measurement complete
  ADCSRA |= (1 << ADEN);  // enable ADC
  ADCSRA |= (1 << ADSC);  // start ADC measurements
}

byte x = 0, p = 0;
byte gap = 50;

ISR(ADC_vect)
{
  //x=(ADCH-x>gap?ADCH:x;
  x = ADCH;  // read 8 bit value from ADC
  //Serial.print(x);
  printx();
  //a += x;
  //numSamples++;
}

void printx() {
  //if (abs(p - x) > gap) {
    p = x;
    Serial.println(p);
  //}
}


void loop() {
  // put your main code here, to run repeatedly:

}
