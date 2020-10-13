// ----------------------------------------------------------
/*!
	\headerfile AObjectB
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 08:24:08
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTB_H
#define AOBJECTB_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Classes
class ABackend;


// Class definitions
class AObjectB : public QObject {

	Q_OBJECT

	public:

		ABackend* pBackend = nullptr;

		explicit AObjectB(ABackend* inBackend, QObject* parent = nullptr);
		virtual ~AObjectB(void);

		void mTestMethod(void);
};

#endif // AOBJECTB_H
