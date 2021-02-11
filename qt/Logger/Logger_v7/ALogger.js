.pragma library

// ----------------------------------------------------------
/*!
	\module
	\title
	\brief Template file files/js/file.js

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 21:05:58
	\endlist
*/
// ----------------------------------------------------------


// -----------
/*!
	\fn

	Function description.
*/

function mUserDebug(inMessage) {

	var err = new Error();
	console.log(inMessage,err.stack);
}
