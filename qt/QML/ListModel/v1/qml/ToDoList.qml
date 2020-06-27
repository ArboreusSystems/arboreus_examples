// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/06/2020 at 08:54:44
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

// Application includes
import ToDo 1.0

// Application JS includes
import "qrc:/js/Global.js" as GLOBAL;
import "qrc:/js/Colors.js" as COLORS;


// Component
Frame {

	ListView {

		id: oListView;
		implicitHeight: 350;
		implicitWidth: 350;
		clip: true;
		model: oListModel;
		delegate: oListViewDelegateComponent;

		Component {

			id: oListViewDelegateComponent;

			RowLayout {

				id: oListViewDelegate;
				width: oListView.width;

				CheckBox {

					id: oListViewDelegateCheckBox;
					checked: model.done;
					onClicked: {

						model.done = checked;
					}
				}

				TextField {

					id: oListViewDelegateText;
					Layout.fillWidth: true;
					text: model.description;
					onEditingFinished: {

						model.description = text;
					}
				}
			}
		}

		ToDoModel {

			id: oListModel;
		}
	}
}
