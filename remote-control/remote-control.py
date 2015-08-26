#!/usr/bin/python

# you can run xev to get the keystroke name

import os
import paho.mqtt.client as mqtt


def on_connect(client, userdata, flags, rc):
    print ("Connected with result code " + str(rc))
    client.subscribe("key")

def on_message(client, userdata, msg):
    print(msg.topic + " " + str(msg.payload))
    #for i in range(1,15):
    os.system("xdotool key " + str(msg.payload))
    #os.system("xdotool key Next")

    
client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("modouwifi.net")
client.loop_forever()


#client.publish("ayao", "test msg") 

