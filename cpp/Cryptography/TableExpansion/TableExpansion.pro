TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
	afile.cpp \
	aglobal.cpp \
	arandom.cpp \
	arandombook.cpp \
	astatictable.cpp \
	main.cpp

HEADERS += \
    afile.h \
    afiledatamodels.h \
    aglobal.h \
    arandom.h \
    arandombook.h \
    arandomdatamodels.h \
    astatictable.h \
    astatictabledatamodels.h
