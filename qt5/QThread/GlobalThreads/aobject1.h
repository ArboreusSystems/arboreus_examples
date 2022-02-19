// ----------------------------------------------------------
/*!
	\headerfile AObject1
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/12/2019 at 08:15:40
	\endlist
*/
// ----------------------------------------------------------
#ifndef AOBJECT1_H
#define AOBJECT1_H

// System includes
#include <QObject>

// Application includes
#include "aglobal.h"
#include "aloop.h"

// Constants and definitions


// Class definitions
class AObject1 : public QObject {

	Q_OBJECT

	public:

		explicit AObject1(QObject *parent = nullptr);
		virtual ~AObject1(void);

	private:

		A_GLOBAL_PROPERTY;
		ALoop* pDemoLoopNormal;
		ALoop* pDemoLoopLow;
		ALoop* pDemoLoopLowest;
};

#endif // AOBJECT1_H
