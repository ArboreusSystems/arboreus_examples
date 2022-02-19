// ----------------------------------------------------------
/*!
	\headerfile ACustomType
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/09/2020 at 20:33:16
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACUSTOMTYPE_H
#define ACUSTOMTYPE_H

// System includes
#include <QObject>
#include <QMetaObject>
#include <QQmlApplicationEngine>

// Application includes
#include "alogger.h"
#include "aglobal.h"

// Constants and definitions

// Namespace

// Class definitions
class ACustomType : public QObject {

	Q_OBJECT

	public:

		explicit ACustomType(QObject *parent = nullptr);
		virtual ~ACustomType(void);

	public slots:

		void mInit(void);
		void mAction(void);

	private:

		AGlobal* pGlobal;

		void mActionStep1(void);
		void mActionStep2(void);
		void mActionStep3(void);
};

#endif // ACUSTOMTYPE_H
