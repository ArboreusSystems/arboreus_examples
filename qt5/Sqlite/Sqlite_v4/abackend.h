// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 17:55:14
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKEND_H
#define ABACKEND_H

// System includes
#include <QObject>

// Application includes
#include <alogger.h>
#include <aobject.h>

// Constants and definitions

// Namespace

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		AObject* pObject = nullptr;

		static ABackend& mInstance(void);

	private:

		explicit ABackend(QObject *parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)
};

#endif // ABACKEND_H
