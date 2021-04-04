// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/04/2021 at 19:13:56
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4

// Application includes
import "qrc:/AGlobal.js" as GLOBAL;
import "qrc:/AColors.js" as COLORS;

// Application
ApplicationWindow {

	property bool pIsDesktop: true;
	property string pText: qsTr("Hello world!");

	id: oApplicationWindow;
	flags: Qt.Window;
	visible: true;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	title: oApplicationWindow.pText;

	Connections {

		target: ABackend;
		function onSgReadyToUse() {

			oStackView.push(oScreenURLForm)
		}
	}

	StackView {

		id: oStackView;
		anchors.fill: parent;

		Component.onCompleted: {

			oStackView.push(oScreenLoading);
		}

		Component {id: oScreenLoading; AScreenLoading {}}
		Component {id: oScreenURLForm; AScreenURLForm {}}

		delegate: StackViewDelegate {

			function transitionFinished(properties) {
				properties.exitItem.opacity = 1;
			}

			pushTransition: StackViewTransition {

				PropertyAnimation {

					target: enterItem;
					property: "opacity";
					from: 0;
					to: 1;
				}

				PropertyAnimation {

					target: exitItem;
					property: "opacity";
					from: 1;
					to: 0;
				}
			}
		}
	}
}
