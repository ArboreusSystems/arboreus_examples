// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 16/09/2019 at 11:07:33
	\endlist
*/
// ----------------------------------------------------------


// System includes
import QtQuick 2.12

// Application includes
import "qrc:/js/aColor.js" as COLOR;


// Component
Rectangle {

	property string pText: "Default Value";
	property var pObject;
	property var pFields: [];

	id: root;
	color: COLOR.blueDark();
	width: parent.width * 0.8;
	height: 50;
	anchors.horizontalCenter: parent.horizontalCenter;

	Text {

		id: buttonText;
		text: qsTr(root.pText);
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;
		color: COLOR.white();
		font.pixelSize: 18;
	}

	MouseArea {

		id: mouseArea;
		anchors.fill: parent;
		onPressed: {
			root.color = COLOR.purpleLight();
		}
		onReleased: {
			root.color = COLOR.blueDark();
		}
		onCanceled: {
			root.color = COLOR.blueDark();
		}
		onClicked: {
			if (root.pFields.length == 0) {
				console.log("No defined fields");
				return;
			}
			if (!pObject) {
				console.log("No defined form's root object");
				return;
			}
			var oChildren = pObject.children;
			var oData = [];
			for (var iField in root.pFields) {
				for (var iChild in oChildren) {
					if (oChildren[iChild].objectName === root.pFields[iField]) {
						oData.push(oChildren[iChild].text);
					}
				}
			}
			if (aSqliteStorage.mWriteRecord(oData)) {
				for (iField in root.pFields) {
					for (iChild in oChildren) {
						if (oChildren[iChild].objectName === root.pFields[iField]) {
							oChildren[iChild].text = oChildren[iChild].pTextDefault;
						}
					}
				}
				console.log("Records:",aSqliteStorage.mReadAllRecords());
				console.log("Data written successfully");
			}
		}
	}
}
