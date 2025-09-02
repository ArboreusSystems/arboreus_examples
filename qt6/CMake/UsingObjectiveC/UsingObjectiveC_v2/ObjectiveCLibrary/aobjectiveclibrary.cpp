/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 02/09/2025 at 10:30:57
 * */// --------------------------------------------------------------

// Class headers
#include <aobjectiveclibrary.h>

// Class private headers
#include <aobjectiveclibrary_private.h>


// -----------
/*!
	\fn

	Doc.
*/

AObjectiveCLibrary::AObjectiveCLibrary(QObject* parent) : QObject(parent) {

	pWrapper = new AObjectiveCWrapper(this);

	_A_DEBUG << "AObjectiveCLibrary created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjectiveCLibrary::~AObjectiveCLibrary(void) {

	_A_DEBUG << "AObjectiveCLibrary deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AObjectiveCLibrary::mGetText(void) {

	return pWrapper->mGetText();
}

