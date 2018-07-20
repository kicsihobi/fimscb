# fimscb

[![Build Status](https://travis-ci.org/icshwi/fimscb.svg?branch=master)](https://travis-ci.org/icshwi/fimscb)


## Simulator

* Start the simulator

```
fimscb (master)$ bash simulator/simulator.bash 
~/epics_env/epics-Apps/fimscb ~/epics_env/epics-Apps/fimscb
~/epics_env/epics-Apps/fimscb

****************************************************
*                                                  *
*  Kameleon v1.5.0 (2017/SEP/14 - Production)      *
*                                                  *
*                                                  *
*  (C) 2015-2017 European Spallation Source (ESS)  *
*                                                  *
****************************************************

[17:25:48.489] Using file '/home/jhlee/epics_env/epics-Apps/fimscb/simulator/atomki_scb_monitor.kam' (contains 19 commands and 19 statuses).
[17:25:48.489] Start serving from hostname '127.0.0.1' on port '9999'.
```


## EPICS IOC

* Start IOC

```
fimscb (master)$ cd iocBoot/iocfimscb
iocfimscb (master)$ ./st.cmd
#!../../bin/linux-x86_64/fimscb
< envPaths
epicsEnvSet("IOC","iocfimscb")
epicsEnvSet("TOP","/home/jhlee/epics_env/epics-Apps/fimscb")
epicsEnvSet("STREAM_PROTOCOL_PATH", ".:/home/jhlee/epics_env/epics-Apps/fimscb/db")
epicsEnvSet(P, FIMSCB)
epicsEnvSet(R, KAM)
epicsEnvSet("IOCST", "FIMSCB-KAM:IocStats")
cd "/home/jhlee/epics_env/epics-Apps/fimscb"
dbLoadDatabase "dbd/fimscb.dbd"
fimscb_registerRecordDeviceDriver pdbbase
epicsEnvSet("PORT", "FIMSCB")

drvAsynIPPortConfigure(FIMSCB, "127.0.0.1:9999", 0, 0, 0)
# <0x0d> \r
# <0x0a> \n
asynOctetSetInputEos(FIMSCB, 0, "\n")
asynOctetSetOutputEos(FIMSCB, 0, "\r\n")
dbLoadRecords("db/iocAdminSoft.db",  "IOC=FIMSCB-KAM:IocStats")
dbLoadRecords("db/fimscb.db",     "P=FIMSCB-KAM:,PORT=FIMSCB")
#dbLoadRecords("db/stream_raw.db", "P=$(P)-$(R):,PORT=FIMSCB")
cd "/home/jhlee/epics_env/epics-Apps/fimscb/iocBoot/iocfimscb"
iocInit
Starting iocInit
############################################################################
## EPICS R3.16.1
## EPICS Base built Jun 26 2018
############################################################################
iocRun: All initialization complete
dbl > "/home/jhlee/epics_env/epics-Apps/fimscb/iocfimscb_PVs.list"
epics> ^C
jhlee@kaffee:~/epics_env/epics-Apps/fimscb/iocBoot/iocfimscb$ ./st.cmd 
#!../../bin/linux-x86_64/fimscb
< envPaths
epicsEnvSet("IOC","iocfimscb")
epicsEnvSet("TOP","/home/jhlee/epics_env/epics-Apps/fimscb")
epicsEnvSet("STREAM_PROTOCOL_PATH", ".:/home/jhlee/epics_env/epics-Apps/fimscb/db")
epicsEnvSet(P, FIMSCB)
epicsEnvSet(R, KAM)
epicsEnvSet("IOCST", "FIMSCB-KAM:IocStats")
cd "/home/jhlee/epics_env/epics-Apps/fimscb"
dbLoadDatabase "dbd/fimscb.dbd"
fimscb_registerRecordDeviceDriver pdbbase
epicsEnvSet("PORT", "FIMSCB")
            
drvAsynIPPortConfigure(FIMSCB, "127.0.0.1:9999", 0, 0, 0)
# <0x0d> \r
# <0x0a> \n
asynOctetSetInputEos(FIMSCB, 0, "\n")
asynOctetSetOutputEos(FIMSCB, 0, "\r\n")
dbLoadRecords("db/iocAdminSoft.db",  "IOC=FIMSCB-KAM:IocStats")
dbLoadRecords("db/fimscb.db",     "P=FIMSCB-KAM:FimSCB:,PORT=FIMSCB")
#dbLoadRecords("db/stream_raw.db", "P=$(P)-$(R):,PORT=FIMSCB")
cd "/home/jhlee/epics_env/epics-Apps/fimscb/iocBoot/iocfimscb"
iocInit
Starting iocInit
############################################################################
## EPICS R3.16.1
## EPICS Base built Jun 26 2018
############################################################################
iocRun: All initialization complete
dbl > "/home/jhlee/epics_env/epics-Apps/fimscb/iocfimscb_PVs.list"



```

One may see the following log in the simulator

```

[16:32:40.961] Client connection opened.
[16:32:41.464] Command 'I?<0x0d><0x0a>' (Get IP Address) received from client.
[16:32:41.465] Status '192.168.1.100<0x0a>' (Get IP Address) sent to client.
[16:32:41.466] Command 'S?<0x0d><0x0a>' (Get Subnet Mask) received from client.
[16:32:41.466] Status '255.255.255.0<0x0a>' (Get Subnet Mask) sent to client.
[16:32:41.467] Command 'G?<0x0d><0x0a>' (Get Gateway Address) received from client.
[16:32:41.467] Status '192.168.1.1<0x0a>' (Get Gateway Address) sent to client.
[16:32:41.468] Command 'G?<0x0d><0x0a>' (Get Gateway Address) received from client.
[16:32:41.468] Status '192.168.1.1<0x0a>' (Get Gateway Address) sent to client.
[16:32:41.470] Command 'P?<0x0d><0x0a>' (Get TCP Port) received from client.
[16:32:41.470] Status '6666<0x0a>' (Get TCP Port) sent to client.
[16:32:41.471] Command 'C?<0x0d><0x0a>' (Read Configuration) received from client.
[16:32:42.473] Command 'F?<0x0d><0x0a>' (Get Firmware Version) received from client.
[16:32:42.474] Status '20180720180000<0x0a>' (Get Firmware Version) sent to client.
[16:32:42.475] Command 'N?<0x0d><0x0a>' (Get Name) received from client.
[16:32:42.475] Status 'ESS FIM SCB Mon. v1 #0<0x0a>' (Get Name) sent to client.


```


One can check its PVs through tools/caget_pvs.bash with iocfimscb_PVs.list


```
$ bash tools/caget_pvs.bash iocfimscb_PVs.list "FimSCB"
>> Unset ... EPICS_CA_ADDR_LIST and EPICS_CA_AUTO_ADDR_LIST
Set ... EPICS_CA_ADDR_LIST and EPICS_CA_AUTO_ADDR_LIST 
>> Print ... 
EPICS_CA_ADDR_LIST      : 10.0.6.172
EPICS_CA_AUTO_ADDR_LIST : YES
>> Get PVs .... 


FIMSCB-KAM:FimSCB:FW-RB        20180720180000
FIMSCB-KAM:FimSCB:MODEL-RB     ESS FIM SCB Mon. v1 #0
FIMSCB-KAM:FimSCB:UPTIME-RB    196758
FIMSCB-KAM:FimSCB:IP-RB        192.168.1.100
FIMSCB-KAM:FimSCB:Subnet-RB    255.255.255.0
FIMSCB-KAM:FimSCB:Gateway-RB   192.168.1.1
FIMSCB-KAM:FimSCB:DNSServer-RB 192.168.1.1
FIMSCB-KAM:FimSCB:TCPPort-RB   6666
FIMSCB-KAM:FimSCB:U-RB         24266
FIMSCB-KAM:FimSCB:IDI-RB       240
FIMSCB-KAM:FimSCB:IDO-RB       243
FIMSCB-KAM:FimSCB:IA1-RB       257
FIMSCB-KAM:FimSCB:IA2-RB       245
FIMSCB-KAM:FimSCB:Temperature-RB 10841
FIMSCB-KAM:FimSCB:Pressure-RB  100620
FIMSCB-KAM:FimSCB:Humidity-RB  42141
FIMSCB-KAM:FimSCB:WriteConf-RB 0
FIMSCB-KAM:FimSCB:IP-SET       192.168.1.100
FIMSCB-KAM:FimSCB:IPUpdate-RB_ 192.168.1.100
FIMSCB-KAM:FimSCB:Subnet-SET   255.255.255.0
FIMSCB-KAM:FimSCB:SubnetUpdate-RB_ 255.255.255.0
FIMSCB-KAM:FimSCB:Gateway-SET  192.168.1.1
FIMSCB-KAM:FimSCB:GatewayUpdate-RB_ 192.168.1.1
FIMSCB-KAM:FimSCB:DNSServer-SET 192.168.1.1
FIMSCB-KAM:FimSCB:DNSServerUpdate-RB_ 192.168.1.1
FIMSCB-KAM:FimSCB:InfoUpdate-Cmd Revert
FIMSCB-KAM:FimSCB:TCPPort-SET  6666
FIMSCB-KAM:FimSCB:WriteConf-SET 0
FIMSCB-KAM:FimSCB:InfoUpdate:1-Fout_ 0
FIMSCB-KAM:FimSCB:TCPPortUpdate-RB_ 6666
FIMSCB-KAM:FimSCB:WriteConf-RB_ 0
```
