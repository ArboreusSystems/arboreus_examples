// ----------------------------------------------------------
/*!
	\headerfile AMobileApplication
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/10/2020 at 11:58:19
	\endlist
*/
// ----------------------------------------------------------

#ifndef AMOBILEAPPLICATION_H
#define AMOBILEAPPLICATION_H

// System includes
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes

// Constants and definitions
#define AMOBILE_QML_MAIN "qrc:/MobileApplication/qml/Main/MobileApplication.qml"

// Namespace

// Class definitions
class AMobileApplication : public QObject {

	Q_OBJECT

	public:

		explicit AMobileApplication(QObject *parent = nullptr);
		virtual ~AMobileApplication(void);

		static int mExecute(int inCounter, char* inArguments[]);
};

#endif // AMOBILEAPPLICATION_H
