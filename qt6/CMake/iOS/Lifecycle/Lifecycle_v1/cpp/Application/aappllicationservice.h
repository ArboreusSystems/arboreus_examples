// ----------------------------------------------------------
/*!
	\headerfile AAppllicationService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/10/2022 at 13:03:29
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLLICATIONSERVICE_H
#define AAPPLLICATIONSERVICE_H

// System includes

// Precompiled includes
#include <aapplicationpch.h>

// Application includes
#include <aloggerglobal.h>
#include <athreadservicetemplate.h>

// Constants and definitions

// Namespace

// Class definitions
class AApplicationService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit AApplicationService(QObject* parent = nullptr);
		virtual ~AApplicationService(void);

	public slots:

		void slInit(void);

	signals:

		void sgInitiated(void);
};

#endif // AAPPLLICATIONSERVICE_H
