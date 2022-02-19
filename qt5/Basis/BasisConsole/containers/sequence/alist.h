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
#include <QVector>
#include <QString>

// Application includes
#include "../../aglobal.h"
#include "handlers/ahandlermain.h"


class aList : public QObject {

	Q_OBJECT

	public:
		explicit aList(QObject *parent = nullptr);
		virtual ~aList(void);
		void mDoTest(void);
		QList<QString> pTestList;
		QVector<aDictionaryType> pDictionary;

	private:

};

#endif // ALIST_H
