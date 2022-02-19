// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/12/2021 at 17:15:17
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15
import QtQuick.Controls 2.15

// Application includes
import "qrc:/js/AColors.js" as COLORS;


// Component
Rectangle {

	required property StackView pStackView;
	required property string pObjectName;
	property alias pLoaderSign: oLoaderSignLoader;
	property alias pTopContent: oTopContentLoader;

	id: oRoot;
	objectName: oRoot.pObjectName;

	Item {

		id: oNodeLoaderSign;
		anchors.fill: parent;
		visible: false;

		Loader {

			id: oLoaderSignLoader;
			anchors.fill: parent;
		}
	}

	Item {

		id: oNodeTopContent;
		anchors.fill: parent;
		visible: false;

		Loader {

			id: oTopContentLoader;
			anchors.fill: parent;
		}
	}


	// -----------
	/*!
		\fn

		Doc
	*/

	function mShowLoader(inVisible) {

		oNodeLoaderSign.visible = inVisible;
		if (inVisible) {
			oNodeLoaderSign.z = oRoot.children.length + 1;
		} else {
			oNodeLoaderSign.z = 0;
		}
	}


	// -----------
	/*!
		\fn

		Doc
	*/

	function mIsLoaderVisible() {

		return oNodeLoaderSign.visible;
	}


	// -----------
	/*!
		\fn

		Doc
	*/

	function mShowTopContent(inVisible) {

		oNodeTopContent.visible = inVisible;
		if (inVisible) {
			oNodeTopContent.z = oRoot.children.length + 1;
		} else {
			oNodeTopContent.z = 0;
		}
	}


	// -----------
	/*!
		\fn

		Doc
	*/

	function mIsTopContentVisible() {

		return oNodeTopContent.visible;
	}


	// -----------
	/*!
		\fn

		Doc
	*/

	function mIsScreenOnTopOfStack() {

		if (pStackView.currentItem.objectName === oRoot.objectName) {
			return true;
		} else {
			return false;
		}
	}
}
