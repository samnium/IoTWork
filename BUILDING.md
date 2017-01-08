# How to Build and Run Applications

Instructions for building the Reader are different from the Central.
The Reader have to be built on a Linux System and it requires **Mono** (or .Net Core).
The Central is a standard Visual Studio Solution and it can be built and published using standard .Net process.

## Building a Reader on a Linux System

Following procedure has been tested on **Ubuntu Linux 16.04 LTS** and **Raspberry Pi 3 running Raspbian Linux**.

Before to go on you have to be sure to good understand how a Reader works and how the Reader's Configuration Tree is made. 

To build any applications on a Linux System you need to do three things:

* Install precondition's packages
* Build the GIT three
* Execute make commands

### Install precondition's packages

We assume your system has installed GCC (Gnu Compiler Collection) and GNU Make. 
You have to install standard mono using following command:

```
apt-get install mono-complete
```

### Build the GIT three

The GIT Tree is composed by three projects: IoTWork, IoTWork.NetBridge, IoTWork.Reader.
I suppose the working directory where these projects will be placed is simply named *git*
First of all clone the IoTWork project:

```
cd  git
git clone https://github.com/samnium/IoTWork.git
```
As you can see teh IoTWork folder is created.
Enter inside it and run command to clone other projects:

```
cd  IoTWork
make git-clone
make git-prepare
```
This command will clone IoTWork.Reader and IoTWork.NetBridge projects at the same level of the folder IoTWork; it will also create two symbolic links to these folders inside the folder IoTWork:

```
IoTWork.NetBridge -> ../IoTWork.NetBridge//
IoTWork.Reader -> ../IoTWork.Reader//
```

### Execute make commands

To build and run the Reader you can use make commands.
Typing:

```
make help
```

you will get the help of the most importants make's targerts.

#### The short way

You have just to type the command:

```
make go
```

Then:

# NetBridge is cleaned
# NetBridge is built and installed
# Reader is cleaned
# Reader is build and installed
# Reader is run

You can also using following commands:

```
make clean
```

This one clean evenrithing.

```
make build
```

This one build everithing but doesn't install and run.


#### The long way

The *"short way"* can be run step by step.

In order to make a Reader working you need to build the NetBridge components:

```
make netbridge-clean
make netbridge-build
make netbridge-install
```

This will compile the C library **libnetbridge.so** and install it inside **/usr/local/lib**. Moreover also C# dlls, **Bridge.Linux.dll** and **Pi.SHat.RTIMULib.dll**,  will be compiled and installed inside the folder  **IoTWork.Reader/drop/**; they will be referenced by the Reader.

*Note: compiling C modules requires you are listed inside the file /etc/sudoers because you need to access to /usr/local/lib folder. During the build process you will asked for password in order to run the "sudo" command. *

To build the Reader you need to execute following command:

```
make reader-clean
make reader-build
```

Once you have built a Reader then you can install it and after you can run it:

```
make reader-install
make reader-run
```









