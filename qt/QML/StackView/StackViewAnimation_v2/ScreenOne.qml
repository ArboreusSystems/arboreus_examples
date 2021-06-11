// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/06/2021 at 11:39:41
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
	color: "red";

	Button {

		id: oBackButton;
		text: "Back";
		onClicked: {

			oStackView.pop();
		}
	}
}
