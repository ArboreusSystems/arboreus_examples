import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

ApplicationWindow {
	visible: true
	width: 640
	height: 480
	title: qsTr("Hello World")

	RowLayout {
		id: rowLayout
		anchors.top: parent.top
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.margins: 5

		spacing: 10

		Text {text: qsTr("Имя")}
		TextField {id: fnameField}
		Text {text: qsTr("Фамилия")}
		TextField { id: snameField}
		Text {text: qsTr("НИК")}
		TextField {id: nikField}

		Button {
			text: qsTr("Add")

			// Make a new entry in the database
			onClicked: {
				database.inserIntoTable(fnameField.text , snameField.text, nikField.text)
				myModel.updateModel() // And updates the data model with a new record
			}
		}
	}

	TableView {
		id: tableView
		anchors.top: rowLayout.bottom
		anchors.left: parent.left
		anchors.right: parent.right
		anchors.bottom: parent.bottom
		anchors.margins: 5

		TableViewColumn {
			role: "fname"
			title: "First Name"
		}
		TableViewColumn {
			role: "sname"
			title: "Last name"
		}
		TableViewColumn {
			role: "nik"
			title: "Nik name"
		}

		model: myModel

		// Setting lines in TableView to intercept mouse left click
		rowDelegate: Rectangle {
			anchors.fill: parent
			color: styleData.selected ? 'skyblue' : (styleData.alternate ? 'whitesmoke' : 'white');
			MouseArea {
				anchors.fill: parent
				acceptedButtons: Qt.RightButton | Qt.LeftButton
				onClicked: {
					tableView.selection.clear()
					tableView.selection.select(styleData.row)
					tableView.currentRow = styleData.row
					tableView.focus = true

					switch(mouse.button) {
					case Qt.RightButton:
						contextMenu.popup() // Call the context menu
						break
					default:
						break
					}
				}
			}
		}
	}

	// The context menu offers deleting a row from the database
	Menu {
		id: contextMenu

		MenuItem {
			text: qsTr("Remove")
			onTriggered: {
				/* Call the dialog box that will clarify the intention to remove the row from the database
				 * */
				dialogDelete.open()
			}
		}
	}

	// Dialog of confirmation the removal line from the database
	MessageDialog {
		id: dialogDelete
		title: qsTr("Remove record")
		text: qsTr("Confirm the deletion of log entries")
		icon: StandardIcon.Warning
		standardButtons: StandardButton.Ok | StandardButton.Cancel

		// If the answer ...
		onAccepted: {
			/* ... remove the line by id, which is taken from the data model
			 * on the line number in the presentation
			 * */
			database.removeRecord(myModel.getId(tableView.currentRow))
			myModel.updateModel();
		}
	}
}
