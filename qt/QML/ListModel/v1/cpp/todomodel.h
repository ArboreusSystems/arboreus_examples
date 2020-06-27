// ----------------------------------------------------------
/*!
	\headerfile ToDoModel
	\title
	\brief Template file wizard/classes/itemmodel.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/06/2020 at 11:31:46
	\endlist
*/
// ----------------------------------------------------------
#ifndef TODOMODEL_H
#define TODOMODEL_H

// System includes
#include <QAbstractListModel>

// Application includes

// Constants and definitions
class ToDoList;


class ToDoModel : public QAbstractListModel {

	Q_OBJECT
	Q_PROPERTY(ToDoList* pList READ getPList WRITE setPList)

	public:

		explicit ToDoModel(QObject *parent = nullptr);
		virtual ~ToDoModel(void);

		enum {

			RoleNameDone = Qt::UserRole,
			RoleNAmeDescription
		};

		int rowCount(const QModelIndex &parent = QModelIndex()) const override;
		QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
		bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;
		Qt::ItemFlags flags(const QModelIndex& index) const override;
		virtual QHash<int,QByteArray> roleNames(void) const override;
		ToDoList* getPList(void) const;
		void setPList(ToDoList* inValue);

private:

		ToDoList* pList;
};

#endif // TODOMODEL_H
