// ----------------------------------------------------------
/*!
	\headerfile ATableViewModel
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2021 at 18:40:44
	\endlist
*/
// ----------------------------------------------------------

#ifndef AABSTRACTMODEL_H
#define AABSTRACTMODEL_H

// System includes
#include <QAbstractListModel>
#include <QVariant>
#include <QList>
#include <QVariantList>
#include <QString>

// Application includes
#include <abackend.h>

// Constants and definitions

// Namespace


// Class definitions
class AAbstractModel : public QAbstractListModel {

	Q_OBJECT

	public:

		explicit AAbstractModel(QObject* parent = nullptr);
		virtual ~AAbstractModel(void);

		virtual int columnCount(const QModelIndex&parent) const;
		virtual QHash<int, QByteArray> roleNames() const;
		virtual QVariant data(const QModelIndex& index, int role) const;
		virtual int rowCount(const QModelIndex& parent) const;

	public slots:

		void mAdd(QString inColor,QString inText);

	private:

		ABackend* pBackend;
		QHash<int, QByteArray> pRoleNames = {};
		QVariantList pCache = {};
		int pRowCount = 0;
		int pUserRole = Qt::UserRole + 1;

		void mInitRoleNames(void);
		void mInitCache(void);

	private slots:

		void slDataUpdated(void);
};

#endif // AABSTRACTMODEL_H
