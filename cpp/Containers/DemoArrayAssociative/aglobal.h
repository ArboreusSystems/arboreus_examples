// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2020 at 13:06:52
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <iostream>
#include <chrono>

// Application includes

// Constants and defintions
#define ALOG cout << AGlobal::mCurrentTimeMicroseconds() << " "


class AGlobal {

	public:

		static long long mCurrentTimeMicroseconds(void) {

			return static_cast<long long>(std::chrono::duration_cast<std::chrono::microseconds>(
				std::chrono::system_clock::now().time_since_epoch()
			).count());
		}
		static long long mCurrentTimeMilliseconds(void) {

			return static_cast<long long>(std::chrono::duration_cast<std::chrono::milliseconds>(
				std::chrono::system_clock::now().time_since_epoch()
			).count());
		}
		static long long mCurrentTimeSeconds(void) {

			return static_cast<long long>(std::chrono::duration_cast<std::chrono::seconds>(
				std::chrono::system_clock::now().time_since_epoch()
			).count());
		}
};

#endif // AGLOBAL_H
