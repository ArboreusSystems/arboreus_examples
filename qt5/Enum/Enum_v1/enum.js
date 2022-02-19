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
	\li @created 08/01/2020 at 11:12:55
	\endlist
*/
// ----------------------------------------------------------


// -----------
/*!
	\fn

	Function description.
*/

const ENUM = Object.freeze({
	value1: 1,
	value2: 2,
	value3: 3
});

var ENUM_VAR = {
	value1: 1,
	value2: 2,
	value3: 3
};

function mTestEnum() {

	console.log("From function:",ENUM_VAR.value1);
}
