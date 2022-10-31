// ----------------------------------------------------------
/*!
	\headerfile AApplication
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/10/2022 at 13:02:22
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATION_H
#define AAPPLICATION_H

// System includes

// Precompiled includes
#include <aapplicationpch.h>

// Application includes
#include <aloggerglobal.h>
#include <athreadtemplate.h>
#include <aappllicationservice.h>
#include <aapplicationconfig.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AApplication : public AThreadTemplate<AApplicationService> {

	Q_OBJECT

	public:

		explicit AApplication(QObject* parent = nullptr);
		virtual ~AApplication(void);
		Q_DISABLE_COPY(AApplication)

		void mInit(void);

	public slots:

		void slInitiated(void);

	signals:

		void sgInit(void);
		void sgInitiated(void);

	private:

		ABackend* pBackend = nullptr;
		AApplicationConfig* pConfig = nullptr;
};

#endif // AAPPLICATION_H
