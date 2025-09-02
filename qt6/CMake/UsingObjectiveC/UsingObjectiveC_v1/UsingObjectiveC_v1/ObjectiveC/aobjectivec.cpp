// ----------------------------------------------------------
/*!
    \class AObjectiveC
    \title
    \brief Template file classes/cpp/file.cpp

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 14/10/2022 at 23:29:26
    \endlist
*/
// ----------------------------------------------------------

// Class header
#include "aobjectivec.h"


// -----------
/*!
    \fn

    Doc.
*/

AObjectiveC::AObjectiveC(QObject* parent) : QObject(parent) {

	fObjectiveCNative_Init();

	_A_DEBUG << "AObjectiveC created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectiveC::~AObjectiveC(void) {


	fObjectiveCNative_Delete();

	_A_DEBUG << "AObjectiveC deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AObjectiveC::mTestString(void) {

	return fObjectiveCNative_TestString();
}

