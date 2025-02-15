#include "alibrary.h"
#include "alibraryprivate.h"


ALibrary::ALibrary(QObject* parent)	: QObject(parent) {

	pPrivate = new ALibraryPrivate(this);

	qDebug() << "ALibrary created";
}

ALibrary::~ALibrary(void) {

	qDebug() << "ALibrary deleted";
}

int ALibrary::mOpenDB(QString inPath) {

	return pPrivate->mOpenDB(inPath);
}

bool ALibrary::mCloseDB() {

	return pPrivate->mCloseDB();
}

bool ALibrary::mExecute(QString inSQL) {

	return pPrivate->mExecute(inSQL);
}
