// ----------------------------------------------------------
/*!
	\headerfile AObjectOne
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 10:32:54
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTONE_H
#define AOBJECTONE_H

// System includes
#include <QObject>
#include <QDebug>

// Application includes
#include <aobjectoneinterface.h>
#include <aobjecttwo.h>

// Constants and definitions

// Namespace

// Class definitions
class AObjectOne : public QObject {

	Q_OBJECT

	public:

		explicit AObjectOne(QObject *parent = nullptr);
		virtual ~AObjectOne(void);

		void mInit(void);
		void mTest(void);

	signals:

	private:

		AObjectOneInterface* pObjectTwo = nullptr;

};

#endif // AOBJECTONE_H
