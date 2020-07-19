// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/07/2020 at 15:16:50
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <iostream>
#include <chrono>
#include <string>
#include <unistd.h>

// Application includes

// Constants and definitions
#define ALOG cout << ALogger::mCurrentTimeMicroseconds() << " "


// Class definitions
class ALogger {

	public:

		ALogger(void);
		~ALogger(void);

		static long long mCurrentTimeMicroseconds(void);
		static long long mCurrentTimeMilliseconds(void);
		static long long mCurrentTimeSeconds(void);
};

#endif // ALOGGER_H
