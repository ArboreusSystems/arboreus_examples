// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file projects/qtquickapplication/empty/main.qml.tpl
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/11/2020 at 20:30:29
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15;
import QtQuick.Controls 2.15;
import Qt.labs.qmlmodels 1.0

// Application includes
import "qrc:/js/AColor.js" as COLORS;
import "qrc:/js/AGlobal.js" as GLOBAL;

// Application Components
import "qrc:/qml/";


// Application window component
ApplicationWindow {

	property bool isDesktop: GLOBAL.isDesktop();
	property real scaleRate: width/GLOBAL.uiWidth();

	id: oApplicationWindow;
	objectName: "oApplicationWindow";
	visible: true;
	width: isDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: isDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: qsTr("TableView v1");
	color: COLORS.mBlue();

	Component.onCompleted: {

		console.log(oApplicationWindow.objectName);
	}

	Item {

		id: oApplicationWrapper;
		anchors.fill: parent;

		AHeader {

			id: oHeader;
			width: parent.width;
			objectName: "oHeader";
			height: 75;
		}

		ATableView {

			id: oTableView;
			width: parent.width;
			anchors.top: oHeader.bottom;
			anchors.bottom: oFooter.top;
			anchors.left: parent.left;
			anchors.right: parent.right;
		}

		AFooter {

			id: oFooter;
			width: parent.width;
			objectName: "oFooter";
			height: 75;
		}
	}
}
