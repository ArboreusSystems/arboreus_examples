// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/07/2021 at 17:35:08
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.qmlmodels 1.0

// Application includes
import "qrc:/js/AGlobal.js" as GLOBAL;
import "qrc:/js/AColors.js" as COLORS;


// Application
ApplicationWindow {

	property string pText: qsTr("TableView v2");
	property bool pIsDesktop: GLOBAL.mIsDesktop();

	id: oApplicationWindow;
	width: pIsDesktop ? GLOBAL.desktopApplicationWidth() : maximumWidth;
	height: pIsDesktop ? GLOBAL.desktopApplicationHeight() : maximumHeight;
	visible: true;
	title: oApplicationWindow.pText;

	Rectangle {

		id: oApplicationWrapper;
		anchors.fill: parent;

		TableModel {

			id: oTableViewModel;

			rows: [
				{"name": ["cat"],"color": ["black"]},
				{"name": ["dog"],"color": ["brown"]},
				{"name": ["bird"],"color": ["white"]}
			]

			TableModelColumn { display: "color";}
			TableModelColumn { display: "name";}
		}

		DelegateChooser {

			id: oDelegateChooser;
			role: "name";

			DelegateChoice {

				column: 0;
				delegate: Rectangle {

					id: oTableViewDelegateName;
					implicitWidth: 100;
					implicitHeight: 50;
					border.width: 1;
					color: "grey"

					Text {

						text: display[0];
						anchors.centerIn: parent;
						color: "white";
					}

					Component.onCompleted: {

						console.log("oTableViewDelegateName created with index:",model.index,"display:",model.display[0]);
					}
				}
			}

			DelegateChoice {

				column: 1;
				delegate: Rectangle {

					id: oTableViewDelegateColor;
					implicitWidth: 100;
					implicitHeight: 50;
					border.width: 1;

					Text {

						text: display[0];
						anchors.centerIn: parent;
					}

					Component.onCompleted: {

						console.log("oTableViewDelegateColor created with index:",model.index,"display:",model.display[0]);
					}
				}
			}
		}

		TableView {

			id: oTableView;
			anchors.fill: parent;
			columnSpacing: 1;
			rowSpacing: 1;
			clip: true;
			model: oTableViewModel;
			delegate: oDelegateChooser;
		}
	}
}
