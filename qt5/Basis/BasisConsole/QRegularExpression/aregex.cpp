// ----------------------------------------------------------
/*!
	\class aRegex
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/09/2019 at 19:01:43
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aregex.h"


// -----------
/*!
	\fn

	Doc.
*/

aRegex::aRegex(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

aRegex::~aRegex(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

void aRegex::mDoTest(void) {

	QRegularExpression *oPattern = new QRegularExpression();
	QString *oTestString;
	QRegularExpressionMatch oResult;

	oPattern->setPattern("^[1]{3}");
	oTestString = new QString("111");
	oResult = oPattern->match(oTestString);
	aLOG << oResult;

	oPattern->setPattern("^([1]{3} ){0,}$");
	oTestString = new QString("111 111 111 ");
	oResult = oPattern->match(oTestString);
	aLOG << oResult;
}
