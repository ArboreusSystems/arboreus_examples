// ----------------------------------------------------------
/*!
	\headerfile AStorage
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/07/2021 at 23:10:20
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTORAGE_H
#define ASTORAGE_H

// System includes
#include <QObject>
#include <QString>
#include <QEventLoop>

// Application includes
#include <athreadtemplate.h>
#include <athreadobjectcontrollertemplate.h>
#include <astorageservice.h>
#include <adbrequestall.h>
#include <adbrequestadd.h>
#include <adbrequestallordered.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AStorage : public AThreadTemplate<AStorageService> {

	Q_OBJECT

	public:

		explicit AStorage(QObject* parent = nullptr);
		virtual ~AStorage(void);
		Q_DISABLE_COPY(AStorage)

		void mInit(void);

	public slots:

		QVariantList mGetAll(void);
		QVariantList mGetAllOrdered(QString inFieldname,_A_ENUM_DB_SORTING_DIRECTION inDirection);
		qlonglong mAdd(QString inFirstName, QString inLastName, QString inPhoneNumber);

	signals:

		void sgInit(QString inPathStorageData);
		void sgInitiated(void);
		void sgDataUpdated(void);

	private:

		ABackend* pBackend = nullptr;

	private slots:

		void slInitiated(void);
};

#endif // ASTORAGE_H
