TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = fimscb
# fimscb.dbd will be created and installed
DBD += fimscb.dbd

# fimscb.dbd will be made up from these files:
fimscb_DBD += base.dbd
fimscb_DBD += devIocStats.dbd
fimscb_DBD += stream.dbd
fimscb_DBD += asyn.dbd
fimscb_DBD += drvAsynSerialPort.dbd
fimscb_DBD += drvAsynIPPort.dbd

# Include dbd files from all support applications:
#fimscb_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
fimscb_LIBS += stream asyn
fimscb_LIBS += devIocStats

# fimscb_registerRecordDeviceDriver.cpp derives from fimscb.dbd
fimscb_SRCS += fimscb_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
fimscb_SRCS_DEFAULT += fimscbMain.cpp
fimscb_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#fimscb_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
fimscb_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

