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

// Application includes

// Constants and definitions
#define ADESKTOP_QML_MAIN "qrc:/DesktopApplication/qml/Main/DesktopApplication.qml"

// Namespace

// Class definitions
class ADesktopApplication : public QObject {

	Q_OBJECT

	public:

		explicit ADesktopApplication(QObject *parent = nullptr);
		virtual ~ADesktopApplication(void);

		static int mExecute(int inCounter, char* inArguments[]);
};

#endif // ADESKTOPAPPLICATION_H
