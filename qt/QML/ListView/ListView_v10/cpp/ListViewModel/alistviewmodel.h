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

#ifndef ALISTVIEWMODEL_H
#define ALISTVIEWMODEL_H

// System includes
#include <QAbstractListModel>
#include <QVariant>
#include <QList>
#include <QVariantList>
#include <QVariantMap>
#include <algorithm>

// Application includes
#include <abackend.h>

// Constants and definitions

// Namespace


// Class definitions
class AListViewModel : public QAbstractListModel {

	Q_OBJECT

	public:

		enum Roles {ARow = Qt::UserRole + 1};

		explicit AListViewModel(QObject* parent = nullptr);
		virtual ~AListViewModel(void);

		virtual QHash<int, QByteArray> roleNames() const;
		virtual QVariant data(const QModelIndex& index, int role) const;
		virtual int rowCount(const QModelIndex& parent) const;

	public slots:

		qlonglong mAdd(QString inFirstName, QString inLastName, QString inPhoneNumber);
		void mSort(int inFieldNumber);
		void mSetDirection(_A_ENUM_DB_SORTING_DIRECTION inDirection);
		_A_ENUM_DB_SORTING_DIRECTION mGetDirection(void);
		QVariantList mStructure(void);

	private:

		ABackend* pBackend;
		QHash<int, QByteArray> pRoleNames;
		QVariantList pCache = {};
		QVariantList pStructure = {};
		int pRowCount = 0;
		int pIndex = 0;
		_A_ENUM_DB_SORTING_DIRECTION pDirection = _A_ENUM_DB_SORTING_DIRECTION::Ascendant;

		void mInitStructure(void);

	private slots:

		void slDataUpdated(void);
};

#endif // ALISTVIEWMODEL_H
