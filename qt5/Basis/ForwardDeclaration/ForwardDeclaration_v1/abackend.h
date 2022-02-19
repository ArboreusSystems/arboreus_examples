// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 08:23:09
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKEND_H
#define ABACKEND_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"
#include "aobjecta.h"
#include "aobjectb.h"

// Constants and definitions

// Namespace

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		AObjectA* pObjectA = nullptr;
		AObjectB* pObjectB = nullptr;

		explicit ABackend(QObject *parent = nullptr);
		virtual ~ABackend(void);

		void mTestMethod(const char* inString);
};

#endif // ABACKEND_H
