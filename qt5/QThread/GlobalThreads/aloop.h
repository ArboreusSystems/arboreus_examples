// ----------------------------------------------------------
/*!
	\headerfile ALoop
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/12/2019 at 08:30:37
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOOP_H
#define ALOOP_H

// System includes
#include <QObject>
#include <QTimer>
#include <QThread>

// Application includes
#include "aglobal.h"

// Constants and definitions


// Class definitions
class ALoop : public QObject {

	Q_OBJECT

	public:

		explicit ALoop(QObject *parent = nullptr);
		explicit ALoop(QString inName,int inCounter,QObject *parent = nullptr);
		virtual ~ALoop(void);

		void mRun(void);

	public slots:

		void mStop(void);

	signals:

		void sgStart(void);

	private:

		QTimer* pTimer = new QTimer(this);
		int pCounter = 100;
		int pInterval = 0;
		QString pName = "Default name";

	private slots:

		void mNext(void);
		void mStart(void);
};

#endif // ALOOP_H
