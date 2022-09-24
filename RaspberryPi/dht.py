import Adafruit_DHT
import time

# Set sensor type : Options are DHT11,DHT22 or AM2302
sensor=Adafruit_DHT.DHT11
sensor_pin = 4

while True:
    humidity, temperature = Adafruit_DHT.read_retry(sensor, sensor_pin)
    if humidity is not None and temperature is not None:
        print('Temp={0:0.1f}*C  Humidity={1:0.1f}%'.format(temperature, humidity))
    else:
        print('Failed to get reading. Try again!')
    time.sleep(5)