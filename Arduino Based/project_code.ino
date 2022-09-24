#include <dht.h>
#include <LiquidCrystal.h>

dht DHT;

LiquidCrystal lcd(6, 7, 8, 9, 10, 11); // RS, EN, D4, D5, D6, D7 (LCD Display)
const int dht_pin = A0; // temperature and humidity sensor analog Pin sensor is connected to this
const int ldrPin = A1;  // light sensor input pin defined
const int pirPin = 2;   // the digital pin connected to the PIR sensor's output
const int ledPin1 = 13;  // led output pin defined
const int ledPin2 = 12;  // led output pin defined
// const int ledPin3 = 11;  // led output pin defined

void setup(){
    Serial.begin(9600);
    delay(500); //Delay to let system boot.
    Serial.println("Room Analysis Project Initiated using Temperature, Motion and Light sensors.");
    pinMode(ledPin1, OUTPUT);   
    pinMode(ledPin2, OUTPUT);   
    // pinMode(ledPin3, OUTPUT);
    pinMode(ldrPin, INPUT); 
    pinMode(pirPin, INPUT); 
    delay(1000); // Waiting to access the sensors.
}


void loop(){
    // Temperature and Humidity Sensor
    DHT.read11(dht_apin);
    Serial.print("Current humidity = ");
    Serial.print(DHT.humidity);
    Serial.print("%  ");
    Serial.print("temperature = ");
    Serial.print(DHT.temperature); 
    Serial.println("C  ");

    // Light Sensing Sensor
    int ldrStatus = analogRead(ldrPin);
    if (ldrStatus <= 400)
    {
        digitalWrite(ledPin1, HIGH);
        Serial.print("Its Dark, Turn on the LED:");
        Serial.println(ldrStatus);
    }
    else
    {
        digitalWrite(ledPin1, LOW);
        Serial.print("Its Bright, Turn off the LED:");
        Serial.println(ldrStatus);
    }

    // Motion Sensor
    int pirStatus = digitalRead(pirPin);
    if (pirStatus == HIGH)
    {
        digitalWrite(ledPin2, HIGH);
        Serial.print("Motion Detected, Turn on the LED:");
        Serial.println(pirStatus);
    }
    else
    {
        digitalWrite(ledPin2, LOW);
        Serial.print("No Motion Detected, Turn off the LED:");
        Serial.println(pirStatus);
    }
    delay(20000);//Wait 20 seconds before accessing sensor again.
}