// ----------------------------------------------------------
/*!
    \class ARustWrapper
    \title
    \brief Template file classes/cpp/file.cpp

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 07/01/2024 at 17:35:47
    \endlist
*/
// ----------------------------------------------------------

// Class header
#include "arustwrapper.h"


// -----------
/*!
    \fn

    Doc.
*/

ARustWrapper::ARustWrapper(QObject* parent) : QObject(parent) {

	qDebug() << "ARustWrapper created";
}


// -----------
/*!
	\fn

	Doc.
*/

ARustWrapper::~ARustWrapper(void) {

	qDebug() << "ARustWrapper deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString ARustWrapper::mStringFromLibrary(void) {

	QString oOutput = QString::fromUtf8(fStringFromRustLibrary());
	return oOutput;
}
