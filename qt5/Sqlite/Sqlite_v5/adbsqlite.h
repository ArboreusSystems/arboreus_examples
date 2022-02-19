// ----------------------------------------------------------
/*!
	\headerfile ADbSqlite
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 15:08:58
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADBSQLITE_H
#define ADBSQLITE_H

// System includes
#include <QObject>
#include <QSqlDatabase>

// Application includes
#include <adbsqlitedatamodels.h>
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class ADbSqlite : public QObject {

	Q_OBJECT

	public:

		explicit ADbSqlite(QObject *parent = nullptr);
		virtual ~ADbSqlite(void);

		void mStart(ADbSqliteProperties* inProperties);
		bool mClose(void);
		void mRemove(void);

	private:

		QString pName = "NoName";
		QString pPath = "NoPath";
};

#endif // ADBSQLITE_H
