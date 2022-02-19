// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/01/2022 at 16:56:26
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Buttons";
import "qrc:/qml/Input";


// Component
Rectangle {

	property var pProperties;

	id: oRoot;
	color: COLORS.mGreen();

	Component.onCompleted: {

		oRoot.pProperties = ASMTP.mGetProperties();

		oInputServerName.pTextInput = oRoot.pProperties.ServerName;
		oInputServerPort.pTextInput = oRoot.pProperties.Port;
		oInputUser.pTextInput = oRoot.pProperties.User;
		oInputPassword.pTextInput = oRoot.pProperties.Password;
	}

	Rectangle {

		id: oHeader;
		color: COLORS.mRedDark();
		width: parent.width;
		height: 75;

		Text {

			id: oHeaderText;
			text: "SMTP Server Properties";
			color: COLORS.mWhiteLight();
			font.bold: true;
			font.pixelSize: 20;
			anchors.fill: parent;
			verticalAlignment: Text.AlignVCenter;
			horizontalAlignment: Text.AlignHCenter;
		}
	}

	ScrollView {

		id: oScrollFormView;
		contentWidth: oMessageForm.width;
		anchors.top: oHeader.bottom;
		anchors.left: parent.left;
		anchors.right: parent.right;
		anchors.bottom: oFooter.top;
		clip: true;

		Column {

			id: oMessageForm;
			width: oScrollFormView.width * 0.8;
			topPadding: 10;
			leftPadding: oScrollFormView.width * 0.1;
			spacing: 5;

			AInputServerName {

				id: oInputServerName;

				function mOnFocusChanged() {

					console.log(oInputServerName.objectName,"mOnFocusChanged");
				}

				function mOnEditingFinished() {

					console.log(oInputServerName.objectName,"mOnEditingFinished");
				}

				function mOnAccepted() {

					console.log(oInputServerName.objectName,"mOnAccepted");
				}
			}

			AInputServerPort {

				id: oInputServerPort;

				function mOnFocusChanged() {

					console.log(oInputServerPort.objectName,"mOnFocusChanged");
				}

				function mOnEditingFinished() {

					console.log(oInputServerPort.objectName,"mOnEditingFinished");
				}

				function mOnAccepted() {

					console.log(oInputServerPort.objectName,"mOnAccepted");
				}
			}

			AInputUser {

				id: oInputUser;

				function mOnFocusChanged() {

					console.log(oInputUser.objectName,"mOnFocusChanged");
				}

				function mOnEditingFinished() {

					console.log(oInputUser.objectName,"mOnEditingFinished");
				}

				function mOnAccepted() {

					console.log(oInputUser.objectName,"mOnAccepted");
				}
			}

			AInputPassword {

				id: oInputPassword;

				function mOnFocusChanged() {

					console.log(oInputPassword.objectName,"mOnFocusChanged");
				}

				function mOnEditingFinished() {

					console.log(oInputPassword.objectName,"mOnEditingFinished");
				}

				function mOnAccepted() {

					console.log(oInputPassword.objectName,"mOnAccepted");
				}
			}
		}
	}

	Rectangle {

		id: oFooter;
		color: COLORS.mSaladDark();
		width: parent.width;
		height: 100;
		anchors.bottom: parent.bottom;
		anchors.horizontalCenter: parent.horizontalCenter;

		AButtonCancel {

			id: oButtonCancel;
			width: (parent.width - 75) / 2;
			height: 50;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.left: parent.left;
			anchors.leftMargin: 25;

			onClicked: {

				oApplicationStackView.pop();
			}
		}

		AButtonSetServer {

			id: oButtonSetServer;
			width: oButtonCancel.width;
			height: 50;
			anchors.verticalCenter: parent.verticalCenter;
			anchors.right: parent.right;
			anchors.rightMargin: 25;

			onClicked: {

				oRoot.mSetProperties();
				oApplicationStackView.pop();
			}
		}
	}

	function mSetProperties() {

		oRoot.pProperties.ServerName = oInputServerName.pTextInput;
		oRoot.pProperties.Port = oInputServerPort.pTextInput;
		oRoot.pProperties.User = oInputUser.pTextInput;
		oRoot.pProperties.Password = oInputPassword.pTextInput;

		ASMTP.mSetProperties(oRoot.pProperties);
	}
}
