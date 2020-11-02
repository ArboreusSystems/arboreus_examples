// ----------------------------------------------------------
/*!
	\headerfile AObjectHandler
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/11/2020 at 11:32:43
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTHANDLER_H
#define AOBJECTHANDLER_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Class definitions
class AObjectHandler : public QObject {

	Q_OBJECT

	public:

		explicit AObjectHandler(QObject *parent = nullptr);
		virtual ~AObjectHandler(void);

	public slots:

		void mTest(int inValue);
};

#endif // AOBJECTHANDLER_H
