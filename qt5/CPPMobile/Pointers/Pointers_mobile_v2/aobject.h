// ----------------------------------------------------------
/*!
	\headerfile AObject
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/07/2020 at 12:10:59
	\endlist
*/
// ----------------------------------------------------------
#ifndef AOBJECT_H
#define AOBJECT_H

// System includes
#include <QObject>
#include <QString>

// Application includes
#include "alogger.h"

// Constants and definitions


// Class definitions
class AObject : public QObject {

	Q_OBJECT

	public:

		explicit AObject(QObject* parent = nullptr);
		virtual ~AObject(void);

		void mSetName(const char* inName);
		void mTestMethod(void);

	private:

		QString* pName = new QString("Default name");
};

#endif // AOBJECT_H
