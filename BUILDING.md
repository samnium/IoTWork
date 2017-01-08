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
```
This command will clone IoTWork.Reader and IoTWork.NetBridge projects at the same level of the folder IoTWork; it will also create two symbolic links to these folders inside the folder IoTWork:






