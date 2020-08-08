// ----------------------------------------------------------
/*!
	\class ASafeAreaInsets
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/08/2020 at 16:04:22
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asafeareainsets.h"


// -----------
/*!
	\fn

	Doc.
*/

ASafeAreaInsets::ASafeAreaInsets(QObject *parent) : QObject(parent) {

}


// -----------
/*!
	\fn

	Doc.
*/

ASafeAreaInsets::~ASafeAreaInsets(void) {

}


// -----------
/*!
	\fn

	Doc.
*/

QVariantMap ASafeAreaInsets::mToVariantMap(void) {

	QVariantMap oOutput = {};

	oOutput.insert("pTop",pTop);
	oOutput.insert("pBottom",pBottom);
	oOutput.insert("pLeft",pLeft);
	oOutput.insert("pRight",pRight);

	return oOutput;
}
