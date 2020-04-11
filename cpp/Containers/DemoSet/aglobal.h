// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 19/02/2020 at 13:19:18
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <iostream>
#include <chrono>
#include <string>
#include <unistd.h>

// Application includes

// Constants and definitions
#define ALOG cout << AGlobal::mCurrentTimeMicroseconds() << " "

// Class definitions
class AGlobal {

	public:

		AGlobal(void);
		~AGlobal(void);

		static long long mCurrentTimeMicroseconds(void);
		static long long mCurrentTimeMilliseconds(void);
		static long long mCurrentTimeSeconds(void);
};

#endif // AGLOBAL_H
