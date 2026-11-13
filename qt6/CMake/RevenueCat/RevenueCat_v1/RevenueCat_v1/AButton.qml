// ----------------------------------------------------------
/*!
    \qmltype
    \brief

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 13/11/2026 at 08:49:31
    \endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;

// Application includes


// Component
Button {

    id: oRoot;
    width: 120;
    height: 50;

    contentItem: Text {

        text: oRoot.text;
        font: oRoot.font;
        color: "white";
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        elide: Text.ElideRight;
    }

    background: Rectangle {

        anchors.fill: parent;
        color: "indigo";
    }
}
