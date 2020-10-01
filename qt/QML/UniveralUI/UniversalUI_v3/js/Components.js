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
	\li @created 29/09/2020 at 12:48:52
	\endlist
*/
// ----------------------------------------------------------


// -----------
/*!
	\fn

	Function description.
*/

function mAContentPhone() {

	return mComponent("AContentPhone");
}


// -----------
/*!
	\fn

	Function description.
*/

function mAContentTablet() {

	return mComponent("AContentTablet");
}


// -----------
/*!
	\fn

	Function description.
*/

function mComponent(inComponent) {

	return ' \
		import QtQuick 2.15;
		import "qrc:/qml/";

		' + inComponent + ' {} \
	';
}
