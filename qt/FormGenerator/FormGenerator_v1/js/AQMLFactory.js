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
	\li @created 14/06/2021 at 19:48:15
	\endlist
*/
// ----------------------------------------------------------


// -----------
/*!
	\fn

	Function description.
*/

function mCreateFormItem(inObjectname,inLabel,inParent,inObjectName) {

	var oQMLString = "import QtQuick 2.15;" +
		"import \"qrc:/qml\";" +
		"AFormItem {" +
			"objectName: \"" + inObjectname + "\";" +
			"pLabel: \"" + inLabel + "\";" +
		"}";

	return Qt.createQmlObject(oQMLString,inParent,inObjectName);
}
