// ----------------------------------------------------------
/*!
	\headerfile aLinkedList
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 16:59:17
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALINKEDLIST_H
#define ALINKEDLIST_H

// System includes
#include <QObject>
#include <QLinkedList>
#include <QVector>
#include <QRandomGenerator>

// Application includes
#include "../../aglobal.h"
#include "handlers/ahandlermain.h"


class aLinkedList : public QObject {

	Q_OBJECT

	public:
		explicit aLinkedList(QObject *parent = nullptr);
		virtual ~aLinkedList(void);
		void mDoTest(void);
};

#endif // ALINKEDLIST_H
