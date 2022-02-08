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
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Content";
import "qrc:/qml/Screens";


// Application
ApplicationWindow {

	property string pText: qsTr("SMTP v1");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	AContentWrapper {

		id: oApplicationContentWrapper;
		anchors.fill: parent;

		StackView {

			id: oApplicationStackView;
			anchors.fill: parent;

			Component.onCompleted: {

				oApplicationStackView.push(oScreenMail);
			}

			Component {id: oScreenMail; AScreenMail {}}
			Component {id: oScreenServer; AScreenServer {}}
		}
	}
}
