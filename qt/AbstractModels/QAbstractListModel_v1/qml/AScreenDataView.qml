// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/08/2021 at 16:13:49
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.qmlmodels 1.0
import QtQuick.Layouts 1.15
import Arboreus 1.0

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mWhite();

	Rectangle {

		id: oHeaderWrapper;
		width: parent.width;
		height: 70;
		color: COLORS.mFiolentDark();

		AButton {

			id: oButtonList;
			objectName: "oButtonList";
			text: "List";
			anchors.left: parent.horizontalCenter;
			anchors.leftMargin: 10;

			onClicked: {

				oContentLoader.sourceComponent = oListViewComponent;
			}
		}

		AButton {

			id: oButtonTable;
			objectName: "oButtonTable";
			text: "Table";
			anchors.right: parent.horizontalCenter;
			anchors.rightMargin: 10;

			onClicked: {

				oContentLoader.sourceComponent = oTableViewComponent;
			}
		}
	}

	Rectangle {

		id: oContentWrapper;
		width: parent.width;
		anchors.top: oHeaderWrapper.bottom;
		anchors.bottom: parent.bottom;
		color: COLORS.mGreyLight();

		AAbstractModel {

			id: oAbstractModel;
		}

		Item {

			id: oContent;
			anchors.fill: parent;

			Loader {

				id: oContentLoader;
				anchors.fill: parent;
				asynchronous: true;
				sourceComponent: oTableViewComponent;
			}
		}

		Component {

			id: oTableViewComponent;

			ATableView {

				id: oTableView;
				model: oAbstractModel;
			}
		}

		Component {

			id: oListViewComponent;

			AListView {

				id: oListView;
				model: oAbstractModel;
			}
		}
	}

	AButtonNew {

		id: oButtonNew;
		width: 60;
		height: 60;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.bottom: parent.bottom;
		anchors.bottomMargin: 50;

		onClicked: {

			console.log("Button Add New clicked");
			oApplicationStackView.push(oScreenAddNew);
		}
	}
}
