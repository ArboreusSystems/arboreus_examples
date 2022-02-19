INCLUDEPATH += $$PWD

macos {

}

ios {

}

android {

	MODULE2_ANDROID_SOURCES.path = /
	MODULE2_ANDROID_SOURCES.files = $$files($$PWD/Platforms/Android/*)
	INSTALLS += MODULE2_ANDROID_SOURCES

	DISTFILES += \
		$$PWD/Platforms/Android/src/systems.arboreus.Module2/Module2.java
}
