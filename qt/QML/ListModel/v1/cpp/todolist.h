// ----------------------------------------------------------
/*!
	\headerfile ToDoList
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/06/2020 at 12:12:33
	\endlist
*/
// ----------------------------------------------------------
#ifndef TODOLIST_H
#define TODOLIST_H

// System includes
#include <QObject>
#include <QString>
#include <QVector>

// Application includes

// Constants and definitions
struct ToDoItem {

	bool done = false;
	QString description;
};


// Class definitions
class ToDoList : public QObject {

	Q_OBJECT

	public:

		QVector<ToDoItem> pItems;

		explicit ToDoList(QObject *parent = nullptr);
		virtual ~ToDoList(void);

		QVector<ToDoItem> mItems(void) const;
		bool mSetItemAt(int inIndex,const ToDoItem &inItem);

	signals:

		void sgPreItemAppended(void);
		void sgPostItemAppended(void);
		void sgPreItemRemoved(int inIndex);
		void sgPostItemRemoved();

	public slots:

		void mAppendItem(void);
		void mRemoveCompletedItems(void);

	private:


};

#endif // TODOLIST_H
