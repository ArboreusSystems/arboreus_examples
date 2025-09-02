/* -------------------------------------------------------------------
 *  @doc
 *  @notice Template file tablemodel.h
 *
 *  @copyright Arboreus (http://arboreus.systems)
 *  @author Alexandr Kirilov (http://alexandr.kirilov.me)
 *  @created 02/09/2025 at 10:30:57
 * */// --------------------------------------------------------------

// Class headers
#include <aobjcswiftlibrary.h>

// Class private headers
#include <aobjcswiftlibrary_private.h>


// -----------
/*!
	\fn

	Doc.
*/

AObjCSwiftLibrary::AObjCSwiftLibrary(QObject* parent) : QObject(parent) {

	pWrapper = new AObjectiveCWrapper(this);

	_A_DEBUG << "AObjectiveCLibrary created";
}


// -----------
/*!
	\fn

	Doc.
*/

AObjCSwiftLibrary::~AObjCSwiftLibrary(void) {

	_A_DEBUG << "AObjectiveCLibrary deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QString AObjCSwiftLibrary::mGetText(void) {

	return pWrapper->mGetText();
}


// -----------
/*!
	\fn

	Doc.
*/

QString AObjCSwiftLibrary::mGetSwiftText(void) {

	return pWrapper->mGetSwiftText();
}

