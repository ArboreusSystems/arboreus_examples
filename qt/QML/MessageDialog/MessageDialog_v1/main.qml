// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 15/11/2021 at 19:53:36
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
import "qrc:/qml";


// Application
ApplicationWindow {

	property string pText: qsTr("Native Message Dialog v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oApplicationWrapper;
		anchors.fill: parent;
		color: COLORS.mWhite();

		Button {

			id: oButtonShowDialog;
			text: "Show Dialog";
			anchors.verticalCenter: parent.verticalCenter;
			anchors.horizontalCenter: parent.horizontalCenter;
			width: parent.width * 0.8;
			height: parent.height * 0.1;

			background:  Rectangle {

				id: oButtonShowDialogBackground;
				anchors.fill: parent;
				color: oButtonShowDialog.pressed ? COLORS.mSaladDark() : COLORS.mBlueDark();
			}

			contentItem: Text {

				id: oButtonShowDialogText;
				text: oButtonShowDialog.text;
				color: COLORS.mWhiteLight();
				font.bold: true;
				font.pixelSize: 18;
				anchors.fill: parent;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
			}

			onClicked: {

				var oMessageDialog = Qt.createQmlObject(
					'import QtQuick 2.15; import "qrc:/qml"; AMessageDialog {}',
					oApplicationWrapper,
					"AMessageDialog"
				);
			}
		}

		Text {

			id: oApplicationName;
			text: oApplicationWindow.pText;
			font.bold: true;
			font.pixelSize: 20;
			anchors.horizontalCenter: oButtonShowDialog.horizontalCenter;
			anchors.bottom: oButtonShowDialog.top;
			anchors.bottomMargin: 25;
		}
	}
}
