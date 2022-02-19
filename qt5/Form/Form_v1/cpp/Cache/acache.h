// ----------------------------------------------------------
/*!
	\headerfile ASession
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 18:31:16
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASESSION_H
#define ASESSION_H

// System includes
#include <QObject>
#include <QString>
#include <QHash>
#include <QVariant>
#include <QVariantMap>
#include <string>

// Application includes
#include <aloggerglobal.h>
#include <acachedatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ACache : public QObject {

	Q_OBJECT

	public:

		explicit ACache(QObject* parent = nullptr);
		virtual ~ACache(void);

	public slots:

		void mPut(QString inKey,QVariant inValue);
		QVariantMap mGet(QString inKey);
		void mRemove(QString inKey);

		void mPutInCollection(QString inCollectionID,QString inKey,QVariant inValue);
		QVariantMap mGetFromCollection(QString inCollectionID,QString inKey);
		void mRemoveFromCollection(QString inCollectionID,QString inKey);
		QVariantMap mGetCollection(QString inCollectionID);
		void mRemoveCollection(QString inCollectionID);

	private:

		QHash<QString,QVariant> pSession = {};

		bool mIsCollectionExisted(QString inCollectionID);
};

#endif // ASESSION_H
