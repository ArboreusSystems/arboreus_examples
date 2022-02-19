// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/09/2021 at 09:53:09
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

	property string pText: qsTr("TableView v5");
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

			id: oTableModel;

			rows: [

				{"row":["value1-1","value1-2","value1-3"]},
				{"row":["value2-1","value2-2","value2-3"]},
				{"row":["value3-1","value3-2","value3-3"]},
				{"row":["value4-1","value4-2","value4-3"]},
				{"row":["value5-1","value5-2","value5-3"]}
			]

			TableModelColumn {display:"row";}
			TableModelColumn {display:"row";}
			TableModelColumn {display:"row";}
		}

		TableView {

			id: oTableView;
			anchors.fill: parent;
			columnSpacing: 1;
			rowSpacing: 1;
			clip: true;
			model: oTableModel;
			delegate: Rectangle {

				id: oDelegate;
				implicitWidth: 100;
				implicitHeight: 50;
				border.width: 1;

				Text {

					text: display[column];
				}

				Component.onCompleted: {

					console.log("Index:",model.index,"Column:",column,"Row:",row);
				}
			}
		}
	}
}
