// ----------------------------------------------------------
/*!
	\headerfile ADesktopApplication
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/10/2020 at 13:36:09
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADESKTOPAPPLICATION_H
#define ADESKTOPAPPLICATION_H

// System includes
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include "../Universal/Main/abackend.h"

// Constants and definitions
#define ADESKTOP_QML_MAIN "qrc:/DesktopApplication/qml/Main/DesktopApplication.qml"

// Namespace

// Class definitions
class ADesktopApplication : public QObject {

	Q_OBJECT

	public:

		QGuiApplication* pGuiApplication = nullptr;
		QQmlApplicationEngine* pEngine = nullptr;
		QQmlContext* pRootContext = nullptr;

		explicit ADesktopApplication(int inCounter, char* inArguments[], QObject* parent = nullptr);
		explicit ADesktopApplication(QObject *parent = nullptr);
		virtual ~ADesktopApplication(void);

		int mExecute(int inCounter, char* inArguments[]);
};

#endif // ADESKTOPAPPLICATION_H
