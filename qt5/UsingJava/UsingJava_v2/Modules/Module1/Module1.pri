INCLUDEPATH += $$PWD

macos {

}

ios {

}

android {

	MODULE1_ANDROID_SOURCES.path = /
	MODULE1_ANDROID_SOURCES.files = $$files($$PWD/Platforms/Android/*)
	INSTALLS += MODULE1_ANDROID_SOURCES

	DISTFILES += \
		$$PWD/Platforms/Android/src/systems.arboreus.Module1/Module1.java
}


