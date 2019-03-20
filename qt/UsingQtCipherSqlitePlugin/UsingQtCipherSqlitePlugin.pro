TEMPLATE = app

QT += qml quick widgets sql

SOURCES += main.cpp \
database.cpp \
listmodel.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
#include(deployment.pri)

HEADERS += \
database.h \
listmodel.h
