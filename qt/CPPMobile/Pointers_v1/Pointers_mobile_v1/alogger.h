// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/07/2020 at 17:14:24
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
#include <QObject>

// Application includes

// Constants and definitions
#define ALOG cout << ALogger::mCurrentTimeMicroseconds() << " "

// Namesapce
using namespace std;


// Class definitions
class ALogger : public QObject {

	Q_OBJECT

	public:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);

		static long long mCurrentTimeMicroseconds(void);
		static long long mCurrentTimeMilliseconds(void);
		static long long mCurrentTimeSeconds(void);

	signals:

	public slots:
};

#endif // ALOGGER_H
