// ----------------------------------------------------------
/*!
	\headerfile aConTestObject
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 03/08/2019 at 11:45:55
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACONTESTOBJECT_H
#define ACONTESTOBJECT_H

// System includes
#include <QObject>
#include <QString>
#include <QVector>
#include <QRandomGenerator>

// Application includes
#include "../aglobal.h"
#include "handlers/ahandlermain.h"


class aConTestObject : public QObject {

	Q_OBJECT

	public:
		explicit aConTestObject(QObject *parent = nullptr);
		virtual ~aConTestObject(void);
		QString pString;
		int pNumber;
};

#endif // ACONTESTOBJECT_H
