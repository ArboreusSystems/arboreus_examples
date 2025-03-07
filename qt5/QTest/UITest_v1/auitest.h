// ----------------------------------------------------------
/*!
	\headerfile AUITest
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/09/2020 at 20:35:23
	\endlist
*/
// ----------------------------------------------------------

#ifndef AUITEST_H
#define AUITEST_H

// System includes
#include <QObject>
#include <QQmlApplicationEngine>
#include <QPoint>
#include <QWindow>
#include <QTest>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Class definitions
class AUITest : public QObject {

	Q_OBJECT

	public:

		explicit AUITest(QQmlApplicationEngine* inEngine,QObject *parent = nullptr);
		explicit AUITest(QObject *parent = nullptr);
		virtual ~AUITest(void);

	public slots:

		void mClick(int inX,int inY);
		void mKeys(const QString& inText, int inDelay);

	private:

		QQmlApplicationEngine* pEngine;
};

#endif // AUITEST_H
