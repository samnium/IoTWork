
#--------------------------------------------------
# PATHS
#--------------------------------------------------

BASE=$(shell pwd)
SOURCES=${BASE}/IoTWork.Reader
READER=${SOURCES}/IoTWork.IoTReader.net4
CONTRACTS=${SOURCES}/IoTWork.Contracts.net4
CONSOLE=${SOURCES}/IoTWork.IoTReader.Console.net4
SAMPLES=${SOURCES}/IoTWork.Samples.net4
TRIALS=${SOURCES}/IoTTrials
RASPTRIALS=${TRIALS}/Raspberry.Pi.SenseHat/Device

IOTBASE=/iot/
IOTREADERBASE=/iot/iotreader/
BINARIES=/iot/iotreader/bin/
SENSORS=/iot/iotreader/sensors/
PIPES=/iot/iotreader/pipes/
MODULES=/iot/iotreader/modules/

NETBRIDGE=${BASE}/IoTWork.NetBridge
NETBRIDGE_NET=${BASE}/IoTWork.NetBridge/Net
NETBRIDGE_BRIDGE=${BASE}/IoTWork.NetBridge/Bridge
	
#--------------------------------------------------
# TARGETS
#--------------------------------------------------

all: help

build: netbridge-clean netbridge-build reader 

clean: netbridge-clean reader-clean


#..................................................
# --> --> --> GIT
#..................................................

git-clone:
	-cd ../; git clone https://github.com/samnium/IoTWork.NetBridge.git
	-cd ../; git clone https://github.com/samnium/IoTWork.Reader.git

git-prepare:
	test -s IoTWork.Reader || (test -s ../IoTWork.Reader && ln -s ../IoTWork.Reader/)
	test -s IoTWork.NetBridge || (test -s ../IoTWork.NetBridge && ln -s ../IoTWork.NetBridge/)

git-reset:
	rm -f IoTWork.Reader
	rm -f IoTWork.NetBridge


#..................................................
# --> --> --> READER
#..................................................

reader: reader-clean reader-build reader-install reader-run

reader-run:
	cd ${BINARIES}; ./IoTWork.IoTReader.Console.net4.exe --islinux

reader-build: reader-raspmodules
	cd ${SOURCES}; xbuild IoTWork.IoTReader.net4/IoTWork.IoTReader.net4.csproj /p:TargetFrameworkVersion="v4.5"
	cd ${SOURCES}; xbuild IoTWork.Contracts.net4/IoTWork.Contracts.net4.csproj /p:TargetFrameworkVersion="v4.5"
	cd ${SOURCES}; xbuild IoTWork.IoTReader.Console.net4/IoTWork.IoTReader.Console.net4.csproj /p:TargetFrameworkVersion="v4.5"
	cd ${SOURCES}; xbuild IoTWork.Samples.net4/IoTWork.Samples.net4.csproj /p:TargetFrameworkVersion="v4.5"

reader-raspmodules:
	xbuild ${RASPTRIALS}/Pi.SHat.Sensor.Humidity.mono/Pi.SHat.Sensor.Humidity.mono.csproj /p:TargetFrameworkVersion="v4.5"
	xbuild ${RASPTRIALS}/Pi.SHat.Sensor.Pressure.mono/Pi.SHat.Sensor.Pressure.mono.csproj /p:TargetFrameworkVersion="v4.5"
	xbuild ${RASPTRIALS}/Pi.SHat.Sensor.Temperature.mono/Pi.SHat.Sensor.Temperature.mono.csproj /p:TargetFrameworkVersion="v4.5"
	xbuild ${RASPTRIALS}/Pi.SHat.Sensor.Pipe.Dump.mono/Pi.SHat.Sensor.Pipe.Dump.mono.csproj /p:TargetFrameworkVersion="v4.5"

reader-clean:
	rm -fr ${READER}/bin
	rm -fr ${CONTRACTS}/bin
	rm -fr ${CONSOLE}/bin
	rm -fr ${SAMPLES}/bin
	rm -fr ${READER}/obj
	rm -fr ${CONTRACTS}/obj
	rm -fr ${CONSOLE}/obj
	rm -fr ${SAMPLES}/obj
	rm -fr ${RASPTRIALS}/Pi.SHat.Sensor.Humidity.mono/bin
	rm -fr ${RASPTRIALS}/Pi.SHat.Sensor.Pressure.mono/bin
	rm -fr ${RASPTRIALS}/Pi.SHat.Sensor.Temperature.mono/bin
	rm -fr ${RASPTRIALS}/Pi.SHat.Sensor.Pipe.Dump.mono/bin
	rm -fr ${RASPTRIALS}/Pi.SHat.Sensor.Humidity.mono/obj
	rm -fr ${RASPTRIALS}/Pi.SHat.Sensor.Pressure.mono/obj
	rm -fr ${RASPTRIALS}/Pi.SHat.Sensor.Temperature.mono/obj
	rm -fr ${RASPTRIALS}/Pi.SHat.Sensor.Pipe.Dump.mono/obj

reader-install:
	mkdir -p ${IOTBASE}
	mkdir -p ${IOTREADERBASE}
	mkdir -p ${BINARIES}
	mkdir -p ${SENSORS}
	mkdir -p ${PIPES}
	mkdir -p ${MODULES}
	rm -f ${BINARIES}/*
	rm -f ${SENSORS}/*
	rm -f ${PIPES}/*
	rm -f ${MODULES}/*
	cp -f ${CONTRACTS}/bin/Debug/IoTWork.Contracts.net4.dll ${SENSORS}
	cp -f ${CONTRACTS}/bin/Debug/IoTWork.Contracts.net4.dll ${PIPES}
	cp -f ${SAMPLES}/bin/Debug/IoTWork.Samples.net4.dll ${SENSORS}
	cp -f ${SAMPLES}/bin/Debug/IoTWork.Samples.net4.dll ${PIPES}
	cp -f ${RASPTRIALS}/Pi.SHat.Sensor.Pipe.Dump.mono/bin/Debug/Pi.SHat.Sensor.Humidity.mono.dll ${SENSORS}
	cp -f ${RASPTRIALS}/Pi.SHat.Sensor.Pipe.Dump.mono/bin/Debug/Pi.SHat.Sensor.Pressure.mono.dll ${SENSORS}
	cp -f ${RASPTRIALS}/Pi.SHat.Sensor.Pipe.Dump.mono/bin/Debug/Pi.SHat.Sensor.Temperature.mono.dll ${SENSORS}
	cp -f ${RASPTRIALS}/Pi.SHat.Sensor.Pipe.Dump.mono/bin/Debug/Pi.SHat.Sensor.Pipe.Dump.mono.dll ${PIPES}
	cp -f ${SOURCES}/drop/Bridge.Linux.dll ${MODULES}
	cp -f ${SOURCES}/drop/Pi.SHat.RTIMULib.dll ${MODULES}
	cd ${MODULES}; ls *.dll > modules.txt	
	cp -f ${SOURCES}/IoTWork.IoTReader.Console.net4/bin/Debug/* ${BINARIES}



#..................................................
# --> --> --> NETBRIDGE
#..................................................


netbridge: netbridge-clean netbridge-build netbridge-run

netbridge-run:
	cd ${NETBRIDGE_NET}; Pi.SHat.RTIMULib.Console/bin/Debug/Pi.SHat.RTIMULib.Console.exe

netbridge-build:
	cd ${NETBRIDGE}; xbuild Net/Bridge.Linux/Bridge.Linux.csproj /p:TargetFrameworkVersion="v4.5"
	cd ${NETBRIDGE}; xbuild Net/Pi.SHat.RTIMULib/Pi.SHat.RTIMULib.csproj /p:TargetFrameworkVersion="v4.5"
	cd ${NETBRIDGE}; xbuild Net/Pi.SHat.RTIMULib.Console/Pi.SHat.RTIMULib.Console.csproj /p:TargetFrameworkVersion="v4.5"
	mkdir -p ${NETBRIDGE}/build
	cp -f ${NETBRIDGE_NET}/Bridge.Linux/bin/Debug/Bridge.Linux.dll* ${NETBRIDGE}/build/
	cp -f ${NETBRIDGE_NET}/Pi.SHat.RTIMULib/bin/Debug/Pi.SHat.RTIMULib.dll* ${NETBRIDGE}/build/
	mkdir -p ${SOURCES}/drop
	cp ${NETBRIDGE_NET}/Bridge.Linux/bin/Debug/Bridge.Linux.dll* ${SOURCES}/drop/
	cp ${NETBRIDGE_NET}/Pi.SHat.RTIMULib/bin/Debug/Pi.SHat.RTIMULib.dll* ${SOURCES}/drop/
	cd ${NETBRIDGE_BRIDGE}; make; make install

netbridge-clean:
	rm -fr ${NETBRIDGE}/build
	cd ${NETBRIDGE_BRIDGE}; make clean
	rm -fr ${NETBRIDGE_NET}/build
	rm -fr ${NETBRIDGE_NET}/Bridge.Linux/bin
	rm -fr ${NETBRIDGE_NET}/Pi.SHat.RTIMULib/bin
	rm -fr ${NETBRIDGE_NET}/Pi.SHat.RTIMULib.Console/bin
	rm -fr ${NETBRIDGE_NET}/Bridge.Linux/obj
	rm -fr ${NETBRIDGE_NET}/Pi.SHat.RTIMULib/obj
	rm -fr ${NETBRIDGE_NET}/Pi.SHat.RTIMULib.Console/obj


#..................................................
# --> --> --> HELP
#..................................................

help:
	@echo ""
	@echo "all                       Show help"
	@echo "help                      This help"
	@echo ""
	@echo "git-clone                 Clone IoTWork repositories"
	@echo "git-prepare               Create IoTWork from git"
	@echo "git-reset                 Reset IoTWork links and artifcats"
	@echo ""
	@echo "build                     Build and Run and Enjoy"
	@echo "clean                     Clean all"
	@echo ""
	@echo "netbridge                 Clean, Build and Run on NetBridge"
	@echo "netbridge-clean           Clean NetBridge modules"
	@echo "netbridge-build           Build NetBridge modules and create c# drop folder for teh Reader"
	@echo "netbridge-run             Run NetBridge test application (raspberry pi 3)"
	@echo ""
	@echo "reader                    Clean, Build, Install and Run on Reader"
	@echo "reader-clean              Clean Reader core and Raspberry Pi3"
	@echo "reader-build              Build Reader core modules"
	@echo "reader-raspmodules        Build modules (sensors and pipe) for Raspberry Pi3 SenseHat"
	@echo "reader-install            Package a Raspberry Pi 3 IoTWork environment (binaries, sensors, pipes and modules)"      
	@echo "reader-run                Run the packaged reader"
	@echo ""

path:
	@echo ""
	@echo " BASE              ${BASE}"
	@echo " SOURCES           ${SOURCES}"
	@echo " READER            ${READER}"
	@echo " CONTRACTS         ${CONTRACTS}"
	@echo " CONSOLE           ${CONSOLE}"
	@echo " SAMPLES           ${SAMPLES}"
	@echo " TRIALS            ${TRIALS}"
	@echo " RASPTRIALS        ${RASPTRIALS}"
	@echo ""
	@echo " IOTBASE           ${IOTBASE}"
	@echo " IOTREADERBASE     ${IOTREADERBASE}"
	@echo " BINARIES          ${BINARIES}"
	@echo " SENSORS           ${SENSORS}"
	@echo " PIPES             ${PIPES}"
	@echo " MODULES           ${MODULES}"
	@echo ""
	@echo " NETBRIDGE         ${NETBRIDGE}"
	@echo " NETBRIDGE_NET     ${NETBRIDGE_NET}"
	@echo " NETBRIDGE_BRIDGE  ${NETBRIDGE_BRIDGE}"
	@echo ""
