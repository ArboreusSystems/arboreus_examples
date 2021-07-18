// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/07/2021 at 18:56:32
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
import "qrc:/qml/Header";
import "qrc:/qml/Screens";


// Application
ApplicationWindow {

	property string pText: qsTr("Mobile App MainMenu v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();
	property double pMargin: oApplicationWindow.width * 0.05;

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oApplicationWrapper;
		anchors.fill: parent;
		color: COLORS.mGreyLight();

		StackView {

			id: oStackView;
			anchors.fill: parent;

			Component.onCompleted: {

				oStackView.push(oScreenMain);
			}

			Component {id: oScreenMain; AScreenMain {}}
			Component {id: oScreenMenu; AScreenMenu {}}
		}
	}
}
