// ----------------------------------------------------------
/*!
    \qmltype
    \brief

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 08/03/2026 at 18:13:22
    \endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 6.2


// Application Main window
Window {

    property string pTitle: qsTr("QML.MainTitle");

    id: oMainWindow;
    width: 640;
    height: 480;
    visible: true;
    title: qsTr(pTitle);

    Text {

        id: oMainText;
        text: qsTr("QML.MainText");
    }
}
