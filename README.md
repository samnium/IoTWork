<p align="center">
    <img src="https://rawgit.com/samnium/IoTWork/master/images/IoTWorl.Logo.png">
</p>

# IoTWork

IoTWork is an home made framework for small devices (and their sensors).
You can use it in to build a IoT Network or simply a Sensors Network

IoTWork project includes three main components:

* [IoTWork.Reader](https://github.com/samnium/IoTWork.Reader): a generic Reader to acquire datas from Sensors and dispatching them to the Central, (.Net C# Application to run on a IoT Device);
* IoTWork.Central: the Central part of the System composed by many Data Picker and a Network Manage (.Net C# Server Side Applications);
* [IoTWork.Bridge](https://github.com/samnium/IoTWork.NetBridge): a C library and C# dlls to allow a IoTWok.Reader to access to the hardware on a Linux platform


Current version of IoTWork.Reader is focused on the [Raspberry Pi3](https://www.raspberrypi.org/) and [Sense Hat](https://www.raspberrypi.org/products/sense-hat/); the operating system is the [raspbian](https://www.raspbian.org/) Linux and the toolchain used is [mono](http://www.mono-project.com/).

[BUILDING AND RUNNING](https://github.com/samnium/IoTWork/blob/master/BUILDING.md)


## The IoTWork.Network

*Many Readers distributed over a traditional TCP/IP netwkor acquire datas from their Sensors in order to send them to the Central. Readers are partitioned over sets, each sets communicates with a Picker Server. The whole network, composed by Pickers and Readers, is managed by a Network Manager.*


![How IoTWork.Network is made](https://github.com/samnium/IoTWork/blob/master/images/IoTWork.Network.Diagram.1.png)



