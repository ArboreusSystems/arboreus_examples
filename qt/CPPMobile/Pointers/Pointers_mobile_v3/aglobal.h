// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/07/2020 at 12:52:06
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"

// Constants and definitions

// Class definitions
class AGlobal : public QObject {

	Q_OBJECT

	public:

		explicit AGlobal(QObject* parent = nullptr);
		virtual ~AGlobal(void);

		void mTestMethod(void);
		void mTestMethodWithParameter(const char* inString);
		static void mTestStaticMethod(void);
};

#endif // AGLOBAL_H
