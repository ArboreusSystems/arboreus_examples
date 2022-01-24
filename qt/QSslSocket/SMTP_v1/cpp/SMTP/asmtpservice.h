// ----------------------------------------------------------
/*!
	\headerfile ASMTPService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 20:40:41
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASMTPSERVICE_H
#define ASMTPSERVICE_H

// System includes
#include <QObject>

// Application includes
#include <athreadservicetemplate.h>
#include <aloggerglobal.h>
#include <asmtpdatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ASMTPService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit ASMTPService(QObject* parent = nullptr);
		virtual ~ASMTPService(void);

	public slots:

		void slInit(void);

	signals:

		void sgInitiated(void);
};

#endif // ASMTPSERVICE_H
