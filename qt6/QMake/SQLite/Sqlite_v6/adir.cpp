// ----------------------------------------------------------
/*!
	\class ADir
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 15:25:50
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "adir.h"


// -----------
/*!
	\fn

	Doc.
*/

ADir::ADir(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ADir::~ADir(void) {

}


// -----------
/*!
	\fn bool aDir::mEnsure(QString inPath)

	Ensure directory existance. If it's not existed - create on.
*/

bool ADir::mEnsure(QString inPath) {

	QDir oDir(inPath);
	if (!oDir.exists()) {
		return oDir.mkpath(inPath);
	};
	return true;
}


// -----------
/*!
	\fn QStringList aDir::mGetSubdirs(QString inPath)

	Return subdirs of defined dir by path.
*/

QStringList ADir::mGetSubdirs(QString inPath) {

	QDir oDir(inPath);
	return oDir.entryList(QDir::Dirs|QDir::NoDotAndDotDot);
}


// -----------
/*!
	\fn bool ADir::mRemoveRecursively(QString inPath)

	Remove directory recursively.
*/

bool ADir::mRemoveRecursively(QString inPath) {

	QDir oDir(inPath);

	if (!oDir.exists()) {
		return true;
	} else {
		oDir.removeRecursively();
		if (!oDir.exists()) {
			return true;
		}
	}

	return false;
}


