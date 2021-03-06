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

ADesktopApplication::ADesktopApplication(int inCounter, char* inArguments[], QObject *parent) : QObject(parent) {

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	pGuiApplication = new QGuiApplication(inCounter,inArguments);
	pEngine = new QQmlApplicationEngine();
	pRootContext = pEngine->rootContext();

	ALOG_SYSTEM << "ADesktopApplication created with arguments";
}


// -----------
/*!
	\fn

	Doc.
*/

ADesktopApplication::ADesktopApplication(QObject *parent) : QObject(parent) {

	ALOG_SYSTEM << "ADesktopApplication created";
}


// -----------
/*!
	\fn

	Doc.
*/

ADesktopApplication::~ADesktopApplication(void) {

	ALOG_SYSTEM << "ADesktopApplication deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

int ADesktopApplication::mExecute(int inCounter, char *inArguments[]) {

	Q_UNUSED(inCounter);
	Q_UNUSED(inArguments);

	ABackend* oBackend = &ABackend::mInstance();
	oBackend->mSetup();

	const QUrl oURL(QStringLiteral(ADESKTOP_QML_MAIN));
	QObject::connect(
		pEngine, &QQmlApplicationEngine::objectCreated,
		pGuiApplication, [oURL](QObject *obj, const QUrl &objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	pEngine->load(oURL);

	ALOG_SYSTEM << "ADesktopApplication executing GUI Application";
	return pGuiApplication->exec();
}
