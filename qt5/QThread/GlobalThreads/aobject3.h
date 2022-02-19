// ----------------------------------------------------------
/*!
	\headerfile AObject3
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/12/2019 at 08:16:22
	\endlist
*/
// ----------------------------------------------------------
#ifndef AOBJECT3_H
#define AOBJECT3_H

// System includes
#include <QObject>

// Application includes
#include "aglobal.h"
#include "aloop.h"

// Constants and definitions


// Class definitions
class AObject3 : public QObject {

	Q_OBJECT

	public:

		explicit AObject3(QObject *parent = nullptr);
		virtual ~AObject3(void);

	private:

		A_GLOBAL_PROPERTY;
		ALoop* pDemoLoopNormal;
		ALoop* pDemoLoopLow;
		ALoop* pDemoLoopLowest;
};

#endif // AOBJECT3_H
