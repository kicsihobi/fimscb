#!../../bin/linux-x86_64/fimscb

< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH", ".:${TOP}/db")

epicsEnvSet(P, FIMSCB)
epicsEnvSet(R, KAM)

epicsEnvSet("IOCST", "$(P)-$(R):IocStats")

cd "${TOP}"

dbLoadDatabase "dbd/fimscb.dbd"
fimscb_registerRecordDeviceDriver pdbbase

drvAsynIPPortConfigure("FIMSCB", "127.0.0.1:9999", 0, 0, 0)

dbLoadRecords("db/iocAdminSoft.db",  "IOC=${IOCST}")
dbLoadRecords("db/fimscb.db", "PREFIX=$(P)-$(R):,PORT=FIMSCB")

cd "${TOP}/iocBoot/${IOC}"

iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"
