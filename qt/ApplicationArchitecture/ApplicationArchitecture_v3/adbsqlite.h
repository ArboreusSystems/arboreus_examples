// ----------------------------------------------------------
/*!
	\headerfile ADbSqlite
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/03/2021 at 15:44:08
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
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class ADbSqlite : public QObject {

	Q_OBJECT

	public:

		explicit ADbSqlite(QObject *parent = nullptr);
		virtual ~ADbSqlite(void);

		bool mStart(ADbSqliteProperties* inProperties);
		bool mClose(void);
		bool mRemove(void);

	private:

		ADbSqliteProperties* pPropperties = nullptr;
};

#endif // ADBSQLITE_H
