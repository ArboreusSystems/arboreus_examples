.pragma library

// ----------------------------------------------------------
/*!
	\module aGlobal
	\title JS-module: global application settings
	\brief Define global application parameters and settings for QML UI

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 31/07/2019 at 19:50:38
	\endlist
*/
// ----------------------------------------------------------


// -----------
/*!
	\fn uiWidth()

	Return default value of UI default width for calculations
*/

function uiWidth() {return 1440;}


// -----------
/*!
	\fn uiHeight()

	Return default value of UI default height for calculations
*/

function uiHeight() {return 2560;}


// -----------
/*!
	\fn desktopApplicationWidth()

	Return default value of Desktop Application window default width
*/

function desktopApplicationWidth() {return 504;}


// -----------
/*!
	\fn desktopApplicationHeight()

	Return default value of Desktop Application window default height
*/

function desktopApplicationHeight() {return 896;}


// -----------
/*!
	\fn scaleProportion(CurrentWidth)

	Return propportion value of the current screen
*/

function scaleProportion(CurrentWidth) {return CurrentWidth/originalScreenWidth();}


// -----------
/*!
	\fn isDesktop()

	Checking the type of application environment.
*/

function isDesktop() {

	switch (Qt.platform.os) {
		case "macos": return true;
		case "osx": return true;
		case "windows": return true;
		case "linux": return true;
		default: return false;
	}
}


// -----------
/*!
	\fn defaultString()

	Return default string value.
*/

function defaultString() {return "Default string"}

