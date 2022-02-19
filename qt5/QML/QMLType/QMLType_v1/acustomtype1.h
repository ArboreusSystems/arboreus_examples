// ----------------------------------------------------------
/*!
	\headerfile ACustomType1
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/09/2020 at 17:15:09
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACUSTOMTYPE1_H
#define ACUSTOMTYPE1_H

// System includes
#include <QObject>
#include <QVariant>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Class definitions
class ACustomType1 : public QObject {

	Q_OBJECT

	public:

		explicit ACustomType1(QObject *parent = nullptr);
		virtual ~ACustomType1(void);

	public slots:

		void mEmitSignal(void);
		void mEmitSignalWithParameter(QVariant inValue);

	signals:

		void sgTest(void);
};

#endif // ACUSTOMTYPE1_H
