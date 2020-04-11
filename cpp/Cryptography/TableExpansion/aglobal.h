// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/02/2020 at 21:07:47
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
#define A_DEMO_TEXT "Hello encrypted world!!!"
#define A_DEMO_PARAGRAPH "Lorem Ipsum is simply dummy text of the printing " \
	"and typesetting industry. Lorem Ipsum has been the industry's standard dummy " \
	"text ever since the 1500s, when an unknown printer took a galley of type and " \
	"scrambled it to make a type specimen book. It has survived not only five centuries, " \
	"but also the leap into electronic typesetting, remaining essentially unchanged. " \
	"It was popularised in the 1960s with the release of Letraset sheets containing " \
	"Lorem Ipsum passages, and more recently with desktop publishing software like " \
	"Aldus PageMaker including versions of Lorem Ipsum."


// Class definitions
class AGlobal {

	public:

		AGlobal(void);
		~AGlobal(void);

		static long long mCurrentTimeMicroseconds(void);
		static long long mCurrentTimeMilliseconds(void);
		static long long mCurrentTimeSeconds(void);
		static std::string mPwd(void);
};

#endif // AGLOBAL_H
