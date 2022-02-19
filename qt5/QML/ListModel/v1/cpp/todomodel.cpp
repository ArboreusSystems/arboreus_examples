// ----------------------------------------------------------
/*!
	\class
	\title
	\brief Template file wizard/classes/itemmodel.cpp

	\list
	\li @notice Template file wizard/classes/itemmodel.cpp
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/06/2020 at 11:31:46
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "todomodel.h"

// Application headers
#include "todolist.h"


// -----------
/*!
	\fn

	Doc.
*/

ToDoModel::ToDoModel(QObject *parent): QAbstractListModel(parent) {

	pList = new ToDoList(nullptr);
}


// -----------
/*!
	\fn

	Doc.
*/

ToDoModel::~ToDoModel(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

int ToDoModel::rowCount(const QModelIndex &parent) const {

	if (parent.isValid() || !pList) {
		return 0;
	}
	return pList->pItems.size();
}


// -----------
/*!
	\fn

	Doc.
*/

QVariant ToDoModel::data(const QModelIndex& inIndex, int inRole) const {

	QVariant oOutput = QVariant();

	if (!inIndex.isValid() || !pList) {return oOutput;}

	const ToDoItem oItem = pList->pItems.at(inIndex.row());
	switch (inRole) {
		case RoleNameDone: oOutput = QVariant(oItem.done); break;
		case RoleNAmeDescription: oOutput = QVariant(oItem.description); break;
		default: break;
	}

	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

bool ToDoModel::setData(const QModelIndex& inIndex, const QVariant& inValue, int inRole) {

	if (!pList) {return false;}

	ToDoItem oItem = pList->pItems.at(inIndex.row());
	switch (inRole) {
		case RoleNameDone: oItem.done = inValue.toBool(); break;
		case RoleNAmeDescription: oItem.description = inValue.toString(); break;
		default: break;
	}

	if (pList->mSetItemAt(inIndex.row(),oItem)) {
		emit dataChanged(inIndex, inIndex, QVector<int>() << inRole);
		return true;
	}
	return false;
}


// -----------
/*!
	\fn

	Doc.
*/

Qt::ItemFlags ToDoModel::flags(const QModelIndex& inIndex) const {

	if (!inIndex.isValid())
		return Qt::NoItemFlags;

	return Qt::ItemIsEditable;
}


// -----------
/*!
	\fn

	Doc.
*/

QHash<int, QByteArray> ToDoModel::roleNames() const {

	QHash<int,QByteArray> oRoleNames;
	oRoleNames[RoleNameDone] = "done";
	oRoleNames[RoleNAmeDescription] = "description";
	return oRoleNames;
}


// -----------
/*!
	\fn

	Doc.
*/

ToDoList* ToDoModel::getPList() const {

	return pList;
}


// -----------
/*!
	\fn

	Doc.
*/

void ToDoModel::setPList(ToDoList* inValue) {

	beginResetModel();

	if (pList) {
		pList->disconnect(this);
	}

	pList = inValue;
	if (pList) {
		connect(
			pList,&ToDoList::sgPreItemAppended,
			this,[=](){
				const int oIndex = pList->pItems.size();
				beginInsertRows(QModelIndex(),oIndex,oIndex);
			}
		);
		connect(
			pList,&ToDoList::sgPostItemAppended,
			this,[=](){
				endInsertRows();
			}
		);
		connect(
			pList,&ToDoList::sgPreItemRemoved,
			this,[=](int oIndex){
				beginRemoveRows(QModelIndex(),oIndex,oIndex);
			}
		);
		connect(
			pList,&ToDoList::sgPostItemRemoved,
			this,[=](){
				endRemoveRows();
			}
		);
	}

	endResetModel();
}
