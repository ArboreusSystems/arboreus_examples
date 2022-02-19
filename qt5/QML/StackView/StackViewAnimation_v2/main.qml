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

			property real offset: 0;


			id: oStackView;
			width: parent.width;
			height: parent.height;

			initialItem: oScreenMain;

			pushEnter: Transition {

				id: oPushEnter;

				ParallelAnimation {

					PropertyAction {

						property: "x";
						value: oPushEnter.ViewTransition.item.pos;
					}

					NumberAnimation {

						properties: "y";
						from: oPushEnter.ViewTransition.item.pos + oStackView.offset;
						to: oPushEnter.ViewTransition.item.pos;
						duration: 400;
						easing.type: Easing.OutCubic;
					}

					NumberAnimation {

						property: "opacity";
						from: 0;
						to: 1;
						duration: 400;
						easing.type: Easing.OutCubic;
					}
				}
			}
			popExit: Transition {

				id: oPopExit;

				ParallelAnimation {

					PropertyAction {

						property: "x";
						value: oPopExit.ViewTransition.item.pos;
					}

					NumberAnimation {

						properties: "y";
						from: oPopExit.ViewTransition.item.pos;
						to: oPopExit.ViewTransition.item.pos + oStackView.offset;
						duration: 400;
						easing.type: Easing.OutCubic;
					}

					NumberAnimation {

						property: "opacity";
						from: 1;
						to: 0;
						duration: 400;
						easing.type: Easing.OutCubic;
					}
				}
			}

			pushExit: Transition {

				id: oPushExit;

				PropertyAction { property: "x"; value: oPushExit.ViewTransition.item.pos; }
				PropertyAction { property: "y"; value: oPushExit.ViewTransition.item.pos; }
			}

			popEnter: Transition {

				id: oPopEnter;

				PropertyAction { property: "x"; value: oPopEnter.ViewTransition.item.pos; }
				PropertyAction { property: "y"; value: oPopEnter.ViewTransition.item.pos; }
			}

			Component {id: oScreenMain; ScreenMain {}}
			Component {id: oScreenOne; ScreenOne {}}
			Component {id: oScreenTwo; ScreenTwo {}}
			Component {id: oScreenThree; ScreenThree {}}
		}
	}
}
