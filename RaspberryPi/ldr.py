# Video Link : https://www.youtube.com/watch?v=mvjMmikaDJ0&ab_channel=EC9CLASSES
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.board)
GPIO.setup(8, GPIO.IN)    #8 is the pin number
GPIO.setup(10, GPIO.OUT)  #10 is the pin number

while True:
    print(GPIO.input(8))
    if GPIO.input(8) == 0:
        print("No light")
        GPIO.output(10, GPIO.LOW)
    else:
        print("Light")
        GPIO.output(10, GPIO.HIGH)
