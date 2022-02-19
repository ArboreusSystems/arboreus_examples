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

		void mAdd(QString inColor,QString inText);

	private:

		ABackend* pBackend;
		QHash<int, QByteArray> pRoleNames;
		QVariantList pCache = {};
		int pRowCount = 0;

	private slots:

		void slDataUpdated(void);
};

#endif // ALISTVIEWMODEL_H
