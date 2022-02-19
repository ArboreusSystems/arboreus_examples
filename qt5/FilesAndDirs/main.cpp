/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file console app/main.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 26/09/2019 at 14:37:45
 * */// --------------------------------------------------------------

#include <QCoreApplication>
#include <QFile>
#include <QFileInfo>
#include <QDir>
#include <QDirIterator>
#include <QStandardPaths>
#include <QStringList>
#include <QStringListIterator>
#include "aglobal.h"

int main(int Counter, char *Arguments[]) {

	QCoreApplication Application(Counter, Arguments);

	QString oWritablePath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);

	QString oDemoPath = oWritablePath + "/demo";
	QDir *oDemoDir = new QDir(oDemoPath);
	if (!oDemoDir->exists()) {
		oDemoDir->mkpath(oDemoPath);
	}

	auto fTest = [](QString inPath) {
		QDir *oDemoCustomDir = new QDir(inPath);
		if (!oDemoCustomDir->exists()) {
			oDemoCustomDir->mkpath(inPath);
			aLOG << "Created:" << inPath;
		}
	};

	for (int i = 0; i < 5; i++) {
		fTest(oDemoPath + "/path_" + QString().number(i));
	}

	QDirIterator oSubdirs(oDemoPath,QDirIterator::Subdirectories);
	while (oSubdirs.hasNext()) {
		aLOG << "Subdir:" << oSubdirs.next();
	}

	QStringList oDirList = oDemoDir->entryList(QDir::AllDirs);
	oDirList.removeOne(".");
	oDirList.removeOne("..");
	aLOG << oDirList;

	QStringListIterator oDirIterator(oDirList);
	while (oDirIterator.hasNext()) {
		aLOG << oDirIterator.next();
	}

	if (oDemoDir->removeRecursively()) {
		aLOG << "Demo directory deleted";
	}

	return Application.exec();
}
