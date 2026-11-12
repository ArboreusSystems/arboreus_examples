// ----------------------------------------------------------
/*!
    \qmltype
    \brief

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 12/11/2026 at 13:59:53
    \endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;


// Application Main window
Window {

    property string oTitle: "Main Window UsingJava_v6";

    id: oMainWindow;
    width: 640;
    height: 480;
    visible: true;
    title: qsTr(oTitle);

    Text {

        id: oMainText;
        text: qsTr(oTitle);
    }
}
