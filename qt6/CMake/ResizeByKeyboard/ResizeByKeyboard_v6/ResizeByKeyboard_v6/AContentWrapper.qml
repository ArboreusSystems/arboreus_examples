// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/06/2026 at 15:16:57
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Window;

// Application includes


// Component
Rectangle {

	readonly property bool pIsKeyboardVisible: Qt.inputMethod.visible;
	property bool pIsBottom: false;

	id: oRoot;
	color: "white";
}
