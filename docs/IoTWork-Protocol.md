

IoTWork.Protocol is the communication protocol used between Reader and the Central.
It has two main purposes:

* DATA SHARING: From the Reader to the Central: it is used to send Data reads from sensors of a Reader
* MANAGEMENT  : From the Central to the Reader: it is used to send Commands to a Reader

Current version of IoTWork.Protocol is the 1.0. It includes 

* rules for package formatting
* rules for signing pieces of the message

A IoTWork.Protocol Message is composed by an Header and a Payload.
The Header's format is always the same. The Payload changes from message to messages.
We have two main Groups of payloads:

* Payloads for the Data Sending
* Payloads for the Management

Each Payload Group has a unique numeric identifier called ServiceCode.
Each Payload Type has a unique numeric identifier called PacketCode.


In the following:

The word Packet refers to the whole message composed by Header and Payload.
The word Payload refers to the real payload of the message.

### Message Signing

A IoTWork.Protocol Message is sent in clear without encription.
The Packet and the Payload are signed and these signatures are sent inside the Header.

The signature algorithm used is the Hash based Message Authentication Code
https://en.wikipedia.org/wiki/Hash-based_message_authentication_code
also kwnon as HMAC.

The sender and the receiver share two secret keys: payload-key, device-key.

The Header contains two special fields named HMAC1 and HMAC2 used to contains the signatures.

The Payload's signature is calculated over the Payload using payload-key and and it stored inside the field HMAC1.
The Packet's signature is calculated over the Packet using device-key and is stored inside the field HMAC2.


### The IoTWork.Protocol Header

The IoTWork.Protocol Header includes following fields:

* GUID: a Globally Unique Identifier, it is unique inside the lifecycle of the Device
* VMJ: the Major Version Number of the Protocol
* VMM: the Minor Version Number of the Protocol
* DUA: the Unique Address of the Reader (usually in the form of Network.Region.Ring.Device)
* SUA: the Unique Address of the Sensor inside the Device, this field is used only for payloads for the Data sending
* RGN: the Region who the packet belong
* SAD: the Unique Source Address of the Reader inside the IoTWork.Network 
* TVD: a list of Traversed DUA
* SCD: the Service Code of the Payload
* PCD: the Packet Code of the Payload
* SAT: the Sending date
* SNB: the Unique Sequence Number of the Packet inside the Service Code.
* HMAC1: Signature of the Payload
* HMAC2: Signature of the Packet

### The IoTWork.Protocol Payloads




