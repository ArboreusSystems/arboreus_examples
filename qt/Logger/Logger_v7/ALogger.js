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

	var oError = new Error();
	var oStack = oError.stack.split("\n");

	ALogger.slWriteToLogDebug("USR",inMessage,oStack[oStack.length - 1]);
}


// -----------
/*!
	\fn

	Function description.
*/

function mUserInfo(inMessage) {

	var oError = new Error();
	var oStack = oError.stack.split("\n");

	ALogger.slWriteToLogInfo("USR",inMessage,oStack[oStack.length - 1]);
}


// -----------
/*!
	\fn

	Function description.
*/

function mUserWarning(inMessage) {

	var oError = new Error();
	var oStack = oError.stack.split("\n");

	ALogger.slWriteToLogWarning("USR",inMessage,oStack[oStack.length - 1]);
}


// -----------
/*!
	\fn

	Function description.
*/

function mUserCritical(inMessage) {

	var oError = new Error();
	var oStack = oError.stack.split("\n");

	ALogger.slWriteToLogCritical("USR",inMessage,oStack[oStack.length - 1]);
}


// -----------
/*!
	\fn

	Function description.
*/

function mQMLDebug(inMessage) {

	var oError = new Error();
	var oStack = oError.stack.split("\n");

	ALogger.slWriteToLogDebug("QML",inMessage,oStack[oStack.length - 1]);
}


// -----------
/*!
	\fn

	Function description.
*/

function mQMLInfo(inMessage) {

	var oError = new Error();
	var oStack = oError.stack.split("\n");

	ALogger.slWriteToLogInfo("QML",inMessage,oStack[oStack.length - 1]);
}


// -----------
/*!
	\fn

	Function description.
*/

function mQMLWarning(inMessage) {

	var oError = new Error();
	var oStack = oError.stack.split("\n");

	ALogger.slWriteToLogWarning("QML",inMessage,oStack[oStack.length - 1]);
}


// -----------
/*!
	\fn

	Function description.
*/

function mQMLCritical(inMessage) {

	var oError = new Error();
	var oStack = oError.stack.split("\n");

	ALogger.slWriteToLogCritical("QML",inMessage,oStack[oStack.length - 1]);
}
