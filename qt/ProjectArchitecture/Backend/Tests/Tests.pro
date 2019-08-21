# -------------------------------------------------------------------
#  @doc
#  @notice Template file is test.pro
# 
#  @copyright Arboreus (http://arboreus.systems)
#  @author Alexandr Kirilov (http://alexandr.kirilov.me)
#  @created 21/08/2019 at 08:30:20
# -------------------------------------------------------------------

QT += testlib
QT -= gui

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

SOURCES +=  tst_testsbackend.cpp

LIBS += ../../Libs/macos/libBackend.a
