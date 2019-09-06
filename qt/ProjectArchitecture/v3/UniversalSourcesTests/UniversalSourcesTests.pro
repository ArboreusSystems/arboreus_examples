# -------------------------------------------------------------------
#  @doc
#  @notice Template file is test.pro
# 
#  @copyright Arboreus (http://arboreus.systems)
#  @author Alexandr Kirilov (http://alexandr.kirilov.me)
#  @created 03/09/2019 at 20:18:26
# -------------------------------------------------------------------

QT += testlib
QT -= gui

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += \
	tst_universalsourcestests.cpp \
	../UniversalSources/TestClass/atestclass.cpp

HEADERS += \
	../UniversalSources/Global/aglobal.h \
	../UniversalSources/TestClass/atestclass.h
