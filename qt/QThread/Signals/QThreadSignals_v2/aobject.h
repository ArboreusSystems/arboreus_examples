// ----------------------------------------------------------
/*!
	\headerfile AObject
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/11/2020 at 11:32:23
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECT_H
#define AOBJECT_H

// System includes
#include <QObject>

// Application includes
#include "aobjecthandler.h"
#include "alogger.h"

// Constants and definitions

// Namespace

// Class definitions
class AObject : public QObject {

	Q_OBJECT

	public:

		AObjectHandler* pHandler = nullptr;

		explicit AObject(AObjectHandler* inHandler,QObject *parent = nullptr);
		explicit AObject(QObject *parent = nullptr);
		virtual ~AObject(void);

		void mTest(void);

	public slots:

		void mTestQML(void);

	signals:

		void sgTest(int inValue);
};

#endif // AOBJECT_H
