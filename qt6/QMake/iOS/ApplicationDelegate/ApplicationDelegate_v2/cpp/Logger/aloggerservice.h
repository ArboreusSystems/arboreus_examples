// ----------------------------------------------------------
/*!
	\headerfile ALoggerService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:36:13
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGERSERVICE_H
#define ALOGGERSERVICE_H

// System includes
#include <QObject>

// Application includes
#include <athreadservicetemplate.h>
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class ALoggerService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit ALoggerService(QObject* parent = nullptr);
		virtual ~ALoggerService(void);

	public slots:

		void slInit(void);

	signals:

		void sgInitiated(void);
};

#endif // ALOGGERSERVICE_H
