// ----------------------------------------------------------
/*!
	\class ToDoList
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/06/2020 at 12:12:33
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "todolist.h"


// -----------
/*!
	\fn

	Doc.
*/

ToDoList::ToDoList(QObject *parent) : QObject(parent) {

	ToDoItem oItem1 = {};
	oItem1.done = false;
	oItem1.description = "Decription 001";
	pItems.append(oItem1);

	ToDoItem oItem2 = {};
	oItem2.done = false;
	oItem2.description = "Decription 002";
	pItems.append(oItem2);

	ToDoItem oItem3 = {};
	oItem3.done = true;
	oItem3.description = "Decription 003";
	pItems.append(oItem3);

	ToDoItem oItem4 = {};
	oItem4.done = true;
	oItem4.description = "Decription 004";
	pItems.append(oItem4);

	ToDoItem oItem5 = {};
	oItem5.done = false;
	oItem5.description = "Decription 005";
	pItems.append(oItem5);
}


// -----------
/*!
	\fn

	Doc.
*/

ToDoList::~ToDoList(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

QVector<ToDoItem> ToDoList::mItems() const {

	return pItems;
}


// -----------
/*!
	\fn

	Doc.
*/

bool ToDoList::mSetItemAt(int inIndex, const ToDoItem &inItem) {

	if (inIndex < 0 || inIndex >= pItems.size()) {
		return false;
	}

	const ToDoItem &oOldItem = pItems.at(inIndex);
	if (inItem.done == oOldItem.done && inItem.description == oOldItem.description) {
		return false;
	}

	pItems[inIndex] = inItem;
	return true;
}


// -----------
/*!
	\fn

	Doc.
*/

void ToDoList::mAppendItem(void) {

	emit sgPreItemAppended();
	ToDoItem oItem;
	pItems.append(oItem);
	emit sgPostItemAppended();
}


// -----------
/*!
	\fn

	Doc.
*/

void ToDoList::mRemoveCompletedItems(void) {

	for (int i = 0; i < pItems.size();)	{
		if (pItems.at(i).done) {

			emit sgPreItemRemoved(i);
			pItems.removeAt(i);
			emit sgPostItemRemoved();

		} else {

			++i;

		}
	}
}


