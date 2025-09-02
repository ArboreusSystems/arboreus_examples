// ----------------------------------------------------------
/*!
	\headerfile AObjectiveC
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2022 at 23:29:26
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTIVEC_H
#define AOBJECTIVEC_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>
#include <ObjectiveC/aobjectivecnativeglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AObjectiveC : public QObject {

	Q_OBJECT

	public:

		explicit AObjectiveC(QObject* parent = nullptr);
		virtual ~AObjectiveC(void);

		QString mTestString(void);
};

#endif // AOBJECTIVEC_H
