// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/09/2020 at 16:35:46
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/Colors.js" as COLORS;
import "qrc:/js/Global.js" as GLOBAL;


// Component
ApplicationWindow {

	property alias pContent: oWindowWrapper.data;
	property bool pIsDesktop: true;

	id: oRoot;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("Universal UI");

	Rectangle {

		id: oWindowWrapper;
		color: COLORS.mTransparent();
		width: parent.width;
		height: parent.height;
	}
}
