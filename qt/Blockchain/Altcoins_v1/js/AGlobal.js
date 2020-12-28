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
	\li @created 13/06/2020 at 19:29:23
	\endlist
*/
// ----------------------------------------------------------


// -----------
/*!
	\fn mUIWidth()

	Return default value of UI default width for calculations
*/

function mUIWidth() {return 1440;}


// -----------
/*!
	\fn mUIHeight()

	Return default value of UI default height for calculations
*/

function mUIHeight() {return 2560;}


// -----------
/*!
	\fn mDesktopApplicationWidth()

	Return default value of Desktop Application window default width
*/

function mDesktopApplicationWidth() {return 504;}


// -----------
/*!
	\fn mDesktopApplicationHeight()

	Return default value of Desktop Application window default height
*/

function mDesktopApplicationHeight() {return 896;}


// -----------
/*!
	\fn mScaleProportion(CurrentWidth)

	Return propportion value of the current screen
*/

function mScaleProportion(CurrentWidth) {return CurrentWidth/originalScreenWidth();}


// -----------
/*!
	\fn mIsDesktop()

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
