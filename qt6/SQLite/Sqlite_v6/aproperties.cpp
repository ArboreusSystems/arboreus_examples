// ----------------------------------------------------------
/*!
	\class AProperties
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 15:25:32
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aproperties.h"


// -----------
/*!
	\fn

	Doc.
*/

AProperties::AProperties(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

AProperties::~AProperties(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

QString AProperties::mGetTestDbPath(void) {

	QString oPath = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation) + "/Sqlite_v4/Database";
	ADir::mEnsure(oPath);
	return oPath;
}
