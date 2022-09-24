void setup(){
  pinMode(13,1);
  pinMode(12,1);
  Serial.begin(115200);
}

void loop() {
  int value = analogRead(A0);

  Serial.println("Analogic Value coming from the sensor : ");  
  Serial.println(value);
  delay(10000);

  if(value<400){
    digitalWrite(13,1);
  }
  else{
    digitalWrite(12,1);
  }
  delay(20);
}
