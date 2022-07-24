/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 24/07/2022 at 17:32:12
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QString>

// iOS includes
#import <UIKit/UIKit.h>
#import <aapplicationdelegate.h>

// Application includes
#include <aloggerglobal.h>

// Constants

// Global variables
static UIApplication* gUIApplication = nil;

// Qt Quick Application
int main(int inCounter, char* inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	gUIApplication = [UIApplication sharedApplication];
	AApplicationDelegate* oDelegate = [[AApplicationDelegate alloc] init];
	[gUIApplication setDelegate:oDelegate];

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;
	QObject::connect(
		&oApplication,&QGuiApplication::applicationStateChanged,
		&oApplication,[](Qt::ApplicationState inState){
			_A_DEBUG << \
				"QGUI Application state changed:" << \
				QMetaEnum::fromType<Qt::ApplicationState>().valueToKey(inState);
		}
	);

	qInstallMessageHandler(fLoggerMessageHandler);
	
	_A_DEBUG << "inCounter:" << inCounter << "inArguments:" << QString(*inArguments);
	
	[[gUIApplication delegate] application:gUIApplication willFinishLaunchingWithOptions:NULL];

	const QUrl oURL(QStringLiteral("qrc:/main.qml"));
	QObject::connect(
		&oEngine, &QQmlApplicationEngine::objectCreated,
		&oApplication, [oURL](QObject* obj, const QUrl& objUrl) {
			if (!obj && oURL == objUrl) {
				QCoreApplication::exit(-1);
			}
		}, Qt::QueuedConnection
	);
	oEngine.load(oURL);
	
	[[gUIApplication delegate] application:gUIApplication didFinishLaunchingWithOptions:NULL];
	
	return oApplication.exec();
}
