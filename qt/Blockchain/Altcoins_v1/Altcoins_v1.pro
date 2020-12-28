QT += quick

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target


A_PREBUILT_LIBS_ROOT = $$system(echo $A_PREBUILT_LIBS_ROOT)

PRI_LIBRARIES_LIBBITCOIN = $$A_PREBUILT_LIBS_ROOT/Prebuilt/LibrariesLibbitcoin.pri
include($$PRI_LIBRARIES_LIBBITCOIN)

HEADERS += \
	cpp/Bitcoin/abitcoin.h \
	cpp/Bitcoin/abitcoinkeys.h \
	cpp/Main/alogger.h

SOURCES += \
	cpp/Bitcoin/abitcoin.cpp \
	cpp/Bitcoin/abitcoinkeys.cpp \
	cpp/Main/alogger.cpp \
	cpp/Main/altcoins_v1.cpp

RESOURCES += \
	Altcoins_v1.qrc

ANDROID_ABIS = armeabi-v7a
