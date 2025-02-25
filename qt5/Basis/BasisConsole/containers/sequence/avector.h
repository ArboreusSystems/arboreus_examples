// ----------------------------------------------------------
/*!
	\headerfile aVector
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 16:38:23
	\endlist
*/
// ----------------------------------------------------------

#ifndef AVECTOR_H
#define AVECTOR_H

// System includes
#include <QObject>
#include <QVector>
#include <QVectorIterator>
#include <QRandomGenerator>
#include <algorithm>

// Application includes
#include "../../aglobal.h"
#include "../acontestobject.h"


class aVector : public QObject {

	Q_OBJECT

	public:
		explicit aVector(QObject *parent = nullptr);
		virtual ~aVector(void);
		void mDoTest(void);

	private:
		int pSize;
		QVector<int> pVector;
		QVector<aConTestObject*> pVectorObjects;

};

#endif // AVECTOR_H
