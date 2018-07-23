#!../../bin/linux-x86_64/fimscb

< envPaths

epicsEnvSet("STREAM_PROTOCOL_PATH", ".:${TOP}/db")

epicsEnvSet(P, FIMSCB)
epicsEnvSet(R, KAM)

epicsEnvSet("IOCST", "$(P)-$(R):IocStats")


cd "${TOP}"

dbLoadDatabase "dbd/fimscb.dbd"
fimscb_registerRecordDeviceDriver pdbbase

epicsEnvSet("PORT", "FIMSCB")
	    
drvAsynIPPortConfigure($(PORT), "127.0.0.1:9999", 0, 0, 0)
# <0x0d> \r
# <0x0a> \n
asynOctetSetInputEos($(PORT), 0, "\r\n")
asynOctetSetOutputEos($(PORT), 0, "\r")
#asynOctetSetInputEos($(PORT), 0, "\n")
#asynOctetSetOutputEos($(PORT), 0, "\r\n")

dbLoadRecords("db/iocAdminSoft.db",  "IOC=${IOCST}")
dbLoadRecords("db/fimscb.db",     "P=$(P)-$(R):FimSCB:,PORT=FIMSCB")
#dbLoadRecords("db/stream_raw.db", "P=$(P)-$(R):,PORT=FIMSCB")

cd "${TOP}/iocBoot/${IOC}"

iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"
