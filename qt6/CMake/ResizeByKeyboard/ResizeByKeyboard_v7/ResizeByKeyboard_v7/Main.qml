// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/05/2026 at 10:30:08
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick;
import QtQuick.Controls;
import QtQuick.Window;


// Application Main window
AMainWindow {

	id: oMainWindow;
	visible: true;
	title: "Resize by keyboard v6";
	width: maximumWidth;
	height: maximumHeight;
	flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint;

	readonly property real pInsetTop: SafeArea.margins.top;
	readonly property real pInsetBottom: SafeArea.margins.bottom;
	readonly property real pInsetLeft: SafeArea.margins.left;
	readonly property real pInsetRight: SafeArea.margins.right;

	pContent.data: Item {

		id: oContent;
		anchors.fill: parent;

		StackView {

			id: oStackView;
			anchors.fill: parent;

			Component.onCompleted: {

				oStackView.push(oScreenTestComponent);
			}

			Component {id: oScreenTestComponent; AScreenTest {pContentWrapper: oMainWindow.pContentWrapper}}
		}
	}
}
