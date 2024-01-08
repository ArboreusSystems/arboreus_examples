// ----------------------------------------------------------
/*!
    \qmltype
    \brief

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 07/01/2024 at 11:20:54
    \endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;

// Application includes

// Application paths
import "qrc:/qml";


// Application
ApplicationWindow {

    property string pText: qsTr("UsingRust_v1");
    property bool pIsDesktop: GLOBAL.mIsDesktop();

    id: oApplicationWindow;
    width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
    height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
    visible: true;
    title: oApplicationWindow.pText;

    AContentWrapper {

        id: oContentWrapper;
        anchors.fill: parent;
		color: COLORS.mSaladDark();

		AButtonTemplate {

			id: oButton;
			objectName: "ButtonGetDataFromRust";
			height: 80;
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.verticalCenter: parent.verticalCenter;
			text: "Get data from Rust";

			onClicked: {

				oLabel.text = ARustWrapper.mStringFromLibrary();
			}
		}

		Label {

			id: oLabel;
			text: "No data";
			font.pixelSize: 24.0;
			color: COLORS.mWhite();
			anchors.bottom: oButton.top;
			anchors.bottomMargin: 40;
			anchors.horizontalCenter: oButton.horizontalCenter;
		}
    }
}
