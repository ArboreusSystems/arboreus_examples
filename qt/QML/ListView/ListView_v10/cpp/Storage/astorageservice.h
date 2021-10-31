// ----------------------------------------------------------
/*!
	\headerfile AStorageService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/07/2021 at 23:13:39
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTORAGESERVICE_H
#define ASTORAGESERVICE_H

// System includes
#include <QObject>
#include <QString>

// Application includes
#include <aloggerglobal.h>
#include <athreadservicetemplate.h>
#include <adbsqlcipher.h>
#include <adir.h>

// Constants and definitions

// Namespace


// Class definitions
class AStorageService : public AThreadServiceTemplate {

	Q_OBJECT

	public:

		explicit AStorageService(QObject* parent = nullptr);
		virtual ~AStorageService(void);

		ADBSqlCipher* mGetDB(void);

	public slots:

		void slInit(QString inPathStorageData);

	signals:

		void sgInitiated(void);

	private:

		QString pPathStorageData = QString("NoPathStorageData");
		ADBSqlCipher* pDB = nullptr;
};

#endif // ASTORAGESERVICE_H
