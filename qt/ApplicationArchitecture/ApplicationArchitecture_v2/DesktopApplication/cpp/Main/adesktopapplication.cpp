// ----------------------------------------------------------
/*!
	\class ADesktopApplication
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/10/2020 at 13:36:09
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adesktopapplication.h"


// -----------
/*!
	\fn

	Doc.
*/

ADesktopApplication::ADesktopApplication(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

ADesktopApplication::~ADesktopApplication(void) {}


// -----------
/*!
	\fn

	Doc.
*/

int ADesktopApplication::mExecute(int inCounter, char *inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter, inArguments);

	QQmlApplicationEngine oEngine;
	const QUrl oURL(QStringLiteral(ADESKTOP_QML_MAIN));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject *obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oURL);

	return oApplication.exec();
}
