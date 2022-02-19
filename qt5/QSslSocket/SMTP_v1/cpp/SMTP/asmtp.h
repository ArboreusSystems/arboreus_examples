// ----------------------------------------------------------
/*!
	\headerfile ASMTP
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 18:00:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASMTP_H
#define ASMTP_H

// System includes
#include <QObject>

// Application includes
#include <athreadtemplate.h>
#include <athreadobjectcontrollertemplate.h>
#include <asmtpservice.h>
#include <aloggerglobal.h>
#include <asequencestring.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class ASMTP : public AThreadTemplate<ASMTPService> {

	Q_OBJECT

	public:

		explicit ASMTP(QObject* parent = nullptr);
		virtual ~ASMTP(void);

		void mInit(void);

	public slots:

		void slInitiated(void);
		void slPropertiesUpdated(void);
		void slMessageSent(QString inMessageID);

		QVariantMap mGetProperties(void);
		QVariantMap mTemplateMessage(void);
		void mSetProperties(QVariantMap inProperties);
		void mMessageSend(QString inMessageID);
		QString mMessageIDGenerate(void);

	signals:

		void sgInit(void);
		void sgInitiated(void);
		void sgSetProperties(ASMTPProperties inProperties);
		void sgPropertiesUpdated(void);
		void sgMessageSend(ASMTPMessage inMessage);
		void sgMessageSent(QString inMessageID);

	private:

		ABackend* pBackend = nullptr;
};

#endif // ASMTP_H
