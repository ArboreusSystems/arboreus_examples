// ----------------------------------------------------------
/*!
	\class AMobileApplication
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/10/2020 at 11:58:19
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "amobileapplication.h"


// -----------
/*!
	\fn

	Doc.
*/

AMobileApplication::AMobileApplication(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

AMobileApplication::~AMobileApplication(void) {}


// -----------
/*!
	\fn

	Doc.
*/

int AMobileApplication::mExecute(int inCounter, char* inArguments[]) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	QGuiApplication oApplication(inCounter, inArguments);

	QQmlApplicationEngine oEngine;
	const QUrl oURL(QStringLiteral(AMOBILE_QML_MAIN));
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
