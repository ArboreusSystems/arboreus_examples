// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/11/2021 at 15:45:01
	\endlist
*/
// ----------------------------------------------------------

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;

// Application paths
import "qrc:/qml/Inputs";
import "qrc:/qml/Content";
import "qrc:/qml/Menu";


// Component
Rectangle {

	id: oRoot;
	color: COLORS.mWhite();

	ACarousel {

		pData: [

			{id:0, text:"Personal"},
			{id:1, text:"Next of kin"},
			{id:2, text:"Education"},
			{id:3, text:"Home adress"},
			{id:4, text:"Job"},
			{id:5, text:"Hobbies"},
			{id:6, text:"Contacts"},
		];

		id: oCarousel;
		height: 50;
		anchors.top: parent.top;
		anchors.left: parent.left;
		anchors.right: parent.right;
	}

	ScrollView {

		id: oContentScroll;
		anchors.top: oCarousel.bottom;
		anchors.bottom: oFormMenu.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		width: parent.width * 0.9;
		contentHeight: oFormLoader.height;
		contentWidth: oFormLoader.width;
		clip: true;

		ScrollBar.horizontal.policy: ScrollBar.AlwaysOff;
		ScrollBar.vertical.policy: ScrollBar.AlwaysOff;

		Loader {

			id: oFormLoader;
			width: parent.width;
			source: "qrc:/qml/FormParts/AFormPartPersonal.qml";
		}

		Connections {

			target: oCarousel;
			function onSgClicked(inID) {

				console.log("Signal catched with ID:",inID);

				switch (inID) {
					case 0:
						oFormLoader.source = "qrc:/qml/FormParts/AFormPartPersonal.qml";
						break;
					case 1:
						oFormLoader.source = "qrc:/qml/FormParts/AFormPartNextOfKin.qml";
						break;
					case 2:
						oFormLoader.source = "qrc:/qml/FormParts/AFormPartEducation.qml";
						break;
					case 3:
						oFormLoader.source = "qrc:/qml/FormParts/AFormPartHomeAdress.qml";
						break;
					case 4:
						oFormLoader.source = "qrc:/qml/FormParts/AFormPartJob.qml";
						break;
					case 5:
						oFormLoader.source = "qrc:/qml/FormParts/AFormPartHobbies.qml";
						break;
					case 6:
						oFormLoader.source = "qrc:/qml/FormParts/AFormPartContacts.qml";
						break;
					default: break;
				}
			}
		}
	}

	AFormMenu {

		id: oFormMenu;
	}
}
