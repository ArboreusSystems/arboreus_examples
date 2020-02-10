// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2020 at 12:47:31
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

// Constants and defintions
#define ALOG cout << AGlobal::mCurrentTimeMicroseconds() << " "

using namespace std;

class AGlobal {

	public:

		static long long mCurrentTimeMicroseconds(void) {

			return static_cast<long long>(chrono::duration_cast<chrono::microseconds>(
				chrono::system_clock::now().time_since_epoch()
			).count());
		}

		static long long mCurrentTimeMilliseconds(void) {

			return static_cast<long long>(chrono::duration_cast<chrono::milliseconds>(
				chrono::system_clock::now().time_since_epoch()
			).count());
		}

		static long long mCurrentTimeSeconds(void) {

			return static_cast<long long>(chrono::duration_cast<chrono::seconds>(
				chrono::system_clock::now().time_since_epoch()
			).count());
		}

		static string mPwd(void) {

			char oBuffer[FILENAME_MAX];
			getcwd(oBuffer,FILENAME_MAX);
			string oDir(oBuffer);
			return oDir;
		}
};

#endif // AGLOBAL_H
