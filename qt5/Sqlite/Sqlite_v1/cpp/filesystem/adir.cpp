// ----------------------------------------------------------
/*!
	\class aDir
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/09/2019 at 12:38:40
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

aDir::aDir(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aDir::~aDir(void) {}


// -----------
/*!
	\fn

	Doc.
*/

bool aDir::mEnsure(QString inPath) {

	QDir oConfigLocation(inPath);
	if (!oConfigLocation.exists()) {
		return oConfigLocation.mkpath(inPath);
	};
	return true;
}
