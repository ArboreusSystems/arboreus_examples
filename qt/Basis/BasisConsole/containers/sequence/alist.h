// ----------------------------------------------------------
/*!
	\headerfile aList
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 16:49:53
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALIST_H
#define ALIST_H

// System includes
#include <QObject>
#include <QList>

// Application includes
#include "../../aglobal.h"

class aList : public QObject {

	Q_OBJECT

	public:
		explicit aList(QObject *parent = nullptr);
		virtual ~aList(void);
		void mDotest(void);
};

#endif // ALIST_H
