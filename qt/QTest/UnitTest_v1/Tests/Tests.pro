# -------------------------------------------------------------------
#  @doc
#  @notice Template file is test.pro
# 
#  @copyright Arboreus (http://arboreus.systems)
#  @author Alexandr Kirilov (http://alexandr.kirilov.me)
#  @created 11/08/2019 at 14:41:04
# -------------------------------------------------------------------

QT += testlib
QT -= gui

CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

SOURCES +=  tst_usecasefilesaving.cpp
