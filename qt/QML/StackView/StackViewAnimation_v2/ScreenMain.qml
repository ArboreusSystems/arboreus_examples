// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/06/2021 at 15:31:32
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes


// Component
Rectangle {

	property real pos: StackView.index * oStackView.offset;

	id: oRoot;
	color: "white";

	Column {

		id: oColumn;

		Button {

			id: oButtonOne;
			text: "One";
			width: parent.width;
			onClicked: {

				oStackView.push(oScreenOne);
			}
		}

		Button {

			id: oButtonTwo;
			text: "Two";
			width: parent.width;
			onClicked: {

				oStackView.push(oScreenTwo);
			}
		}

		Button {

			id: oButtonThree;
			text: "Three";
			onClicked: {

				oStackView.push(oScreenThree);
			}
		}
	}
}
