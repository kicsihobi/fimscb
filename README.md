# fimscb




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
drvAsynIPPortConfigure("FIMSCB", "127.0.0.1:9999", 0, 0, 0)
dbLoadRecords("db/iocAdminSoft.db",  "IOC=FIMSCB-KAM:IocStats")
dbLoadRecords("db/fimscb.db", "PREFIX=FIMSCB-KAM:,PORT=FIMSCB")
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
[17:27:38.639] Client connection opened.
```
