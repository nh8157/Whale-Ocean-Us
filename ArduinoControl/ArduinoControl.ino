int switchpin = 4;
int motorpin = 3;

void setup() {
  // put your setup code here, to run once:
  pinMode(switchpin, INPUT);
  pinMode(motorpin, OUTPUT);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  int switchinput = digitalRead(switchpin);
  if (switchinput == 1){
    digitalWrite(motorpin, HIGH);
  } else {
    digitalWrite(motorpin, LOW);
  }
}
