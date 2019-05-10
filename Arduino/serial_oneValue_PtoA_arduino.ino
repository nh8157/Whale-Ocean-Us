// IMA NYU Shanghai
// Interaction Lab
// This code receives one value from Processing to Arduino 


char valueFromProcessing;
int ledPin = 3;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}


void loop() {
  // to receive a value from Processing
  while (Serial.available()) {
    valueFromProcessing = Serial.read();
  }
  
  if (valueFromProcessing == 'H') {
    digitalWrite(ledPin, HIGH);
    delay(1000);
  } else {
    digitalWrite(ledPin, LOW);
  } 
  
  
  // too fast communication might cause some latency in Processing
  // this delay resolves the issue.
  delay(10);
}
