/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file classes/file.cpp
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 07/03/2019 at 21:10:17
 * */// --------------------------------------------------------------

// Class header
#include "customobject.h"


/* --------
 * @doc
 * @param
*/

CustomObject::CustomObject(QObject *parent)
: QObject (parent) {

	qDebug() << "CustomObject: created";
}


/* --------
 * @doc
 * @param
*/

CustomObject::~CustomObject() {

	qDebug() << "CustomObject: destroyed";
}


/* --------
 * @doc
 * @param
*/

QString CustomObject::text(void) {

	QString String = "Test string from CustomObject::text(void)";
	return String;
}


/* --------
 * @doc
 * @param
*/

QString CustomObject::composedText(QString incomeText) {

	QString String = "Test string from CustomObject::composedText(QString incomeText). Your text is: " + incomeText;
	return String;
}
