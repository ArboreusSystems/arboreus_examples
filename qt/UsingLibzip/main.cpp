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
#include <QDebug>


// Application includes

// Constants
const QString Main = "qrc:/main.qml";


// QtQuick Application
int main(int Counter, char *Arguments[]) {

	const char *vZipPath = "[path/where/need/to/location]/test1.zip";
	int error = 0;
	const char *vData = "Data example\n";
	const char *vFile1 = "[path/where/need/to/location]/zip_test_files/1.txt";
	const char *vFile2 = "[path/where/need/to/location]/zip_test_files/2.txt";

	zip_t *vZip = zip_open(vZipPath,ZIP_CREATE,&error);

	zip_source *vSource1 = zip_source_buffer(vZip,vData,sizeof(*vData),0);
	zip_int64_t vIndex = zip_file_add(vZip,"test_file1.txt",vSource1,ZIP_FL_OVERWRITE);
	qDebug() << "Index: " << vIndex << "\n";

	zip_source *vSource2 = zip_source_buffer(vZip,vData,sizeof(*vData),0);
	vIndex = zip_file_add(vZip,"test_file2.txt",vSource2,ZIP_FL_OVERWRITE);
	qDebug() << "Index: " << vIndex << "\n";

	zip_source_t *vSource3 = zip_source_file(vZip, vFile1, 0, -1);
	vIndex = zip_file_add(vZip,"1.txt",vSource3,ZIP_FL_OVERWRITE);
	qDebug() << "Index: " << vIndex << "\n";

	zip_close(vZip);

	zip_t *vZip1 = zip_open(vZipPath,ZIP_CREATE,&error);

	zip_source_t *vSource4 = zip_source_file(vZip1, vFile2, 0, -1);
	vIndex = zip_file_add(vZip1,"2.txt",vSource4,ZIP_FL_OVERWRITE);
	qDebug() << "Index: " << vIndex << "\n";

	zip_close(vZip);

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication Application(Counter, Arguments);

	QQmlApplicationEngine Engine;
	Engine.load(QUrl(Main));
	if (Engine.rootObjects().isEmpty())
		return -1;

	return Application.exec();
}
