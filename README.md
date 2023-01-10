 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/iris-iot-sample)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-iot-sample)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Firis-interoperability-template&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Firis-iot-sample)

# iris-iot-sample
This is a sample of InterSystems IRIS Interoperability solution for IoT using MQTT.
It consume a MQTT message and send other MQTT message as response.

## Installation: ZPM

1. Open IRIS Namespace with Interoperability Enabled.
2. Open Terminal and call:

```
USER>zpm "install iris-iot-sample"
```

## Installation: Docker
1. Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/iris-iot-sample.git
```

2. Open the terminal in this directory and run:

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