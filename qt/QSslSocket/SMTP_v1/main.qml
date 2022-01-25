// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 13:50:37
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("SMTP v1");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	Text {

		id: oTestText;
		text: oApplicationWindow.pText;
		anchors.verticalCenter: parent.verticalCenter;
		anchors.horizontalCenter: parent.horizontalCenter;
	}

	Component.onCompleted: {

		var oProperties = ASMTP.mGetProperties();
		console.log("User:",oProperties.User);
		console.log("Password:",oProperties.Password);
		console.log("ServerName:",oProperties.ServerName);
		console.log("Port:",oProperties.Port);

		oProperties.User = "User1";
		oProperties.Password = "Password1";
		oProperties.ServerName = "ServerName1";
		oProperties.Port = 123;

		ASMTP.mSetProperties(oProperties);
	}

	Connections {

		target: ASMTP;
		function onSgPropertiesUpdated() {

			console.log("Updated properties");

			var oProperties = ASMTP.mGetProperties();
			console.log("User:",oProperties.User);
			console.log("Password:",oProperties.Password);
			console.log("ServerName:",oProperties.ServerName);
			console.log("Port:",oProperties.Port);
		}
	}
}
