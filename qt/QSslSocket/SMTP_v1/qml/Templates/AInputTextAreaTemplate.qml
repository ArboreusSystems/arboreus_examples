// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/01/2022 at 13:04:31
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes


// Component
Rectangle {

	property string pStateNormalName: "NORMAL";
	property string pStateErrorName: "ERROR";
	property string pStateOnFocusName: "ON_FOCUS";

	property string pColorBorderNormal: "darkmagenta";
	property string pColorBorderOnFocus: "midnightblue";
	property string pColorBorderError: "maroon";

	property string pColorBackgroundNormal: "lightyellow";
	property string pColorBackgroundOnFocus: "mintcream";
	property string pColorBackgroundError: "orangered" ;

	property string pColorTextNormal: "mediumblue";
	property string pColorTextOnFocus: "black";
	property string pColorTextError: "white";

	property double pSizeBorder: 0;
	property double pSizeRadius: 0;

	property string pPlaceholder;
	property alias pText: oTextInput.text;
//	property alias pTextEchoMode: oTextInput.echoMode;

	property string pFontFamily;
	property alias pFontPixelSize: oTextInput.font.pixelSize;

	property alias pPaddingLeft: oTextInput.leftPadding;
	property alias pPaddingRight: oTextInput.rightPadding;

	id: oRoot;
	radius: oRoot.pSizeRadius;

	Rectangle {

		id: oBackground;
		width: oRoot.width - oRoot.pSizeBorder * 2;
		height: oRoot.height - oRoot.pSizeBorder * 2;
		anchors.centerIn: parent;
		radius: oRoot.mSetBackgroundRadius();
		clip: true;

		Flickable {

			id: flick;
			anchors.fill: parent;
//			contentWidth: oTextInput.paintedWidth;
//			contentHeight: oTextInput.paintedHeight;
			clip: true

			TextArea.flickable: TextArea {

				 id: oTextInput
				 width: flick.width
				 height: flick.height
				 focus: true
				 font.pixelSize: 22;
				 wrapMode: TextEdit.Wrap
//				 onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
			}

			ScrollBar.vertical: ScrollBar {}

//			function ensureVisible(r) {

//				if (contentX >= r.x) {
//					contentX = r.x;
//				} else if (contentX+width <= r.x+r.width) {
//					contentX = r.x+r.width-width;
//				}

//				if (contentY >= r.y) {
//					contentY = r.y;
//				} else if (contentY+height <= r.y+r.height) {
//					contentY = r.y+r.height-height;
//				}
//			}
		 }

//		TextArea {

//			id: oTextInput;
//			anchors.fill: parent;
//			verticalAlignment: Text.AlignVCenter;
//			horizontalAlignment: Text.AlignLeft;
//			font.pixelSize: 18;
//			wrapMode: TextEdit.WordWrap;

//			font.family: {

//				if (oRoot.pFontFamily !== null) {
//					oTextInput.font.family = oRoot.pFontFamily;
//				}
//			}

//			Component.onCompleted: {

//				if (oRoot.pPlaceholder) {
//					oTextInput.text = oRoot.pPlaceholder;
//				}
//			}

//			onFocusChanged: {

//				if (typeof oRoot.mOnFocusChanged === "function") {
//					oRoot.mOnFocusChanged();
//				}
//			}

//			onEditingFinished: {

//				if (typeof oRoot.mOnEditingFinished === "function") {
//					oRoot.mOnEditingFinished();
//				}
//			}

//			onAccepted: {

//				if (typeof oRoot.mOnAccepted === "function") {
//					oRoot.mOnAccepted();
//				}
//			}
//		}
	}

	states: [

		State {name: oRoot.pStateNormalName;

			PropertyChanges {target: oRoot; color: oRoot.pColorBorderNormal;}
			PropertyChanges {target: oBackground; color: oRoot.pColorBackgroundNormal;}
			PropertyChanges {target: oTextInput; color: oRoot.pColorTextNormal;}
		},

		State {name: oRoot.pStateOnFocusName;

			PropertyChanges {target: oRoot; color: oRoot.pColorBorderOnFocus;}
			PropertyChanges {target: oBackground; color: oRoot.pColorBackgroundOnFocus;}
			PropertyChanges {target: oTextInput; color: oRoot.pColorTextOnFocus;}
		},

		State {name: oRoot.pStateErrorName;

			PropertyChanges {target: oRoot; color: oRoot.pColorBorderError;}
			PropertyChanges {target: oBackground; color: oRoot.pColorBackgroundError;}
			PropertyChanges {target: oTextInput; color: oRoot.pColorTextError;}
		}
	]

	Component.onCompleted: {

		oRoot.state = oRoot.pStateNormalName;
	}

	function mSetBackgroundRadius() {

		var oRadius = oRoot.pSizeRadius - oRoot.pSizeBorder;
		if (oRadius < 0) {
			return 0;
		} else {
			return oRadius;
		}
	}
}

