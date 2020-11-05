// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/11/2020 at 11:27:24
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes


// Application window component
ApplicationWindow {

	id: oMainWindow;
	visible: true;
	width: 640;
	height: 480;
	title: qsTr("QThreadSignals v2");

	Text {

		id: oTestText;
		text: qsTr("QThreadSignals v2");
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	Component.onCompleted: {

		AObject.mTestQML();
		AObjectHandler.mTest(4);
	}
}
