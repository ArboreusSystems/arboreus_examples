/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file wizards/projects/qtquickapplication/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 12/03/2021 at 09:09:11
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>

// Application includes
#include <aproperties.h>
#include <alogger.h>
#include <athread.h>
#include <asqlmanager.h>
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
	ASqlManager oSqlManager;
	ASqlDatabase oSqlDatabase;

	ASqlDatabaseProperties* oSqlDatabaseProperties = new ASqlDatabaseProperties();
	oSqlDatabaseProperties->Name = QString("TestDBName");
	oSqlDatabaseProperties->Path = oProperties->pPathDB + "/" + oSqlDatabaseProperties->Name + ".db";

	QObject::connect(
		&oSqlManager,&ASqlManager::sgAddDatabase,
		&oSqlDatabase,&ASqlDatabase::slAddDatabase
	);

	oThread.start(QThread::Priority::LowPriority);
	oSqlDatabase.moveToThread(&oThread);
	oSqlManager.mAddDatabase(oSqlDatabaseProperties);

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
