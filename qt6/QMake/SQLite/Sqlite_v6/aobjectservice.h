// ----------------------------------------------------------
/*!
	\headerfile AObjectService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 14:55:23
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTSERVICE_H
#define AOBJECTSERVICE_H

// System includes
#include <QObject>
#include <QString>

// Application includes
#include <alogger.h>
#include <athreadservicetemplate.h>
#include <adbsqlite.h>
#include <aproperties.h>

// Constants and definitions

// Namespace

// Class definitions
class AObjectService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit AObjectService(QObject *parent = nullptr);
		virtual ~AObjectService(void);

		QString mGetDbName(void);

	public slots:

		void slInitService(void);

	private:

		ADbSqlite* pDatabase = nullptr;
};

#endif // AOBJECTSERVICE_H
