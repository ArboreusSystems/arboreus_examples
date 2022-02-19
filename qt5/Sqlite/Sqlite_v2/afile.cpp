// ----------------------------------------------------------
/*!
	\class AFile
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/03/2021 at 19:43:51
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "afile.h"


// -----------
/*!
	\fn

	Doc.
*/

AFile::AFile(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

AFile::~AFile(void) {

}


// -----------
/*!
	\fn bool aFile::mRemove(QString inPath)

	Remove file if existed.
*/

bool AFile::mRemove(QString inPath) {

	if (mExist(inPath)) {
		QFile(inPath).remove();
		if (!mExist(inPath)) {
			return true;
		}
		return false;
	}
	return false;
}


// -----------
/*!
	\fn bool aFile::mExist(QString inPath)

	Checking file existance.
*/

bool AFile::mExist(QString inPath) {

	if (QFileInfo(inPath).exists() && !QDir(inPath).exists()) {
		return true;
	}
	return false;
}
