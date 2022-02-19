// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/09/2019 at 21:17:33
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASQLITESTORAGE_H
#define ASQLITESTORAGE_H

// System includes
#include <QObject>
#include <QString>
#include <QStandardPaths>
#include <QList>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QSqlRecord>
#include <QVariantList>
#include <QVariant>

// Application includes
#include "cpp/global/aglobal.h"
#include "cpp/filesystem/adir.h"
#include "cpp/filesystem/afile.h"

// Constants and definition
#define TABLE_NAME "testTable"


class aSqliteStorage : public QObject {

	Q_OBJECT

	public:

		explicit aSqliteStorage(QObject *parent = nullptr);
		virtual ~aSqliteStorage(void);


	public slots:

		QVariantList mReadAllRecords(void);
		bool mWriteRecord(QList<QString> inRecord);

	private:

		QSqlDatabase pDataBase;
		bool mCreateDB(void);

};

#endif // ASQLITESTORAGE_H
