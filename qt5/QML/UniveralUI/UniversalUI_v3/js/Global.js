.pragma library

// ----------------------------------------------------------
/*!
	\module
	\title
	\brief Template file files/js/file.js

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 09:11:41
	\endlist
*/
// ----------------------------------------------------------


var SCREEN_ORIENTATION_LANDSCAPE = 2;
var SCREEN_ORIENTATION_PORTRAIT = 1;
var SCREEN_ORIENTATION_LANDSCAPE_INVERTED = 8;
var SCREEN_ORIENTATION_PORTRAIT_INVERTED = 4;

var DEVICE_TYPE_UNDEFINED = 0;
var DEVICE_TYPE_PHONE = 1;
var DEVICE_TYPE_TABLET = 2;
var DEVICE_TYPE_DESKTOP = 3;


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

function mIsDesktop() {

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
	\fn mScreenOrientation(inOrientation)

	Return screen orientation name.
*/

function mScreenOrientation(inOrientation) {

	var oOutput = "";
	switch (inOrientation) {
		case SCREEN_ORIENTATION_LANDSCAPE: oOutput = "Landscape"; break;
		case SCREEN_ORIENTATION_PORTRAIT: oOutput = "Portrait"; break;
		case SCREEN_ORIENTATION_LANDSCAPE_INVERTED: oOutput = "Landscape inverted"; break;
		case SCREEN_ORIENTATION_PORTRAIT_INVERTED: oOutput = "Portrait inverted"; break;
		default: oOutput = "Undefined screen orientation";
	}
	return oOutput;
}

