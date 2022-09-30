import os
import time
import datetime
import glob
# import MySQLdb // for MySQL database
import Adafruit_DHT
import pymongo
from pymongo import MongoClient
import RPi.GPIO as GPIO
from time import strftime

GPIO.setmode(GPIO.board)
GPIO.setup(8, GPIO.IN)    #8 is the pin number for LDR
GPIO.setup(10, GPIO.OUT)  #10 is the pin number for LED

#Variables for MySQL
# db = MySQLdb.connect(host="localhost", user="admin", passwd="pass123", db="sensor") # replace password with your password
# cur = db.cursor()

#Variables for MongoDB
client = MongoClient("mongodb+srv://admin:li8TXxeO8n416O8t@cluster0.h0ymi0w.mongodb.net/?retryWrites=true&w=majority")
db = client['sensor']
collection = db['sensorData']

sensor=Adafruit_DHT.DHT11
sensor_pin = 4
humidity, temperature = Adafruit_DHT.read_retry(sensor, sensor_pin)

def dateTime(): #get UNIX time
        secs = float(time.time())
        secs = secs*1000
        return secs

def tempRead(): #read temperature, return float with 3 decimal places
        degrees = float('{0:.3f}'.format(temperature))
        return degrees

def humidityRead(): #read humidity, return float with 3 decimal places
        humidity = float('{0:.3f}'.format(humidity))
        return humidity

def ldrRead(): #read LDR, return 0 or 1
        if GPIO.input(8) == 0:
                GPIO.output(10, GPIO.LOW)
                return False
        else:
                GPIO.output(10, GPIO.HIGH)
                return True



secs = dateTime()
temperatures = tempRead()
humiditys = humidityRead()
lighting = ldrRead()

# Write data to MongoDB database
def mongoWrite(): 
        data = {"time": dateTime(), "temperature": tempRead(), "humidity": humidityRead(), "ldr": ldrRead()}
        collection.insert_one(data)

# write data to MySQL database
# sql = ("""INSERT INTO dhtsensor (datetime,temperature,humidity) VALUES (%s,%s,%s)""", (secs, temperatures, humiditys))

# try:
#     print("Writing to the database...")
#     cur.execute(*sql)
#     db.commit()
#     print ("Writing completed")

# except:
#     db.rollback()
#     print ("We have a problem !!")

# cur.close()
# db.close()

print (secs)
print (temperatures)
print (humiditys)
print (lighting)