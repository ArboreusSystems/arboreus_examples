// ----------------------------------------------------------
/*!
	\headerfile ASqlDatabase
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 12:05:47
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASQLDATABASE_H
#define ASQLDATABASE_H

// System includes
#include <QObject>

// Application includes
#include <asqlservice.h>

// Constants and definitions

// Namespace

// Class definitions
class ASqlDatabase : public QObject {

	Q_OBJECT

	public:

		explicit ASqlDatabase(QObject *parent = nullptr);
		virtual ~ASqlDatabase(void);

		void mInit(ASqlDatabaseProperties* inProperties);

	signals:

		void sgInit(ASqlDatabaseProperties* inProperties);
};

#endif // ASQLDATABASE_H
