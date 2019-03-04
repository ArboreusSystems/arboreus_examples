/* -------------------------------------------------------------------
 *  @doc The example of using libzip.org
 *  @notice

 *		!!! Attention !!!
 *
 *		This example adopted for using on MacOS. If you need to use it on another
 *		platform you need to do the adjusting of this project and the static library.
 *		At time of building libzip static library performing configuration file.
 *		This file is unique for every platform. You need to have this file in precise
 *		to your platform.
 *
 *		This example demonstrating adding directory to archive. The same principles
 *		using for performing other actions. Follow https://libzip.org/documentation/
 *		for getting manuals.
 *
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 04/03/2019 at 12:45:06
 * */// --------------------------------------------------------------

// System includes
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "libs/zip.h"


// Application includes

// Constants
const QString Main = "qrc:/main.qml";


// QtQuick Application
int main(int Counter, char *Arguments[]) {

	const char *vZipPath = "[path/where/need/to/locate]/test.zip";
	const char *vDirToBeArchived = "[directory/path/that/need/to/be/archived]/dir_zip_test";
	zip_t *vZip = zip_open(vZipPath,ZIP_CREATE,nullptr);
	zip_add_dir(vZip,vDirToBeArchived);
	zip_close(vZip);

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication Application(Counter, Arguments);

	QQmlApplicationEngine Engine;
	Engine.load(QUrl(Main));
	if (Engine.rootObjects().isEmpty())
		return -1;

	return Application.exec();
}
