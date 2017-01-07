# IoTWork

IoTWork is an home made framework for small devices (and their sensors).
You can use it in a very simple IoT Network or you can build more complex components at your needs.

IoTWork project includes three main components:

* [IoTWork.Reader](https://github.com/samnium/IoTWork.Reader): c# application to run on a IoT Device
* [IoTWork.Bridge](https://github.com/samnium/IoTWork.NetBridge): a C library and C# bridge to allow a IoTWok.Reader to access to the hardware on a Linux platform
* IoTWork.Central: c# server side applications

Current version of IoTWork.Reader focuses on the [Raspberry Pi3](https://www.raspberrypi.org/) and [Sense Hat](https://www.raspberrypi.org/products/sense-hat/); the operating system is the [raspbian](https://www.raspbian.org/) Linux and the toolchain used is [mono](http://www.mono-project.com/).

## The IoTNetwork

![IoTWork.Network](https://github.com/samnium/IoTWork/blob/master/images/IoTWork.Network.Diagram.png)
