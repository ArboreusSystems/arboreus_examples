# -------------------------------------------------------------------
#  @doc
#  @notice Template file is consoleapp/file.pro
# 
#  @copyright Arboreus (http://arboreus.systems)
#  @author Alexandr Kirilov (http://alexandr.kirilov.me)
#  @created 01/08/2019 at 14:55:14
# -------------------------------------------------------------------

#QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
	OOP/Singleton/oopsingletonecpp.cpp \
	OOP/Singleton/oopsingletoneqt.cpp \
	QRegularExpression/aregex.cpp \
	QVariant/avariant.cpp \
        Q_PROPERTY/aproperty.cpp \
	containers/acontestobject.cpp \
        containers/associative/ahash.cpp \
        containers/associative/amap.cpp \
        containers/associative/amultihash.cpp \
        containers/associative/amultimap.cpp \
        containers/associative/aset.cpp \
		containers/sequence/alinkedlist.cpp \
		containers/sequence/alist.cpp \
		containers/sequence/aqueue.cpp \
		containers/sequence/astack.cpp \
		containers/sequence/avector.cpp \
	handlers/ahandlermain.cpp \
        main.cpp \
        signals/asignals.cpp \
        signals/aslots.cpp

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
	OOP/Singleton/oopsingletonecpp.h \
	OOP/Singleton/oopsingletoneqt.h \
	QRegularExpression/aregex.h \
	QVariant/avariant.h \
	aglobal.h \
	Q_PROPERTY/aproperty.h \
	containers/acontestobject.h \
	containers/associative/ahash.h \
	containers/associative/amap.h \
	containers/associative/amultihash.h \
	containers/associative/amultimap.h \
	containers/associative/aset.h \
	containers/sequence/alinkedlist.h \
	containers/sequence/alist.h \
	containers/sequence/aqueue.h \
	containers/sequence/astack.h \
	containers/sequence/avector.h \
	handlers/ahandlermain.h \
	signals/asignals.h \
	signals/aslots.h
