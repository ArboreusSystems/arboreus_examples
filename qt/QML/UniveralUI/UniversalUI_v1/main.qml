// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/09/2020 at 10:14:40
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Window 2.15

// Application includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;
import "qrc:/js/Components.js" as COMPONENTS;


// Application directories
import "qrc:/qml/"


// Application window component
AWindow {

	id: oApplicationWindow;
	objectName: "oApplicationWindow";

	pContent: Rectangle {

		id: oContent;
		color: COLORS.mFiolent();
		width: parent.width;
		height: parent.height;

		Component.onCompleted: {

			var oContentData;
			var oDeviceType = AGlobal.mDeviceType();
			if (oDeviceType === GLOBAL.DEVICE_TYPE_TABLET) {
				oContentData = Qt.createQmlObject(COMPONENTS.mAContentTablet(),oContent,"oContentData");
			} else if (oDeviceType === GLOBAL.DEVICE_TYPE_PHONE) {
				oContentData = Qt.createQmlObject(COMPONENTS.mAContentPhone(),oContent,"oContentData");
			} else if (oDeviceType === GLOBAL.DEVICE_TYPE_DESKTOP) {
				oContentData = Qt.createQmlObject(COMPONENTS.mAContentPhone(),oContent,"oContentData");
			} else {
				ALogger.mWriteToLog("Wrong device type. No content assigned for appllication window.");
			}

			ALogger.mWriteToLog("oContentData created");
		}
	}

	Component.onCompleted: {

		ALogger.mWriteToLog("Device type: " + AGlobal.mDeviceType());
		ALogger.mWriteToLog(oApplicationWindow.objectName + " created");
	}

	Component.onDestruction: {

		ALogger.mWriteToLog(oApplicationWindow.objectName + " deleted");
	}
}

