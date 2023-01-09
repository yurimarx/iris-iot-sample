 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/iris-iot-sample)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-iot-sample)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-iot-sample)

# iris-iot-sample
This is a sample of InterSystems IRIS Interoperability solution for IoT using MQTT.
It consume a MQTT message and send other MQTT message as response.

## What The Sample Does

This sample has an interoperability [production](https://github.com/intersystems-community/iris-interoperability-template/blob/master/src/dc/Demo/Production.cls) with an inbound [Reddit Adapter](https://github.com/intersystems-community/iris-interoperability-template/blob/master/src/dc/Reddit/InboundAdapter.cls) which is used by a [Business Service](https://github.com/intersystems-community/iris-interoperability-template/blob/master/src/dc/Demo/RedditService.cls) to read data from Reddit.com.
It reads from reddit.com/new/.json every 15 sec.
You can alter both the URL and frequency in the service's settings.
<img width="1411" alt="Screenshot 2020-10-29 at 19 33 14" src="https://user-images.githubusercontent.com/2781759/97603605-a6d0af00-1a1d-11eb-99cc-481efadb0ec6.png">

The production has a business process with a rule, which filters on news that mentions cats and dogs. The business process then sends this data to a business operation which either saves data to a source folder /output/Dog.txt or /output/Cat.txt.
<img width="864" alt="Screenshot 2020-10-29 at 19 38 58" src="https://user-images.githubusercontent.com/2781759/97606568-fcf32180-1a20-11eb-90de-4257dd2cf552.png"> 


## Installation: ZPM

Open IRIS Namespace with Interoperability Enabled.
Open Terminal and call:
USER>zpm "install iris-iot-sample"

## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/iris-iot-sample.git
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container with your project:

```
$ docker-compose up -d
```



## How to Run the Sample

1. Open the [production](http://localhost:52795/csp/user/EnsPortal.ProductionConfig.zen?$NAMESPACE=USER&$NAMESPACE=USER&) and start it.
It will start observing the MQTT topic /DeviceStatusInputTopic and it will produce responses to MQTT topic /DeviceStatusOutputTopic. See:

<img alt="Production" src="https://github.com/yurimarx/iris-iot-sample/blob/master/Production.png?raw=true">

2. Use a MQTT client to send a message and test the production. For this, into your Google Chrome browser access https://chrome.google.com/webstore/detail/mqttbox/kaajoficamnjijhkeomgfljpicifbkaf. It is the Chrome Plugin MQTTBox. Click Add to Chrome and after Add App.

<img alt="MQTTBox" src="https://github.com/yurimarx/iris-iot-sample/blob/master/MQTTBox.png?raw=true">

3. In your Google Chrome browser access chrome://apps/ and select MQTTBox (if required, click Open Anyway).

<img alt="Open MQTTBox" src="https://github.com/yurimarx/iris-iot-sample/blob/master/OpenMQTTBox.png?raw=true">

4. Click Create MQTT Client button.

<img alt="Click Create Client" src="https://github.com/yurimarx/iris-iot-sample/blob/master/CreateMQTTClient.png?raw=true">

5. Configure the MQTT connection with these settings:

- Client name: Local
- Protocol: mqtt / tcp
- Host: localhost:1883
- Username: admin
- Password: admin
- All other settings are the default values

<img alt="MQTTBox Settings" src="https://github.com/yurimarx/iris-iot-sample/blob/master/MQTTBoxSettings.png?raw=true">

6. Configure the MQTT topics to send and receive MQTT messages:

- Topic to publish: /DeviceStatusInputTopic
- Topic to subscribe: /DeviceStatusOutputTopic
- Payload: 

```
{
"deviceId":"Air Conditioner Level 1",
"statusDate":"2023-01-07 14:03:00",
"status": 0
}
```

<img alt="MQTTBox Topics Config" src="https://github.com/yurimarx/iris-iot-sample/blob/master/MQTTBoxTopicsConfig.png?raw=true">

7. Click the button Subscribe to listen messages on the topic /DeviceStatusOutputTopic. Now the UI changes to wait for messages on this topic.

<img alt="MQTTBox Wait messages" src="https://github.com/yurimarx/iris-iot-sample/blob/master/MQTTBoxWaitMessages.png?raw=true">

8. Click the button Publish to send a message to /DeviceStatusInputTopic and see the results produced by IRIS production on /DeviceStatusOutputTopic

<img alt="MQTTBox Topic results" src="https://github.com/yurimarx/iris-iot-sample/blob/master/MQTTBoxTopicResults.png?raw=true">

9. See the message processing session on IRIS Management Portal Visual Trace

<img alt="Production Visual Trace" src="https://github.com/yurimarx/iris-iot-sample/blob/master/ProductionVisualTrace.png?raw=true">