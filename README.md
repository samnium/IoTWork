# IoTWork

IoTWork is a home made frameworking for using devices (and their sensors) in a very simple IoT Context.

IoTWork project includes three main components:

* IoTWork.Reader: c# application to run on a IoT Device
* [IoTWork.Bridge](https://github.com/samnium/IoTWork.NetBridge): a C library to allow to IoTWok.Reader to access to hardware and system on a Linux platform
* IoTWork.Central: c# server side applications

Current version of IoTWork.Reader focuses on the [Raspberry Pi3](https://www.raspberrypi.org/) and [Sense Hat](https://www.raspberrypi.org/products/sense-hat/); the operating system is the [raspbian](https://www.raspbian.org/) Linux and the toolchain used is [mono](http://www.mono-project.com/).

![IoTWork.Network](IoTWork/images/IoTNetwork.PNG)
