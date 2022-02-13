// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2022 at 23:21:28
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
Item {

	id: oRoot;
	anchors.fill: parent;
	visible: false;

	Loader {

		id: oLoader;
		anchors.fill: parent;

		onSourceChanged: {

			console.log("Source changed:",oLoader.source);
		}
	}

	MouseArea {

		id: oMouseArea;
		anchors.fill: parent;

		onClicked: {

			oRoot.mReset();
		}
	}

	function mShowWithSource(inSource) {

		oRoot.visible = true;
		oLoader.source = inSource;
		oRoot.z = oRoot.parent.children.length;
	}

	function mHide() {

		oRoot.visible = false;
	}

	function mReset() {

		oRoot.visible = false;
		oLoader.source = "";
	}
}
