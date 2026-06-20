// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/06/2026 at 13:10:54
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;


// Application Main window
Window {

	property string pTitle: "Main Window CreateQMLObject_v1";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(pTitle);

	Rectangle {



		id: oWrapper;
		width: parent.width;
		height: 40;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;

		Row {

			property var pStack: [];

			id: oElements;
			anchors.fill: parent;
		}

		Component.onCompleted: {

			var oWidthSumm = 0;
			var oCounter = 0;

			while (oWidthSumm < oWrapper.width) {

				var oWidth = Math.floor(Math.random() * 2) ? oElements.height : oElements.height / 2.5;
				var oID = "oObject_" + oCounter;

				var oElement = Qt.createQmlObject(
					"import QtQuick;" +
					"Rectangle {" +
					"	id: oObject_" + oCounter + ";" +
					"	height: parent.height;" +
					"	width: " + oWidth +";" +
					"}",
					oElements
				);
				oElement.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1);
				oElements.pStack[oCounter] = oElement;

				oWidthSumm += oWidth;
				+oCounter;
			}
		}
	}
}
