// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 09:19:54
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes
import "qrc:/js/Colors.js" as COLORS;


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mSaladDark();
	height: parent.height;
	width: parent.width;
	anchors.top: parent.top;
	anchors.bottom: parent.bottom;
	anchors.left: parent.left;
	anchors.right: parent.right;

	Connections {

		target: AGlobal;

		function onSgOrientationChanged(inOrientation) {

			ALogger.mWriteToLog("AContent onSgOrientationChanged");
			if (typeof oRoot.onSgOrientationChanged === "function") {
				oRoot.onSgOrientationChanged(inOrientation);
			}
		}
	}
}
