// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/11/2021 at 20:27:11
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

// Application includes


// Component
GridLayout {

	id: oFormMenu;
	height: 50;
	columns: 2;
	width: parent.width;
	anchors.bottom: parent.bottom;
	anchors.left: parent.left;
	anchors.right: parent.right;

	AButtonCancel {

		id: oButtonCancel;

		Layout.preferredWidth: oFormMenu.width / 2;
		Layout.fillHeight: true;
	}

	AButtonOK {

		id: oButtonOK;

		Layout.preferredWidth: oFormMenu.width / 2;
		Layout.fillHeight: true;
	}
}
