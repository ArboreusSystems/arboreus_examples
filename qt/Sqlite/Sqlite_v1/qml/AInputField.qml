// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 13/09/2019 at 21:46:30
	\endlist
*/
// ----------------------------------------------------------


// System includes
import QtQuick 2.12

// Application includes
import "qrc:/js/aColor.js" as COLOR;
import "qrc:/js/aGlobal.js" as GLOBAL;


// Component
Rectangle {

	property int pBorderSize: 4;
	property string pTextDefault: "Enter value";
	property alias text: textInput.text;

	id: root;
	color: COLOR.blue();
	width: parent.width * 0.8;
	height: 50;
	anchors.horizontalCenter: parent.horizontalCenter;

	Rectangle {

		id: backgroud;
		color: COLOR.whiteClean();
		width: parent.width - root.pBorderSize;
		height: parent.height - root.pBorderSize;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.verticalCenter: parent.verticalCenter;

		TextInput {

			id: textInput;
			verticalAlignment: TextInput.AlignVCenter;
			horizontalAlignment: TextInput.AlignHCenter;
			color: COLOR.black();
			width: parent.width - 2;
			height: parent.height -2;
			anchors.fill: parent;
			text: root.pTextDefault;
			onFocusChanged: {
				if (textInput.focus == true) {
					if (textInput.text == root.pTextDefault) {
						textInput.text = "";
					}
				} else {
					if (textInput.text == "") {
						textInput.text = root.pTextDefault;
					}
				}
			}
		}
	}
}
