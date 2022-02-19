/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 16/03/2021 at 10:45:03
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include <athread.h>
#include <alogger.h>
#include <aproperties.h>
#include <asqldatabase.h>

// Constants

// Qt Quick Application
int main(int inCounter, char *inArguments[]) {

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

	QGuiApplication oApplication(inCounter, inArguments);
	QQmlApplicationEngine oEngine;

	AProperties* oProperties = &AProperties::mInstance();

	AThread oThread;

	ASqlService oSqlService;
	oSqlService.moveToThread(&oThread);

	ASqlDatabaseProperties* oSqlDBProperties = new ASqlDatabaseProperties();
	oSqlDBProperties->Name = QString("TestDBName");
	oSqlDBProperties->Path = oProperties->pPathDB + "/" + oSqlDBProperties->Name + ".db";

	ASqlDatabase oSqlDatabase;
	QObject::connect(
		&oSqlDatabase,&ASqlDatabase::sgInit,
		&oSqlService,&ASqlTemplate::slInit
	);
	oSqlDatabase.mInit(oSqlDBProperties);

	const QUrl oURL(QStringLiteral("qrc:/main.qml"));
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
