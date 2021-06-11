// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/06/2021 at 11:36:45
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes

// Application
ApplicationWindow {

	property string pText: qsTr("Hello world!");

	id: oApplicationWindow;
	width: 640;
	height: 480;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oWrapper;
		width: parent.width;
		height: parent.height;

		StackView {

			id: oStackView;
			width: parent.width;
			height: parent.height;

			initialItem: oScreenMain;

			pushEnter: Transition {

				PropertyAnimation {

					property: "opacity";
					from: 0;
					to:1;
					duration: 200;
				}
			}

			pushExit: Transition {

				PropertyAnimation {

					property: "opacity";
					from: 1;
					to:0;
					duration: 200;
				}
			}

			popEnter: Transition {

				PropertyAnimation {

					property: "opacity";
					from: 0;
					to:1;
					duration: 200;
				}
			}

			popExit: Transition {

				PropertyAnimation {

					property: "opacity";
					from: 1;
					to:0;
					duration: 200;
				}
			}

			Component {id: oScreenMain; ScreenMain {}}
			Component {id: oScreenOne; ScreenOne {}}
			Component {id: oScreenTwo; ScreenTwo {}}
			Component {id: oScreenThree; ScreenThree {}}
		}
	}
}
