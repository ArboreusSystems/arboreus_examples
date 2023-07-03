# --------------------------
# Network Extension definitions

set(A_EXTENSION_NAME Extension_v1)
set(A_EXTENSION_VERSION ${A_PROJECT_VERSION})
set(A_EXTENSION_ENTITLEMENT)
set(A_EXTENSION_INFO_PLIST)
set(A_EXTENSION_BUNDLE_ID)
set(A_EXTENSION_TEAM_ID)

set(A_DIR_EXTENSION_RESOURCES ${A_DIR_EXTENSION}/Resources)
set(A_DIR_EXTENSION_RESOURCES_IOS ${A_DIR_EXTENSION_RESOURCES}/IOS)
set(A_DIR_EXTENSION_RESOURCES_MACOS ${A_DIR_EXTENSION_RESOURCES}/MacOS)


# --------------------------
# Extension resources for iOS

if(IOS)

	set(A_EXTENSION_ENTITLEMENT ${A_DIR_EXTENSION}/Resources/IOS/Extension.entitlements)
	set(A_EXTENSION_INFO_PLIST ${A_DIR_EXTENSION}/Resources/IOS/Info.plist)
	set(A_EXTENSION_BUNDLE_ID ${A_CONF_EXTENSION_BUNDLE_ID})
	set(A_EXTENSION_TEAM_ID "${A_CONF_TEAM_ID}")

endif()


# --------------------------
# Extension resources for MacOS

if(APPLE)

	set(A_EXTENSION_ENTITLEMENT ${A_DIR_EXTENSION}/Resources/MacOS/Extension.entitlements)
	set(A_EXTENSION_INFO_PLIST ${A_DIR_EXTENSION}/Resources/MacOS/Info.plist)
	set(A_EXTENSION_BUNDLE_ID ${A_CONF_EXTENSION_BUNDLE_ID})
	set(A_EXTENSION_TEAM_ID "${A_CONF_TEAM_ID}")

endif()


# --------------------------
# Extension sources

set(A_EXTENSION_SOURCES_OBJC_HEADERS
	${A_DIR_EXTENSION}/Main/AppProxyProvider.h
)

set(A_EXTENSION_SOURCES_OBJC
	${A_DIR_EXTENSION}/Main/AppProxyProvider.mm
)

set(A_EXTENSION_SOURCES_OTHER
	${A_EXTENSION_ENTITLEMENT}
	${A_EXTENSION_INFO_PLIST}
)


# --------------------------
# Network Extension

add_executable(${A_EXTENSION_NAME}
	${A_EXTENSION_SOURCES_OBJC_HEADERS}
	${A_EXTENSION_SOURCES_OBJC}
	${A_EXTENSION_SOURCES_OTHER}
)

A_AddEntitlement(${A_EXTENSION_NAME} "${A_EXTENSION_ENTITLEMENT}")
A_AddInfoPlist(${A_EXTENSION_NAME} "${A_EXTENSION_INFO_PLIST}")
A_AddBundleIdentifier(${A_EXTENSION_NAME} "${A_EXTENSION_BUNDLE_ID}")
A_AddTeam(${A_EXTENSION_NAME} "${A_TEAM_ID}")
A_AddFramework(${A_EXTENSION_NAME} NetworkExtension)

set_target_properties(${A_EXTENSION_NAME} PROPERTIES
	MACOSX_BUNDLE ON
	XCODE_PRODUCT_TYPE com.apple.product-type.app-extension
	BUNDLE_EXTENSION appex
)

