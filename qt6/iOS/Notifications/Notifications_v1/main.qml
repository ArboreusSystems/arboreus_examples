// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 21:06:09
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Templates";


// Application
ApplicationWindow {

	property string pText: qsTr("Notifications v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oContent;
		anchors.fill: parent;
		color: COLORS.mSaladLight();

		AButtonTemplate {

			id: oButtonAddNotification;
			objectName: "oButtonAddNotification";
			text: "Add Notification";
			width: 250;
			height: 60;
			anchors.centerIn: parent;

			onClicked: {

				var oNotification = ANotificationsTemplates.mModelMessage();
				ANotifications.mAdd(oNotification);
			}
		}
	}
}
