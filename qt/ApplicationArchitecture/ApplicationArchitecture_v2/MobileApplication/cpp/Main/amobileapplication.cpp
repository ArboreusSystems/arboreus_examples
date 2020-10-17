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

AMobileApplication::AMobileApplication(int inCounter, char* inArguments[], QObject *parent) : QObject(parent) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	pGuiApplication = new QGuiApplication(inCounter,inArguments);
	pEngine = new QQmlApplicationEngine();
	pRootContext = pEngine->rootContext();
}


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

	Q_UNUSED(inCounter);
	Q_UNUSED(inArguments);

	const QUrl oURL(QStringLiteral(AMOBILE_QML_MAIN));
	QObject::connect(
		pEngine, &QQmlApplicationEngine::objectCreated,
		pGuiApplication, [oURL](QObject *obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	pEngine->load(oURL);

	return pGuiApplication->exec();
}
