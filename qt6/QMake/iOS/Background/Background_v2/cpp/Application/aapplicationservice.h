// ----------------------------------------------------------
/*!
	\headerfile AApplicationService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/05/2022 at 16:08:17
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONSERVICE_H
#define AAPPLICATIONSERVICE_H

// System includes
#include <QObject>

// Application includes
#include <athreadservicetemplate.h>
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AApplicationService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit AApplicationService(QObject *parent = nullptr);
		virtual ~AApplicationService(void);

	public slots:

		void slInit(void);

	signals:

		void sgInitiated(void);
};

#endif // AAPPLICATIONSERVICE_H
