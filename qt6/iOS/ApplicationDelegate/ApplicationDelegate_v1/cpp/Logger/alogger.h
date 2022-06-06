// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:15:25
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>
#include <aloggerservice.h>
#include <athreadtemplate.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class ALogger : public AThreadTemplate<ALoggerService> {

	Q_OBJECT

	public:

		explicit ALogger(QObject* parent = nullptr);
		virtual ~ALogger(void);

		void mInit(void);

	public slots:

		void slInitiated(void);

	signals:

		void sgInit(void);
		void sgInitiated(void);

	private:

		ABackend* pBackend = nullptr;

};

#endif // ALOGGER_H
