// Light Sensing Sensor Arduino Code

const int ledPin = 13; // led output pin defined
const int ldrPin = A0; // ldr input pin defined

void setup() {
  Serial.begin(9600); // by default
  pinMode(ledPin, OUTPUT);
  pinMode(ldrPin, INPUT);
}

void loop() {
  int ldrStatus = analogRead(ldrPin);

  if (ldrStatus <= 400)
  {
    digitalWrite(ledPin, HIGH);
    Serial.print("Its Dark, Turn on the LED:");
    Serial.println(ldrStatus);

  }
  else
  {
    digitalWrite(ledPin, LOW);
    Serial.print("Its Bright, Turn off the LED:");
    Serial.println(ldrStatus);
  }

}