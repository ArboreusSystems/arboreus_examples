// ----------------------------------------------------------
/*!
	\headerfile ASqlDatabase
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/03/2021 at 16:25:40
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASQLDATABASE_H
#define ASQLDATABASE_H

// System includes
#include <QObject>
#include <QtSql>

// Application includes
#include <asqldatamodels.h>
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class ASqlDatabase : public QObject {

	Q_OBJECT

	public:

		explicit ASqlDatabase(QObject *parent = nullptr);
		virtual ~ASqlDatabase(void);

	public slots:

		void slAddDatabase(ASqlDatabaseProperties* inProperties);

	private:

		ASqlDatabaseProperties* pProperties = nullptr;
};

#endif // ASQLDATABASE_H
