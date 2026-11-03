// ----------------------------------------------------------
/*!
    \qmltype
    \brief

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 28/10/2026 at 16:26:08
    \endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes


// Component
Rectangle {

    id: oRoot;
    color: "steelblue";

    Button {

        id: oButtonTest;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;
        width: 200;
        height: 50;
        text: "Configure";

        onClicked: {

            ARevenueCat.mConfigure("testID");
        }
    }
}
