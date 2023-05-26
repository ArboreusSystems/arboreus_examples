# --------------------------
# Extension resources for iOS

if(IOS)

	set(A_ENTITLEMENT ${A_DIR_APPLICATION_MODULE_RESOURCES}/IOS/Application.entitlements)
	set(A_INFO_PLIST ${A_DIR_APPLICATION_MODULE_RESOURCES}/IOS/Info.plist)

endif()


# --------------------------
# Extension resources for MacOS

if(APPLE)

	set(A_ENTITLEMENT ${A_DIR_APPLICATION_MODULE_RESOURCES}/MacOS/Application.entitlements)
	set(A_INFO_PLIST ${A_DIR_APPLICATION_MODULE_RESOURCES}/MacOS/Info.plist)

endif()
