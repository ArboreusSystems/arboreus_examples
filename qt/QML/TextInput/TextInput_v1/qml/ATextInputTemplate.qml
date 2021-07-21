// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/07/2021 at 18:27:59
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
Rectangle {

	property double pSizeBorder: 0;
	property double pSizeRadius: 0;

	property alias pFontPixelSize: oTextInput.font.pixelSize;
	property alias pFontBold: oTextInput.font.bold;
	property alias pFontFamily: oTextInput.font.family;

	property alias pPaddingLeft: oTextInput.leftPadding;
	property alias pPaddingRight: oTextInput.rightPadding;

	property string pNameStateNormal: "NORMAL";
	property string pNameStateError: "ERROR";
	property string pNameStateOnFocus: "ON_FOCUS";

	property string pColorBorderNormal: "teal";
	property string pColorBackgroundNormal: "mintcream";
	property string pColorTextNormal: "darkblue";

	property string pColorBorderOnFocus: "darkslateblue";
	property string pColorBackgroundOnFocus: "white";
	property string pColorTextOnFocus: "black";

	property string pColorBorderError: "darkred";
	property string pColorBackgroundError: "orangered";
	property string pColorTextError: "white";

	property alias pFocus: oTextInput.focus;

	id: oRoot;
	radius: oRoot.pSizeRadius;

	Rectangle {

		id: oBackground;
		width: oRoot.width - oRoot.pSizeBorder * 2;
		height: oRoot.height - oRoot.pSizeBorder * 2;
		radius: oRoot.mSetBackgroundRadius();
		anchors.centerIn: parent;
		clip: true;

		TextInput {

			id: oTextInput;
			anchors.fill: parent;
			font.pixelSize: 18;
			verticalAlignment: Text.AlignVCenter;

			onFocusChanged: {

				console.log("onFocusChanged");

				if (typeof oRoot.mOnFocusChanged === "function") {
					oRoot.mOnFocusChanged();
				}
			}

			onAccepted: {

				console.log("onAccepted");

				if (typeof oRoot.mOnAccepted === "function") {
					oRoot.mOnAccepted();
				}
			}

			onAcceptableInputChanged: {

				console.log("onAcceptableInputChanged");
			}

			onActiveFocusChanged: {

				console.log("onActiveFocusChanged");
			}

			onEditingFinished: {

				console.log("onEditingFinished");
			}

			onTextEdited: {

				console.log("onTextEdited");
			}
		}
	}

	Component.onCompleted: {

		oRoot.state = oRoot.pNameStateNormal;
	}

	states: [

		State {name: oRoot.pNameStateNormal;

			PropertyChanges {target: oRoot; color: oRoot.pColorBorderNormal;}
			PropertyChanges {target: oBackground; color: oRoot.pColorBackgroundNormal;}
			PropertyChanges {target: oTextInput; color: oRoot.pColorTextNormal;}
		},

		State {name: oRoot.pNameStateOnFocus;

			PropertyChanges {target: oRoot; color: oRoot.pColorBorderOnFocus;}
			PropertyChanges {target: oBackground; color: oRoot.pColorBackgroundOnFocus;}
			PropertyChanges {target: oTextInput; color: oRoot.pColorTextOnFocus;}
		},

		State {name: oRoot.pNameStateError;

			PropertyChanges {target: oRoot; color: oRoot.pColorBorderError;}
			PropertyChanges {target: oBackground; color: oRoot.pColorBackgroundError;}
			PropertyChanges {target: oTextInput; color: oRoot.pColorTextError;}
		}
	]

	function mSetBackgroundRadius() {

		var oRadius = oRoot.pSizeRadius - oRoot.pSizeBorder * 0.5;
		if (oRadius < 0) return 0;
		return oRadius;
	}
}
