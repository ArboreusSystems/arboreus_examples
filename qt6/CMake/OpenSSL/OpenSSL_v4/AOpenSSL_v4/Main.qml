// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/09/2026 at 09:32:00
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import Arboreus;


// Application Main window
Window {

	property string oTitle: "Main Window OpenSSL_v4";

	id: oMainWindow;
	width: 640;
	height: 480;
	visible: true;
	title: qsTr(oTitle);

	AModifier {id: oModifier;}

	Column {

		id: oColumn;
		width: parent.width * 0.88;
		anchors.top: parent.top;
		anchors.topMargin: parent.width * 0.06;
		anchors.horizontalCenter: parent.horizontalCenter;
		spacing: 10;

		Label {

			id: oLabelPassword
			text: "Password";
		}

		TextField {

			id: oInputPassword;
			width: parent.width;
			placeholderText: "Enter Password";
			echoMode: TextInput.Password;
			inputMethodHints: Qt.ImhHiddenText | Qt.ImhSensitiveData | Qt.ImhNoPredictiveText;
		}

		Button {

			id: oButtonPasswordSet;
			text: "Set Password";
			width: parent.width;
			onClicked: {

				if (oModifier.mPasswordSet(oInputPassword.text)) {
					oInputPassword.text = "";
				}
			}
		}

		Label {

			text: oModifier.mIsPasswordDefined ? "Status: Password in RAM" : "Status: No password in RAM"
			color: oModifier.mIsPasswordDefined ? "green" : "red"
		}

		Rectangle {

			height: 1;
			width: parent.width;
			color: "lightgray";
		}

		Label {

			id: oLabelGetPassword;
			text: "Get password";
		}

		Row {

			spacing: 10
			width: parent.width

			Button {

				text: "Get Stored Password"
				width: (parent.width - 10) / 2
				enabled: oModifier.mIsPasswordDefined
				onClicked: {

					oPasswordTextVisible.text = oModifier.mPasswordGet()
				}
			}
		}

		Text {

			id: oPasswordTextVisible
			text: ""
			color: "blue"
			font.bold: true
		}
	}
}
