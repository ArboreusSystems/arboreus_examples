// ----------------------------------------------------------
/*!
	\class aFile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/09/2019 at 12:35:31
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "afile.h"


// -----------
/*!
	\fn aFile::aFile(QObject *parent) : QObject(parent)

	Class constructor.
*/

aFile::aFile(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn aFile::~aFile(void)

	Class desctructor.
*/

aFile::~aFile(void) {}


// -----------
/*!
	\fn bool aFile::mRemove(QString inPath)

	Remove file if existed.
*/

bool aFile::mRemove(QString inPath) {

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

bool aFile::mExist(QString inPath) {

	if (QFileInfo(inPath).exists() && !QDir(inPath).exists()) {
		return true;
	}
	return false;
}
