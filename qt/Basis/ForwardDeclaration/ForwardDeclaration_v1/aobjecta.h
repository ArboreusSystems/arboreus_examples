// ----------------------------------------------------------
/*!
	\headerfile AObjectA
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 08:23:45
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTA_H
#define AOBJECTA_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Classes
class ABackend;


// Class definitions
class AObjectA : public QObject {

	Q_OBJECT

	public:

		ABackend* pBackend = nullptr;

		explicit AObjectA(QObject* parent = nullptr);
		virtual ~AObjectA(void);

		void mTestMethod(void);
};

#endif // AOBJECTA_H
