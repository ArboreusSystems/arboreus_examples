// ----------------------------------------------------------
/*!
	\headerfile AObject
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 14:55:01
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECT_H
#define AOBJECT_H

// System includes
#include <QObject>

// Application includes
#include <athreadtemplate.h>
#include <aobjectservice.h>

// Constants and definitions

// Namespace

// Class definitions
class AObject : public AThread<AObjectService> {

	Q_OBJECT

	public:

		explicit AObject(QObject *parent = nullptr);
		virtual ~AObject(void);

		void mInitService(void);

	signals:

		void sgInitService(void);
};

#endif // AOBJECT_H
