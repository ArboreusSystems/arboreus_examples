// ----------------------------------------------------------
/*!
	\qmltype
	\brief

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/07/2021 at 18:29:06
	\endlist
*/
// ----------------------------------------------------------

// System includes
import QtQuick 2.15

// Application includes


// Component
ATextInputTemplate {

	id: oRoot;
	pSizeBorder: 2;
	pSizeRadius: 5;
	pPaddingLeft: 10;
	pPaddingRight: 10;

	function mOnAccepted() {

		console.log("mOnAccepted");
		oRoot.pFocus = false;
	}

	function mOnFocusChanged() {

		console.log("mOnFocusChanged focus:",oRoot.pFocus);
	}
}
