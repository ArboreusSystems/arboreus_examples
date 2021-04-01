// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/04/2021 at 12:21:50
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKEND_H
#define ABACKEND_H

// System includes
#include <QObject>

// Application includes
#include <alogger.h>
#include <aproperties.h>
#include <adir.h>

// Constants and definitions

// Namespace

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		ALogger* pLogger = nullptr;
		AProperties* pProperties = nullptr;

		static ABackend& mInstance(void);
		void mInit(void);

	private:

		explicit ABackend(QObject *parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)

		void mInitProperties(void);
		void mInitLogger(void);
};

#endif // ABACKEND_H
