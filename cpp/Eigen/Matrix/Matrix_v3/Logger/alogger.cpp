// ----------------------------------------------------------
/*!
	\class ALogger
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 22/07/2020 at 08:30:50
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alogger.h"


// -----------
/*!
	\fn

	Doc.
*/

ALogger::ALogger(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

ALogger::~ALogger(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

long long ALogger::mCurrentTimeMicroseconds(void) {

	return static_cast<long long>(chrono::duration_cast<chrono::microseconds>(
		chrono::system_clock::now().time_since_epoch()
	).count());
}


// -----------
/*!
	\fn

	Doc.
*/

long long ALogger::mCurrentTimeMilliseconds(void) {

	return static_cast<long long>(chrono::duration_cast<chrono::milliseconds>(
		chrono::system_clock::now().time_since_epoch()
	).count());
}


// -----------
/*!
	\fn

	Doc.
*/

long long ALogger::mCurrentTimeSeconds(void) {

	return static_cast<long long>(chrono::duration_cast<chrono::seconds>(
		chrono::system_clock::now().time_since_epoch()
	).count());
}
