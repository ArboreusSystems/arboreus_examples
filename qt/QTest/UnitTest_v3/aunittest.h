// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/09/2020 at 18:10:11
	\endlist
*/
// ----------------------------------------------------------
#ifndef AUNITTEST_H
#define AUNITTEST_H

// System includes
#include <QTest>

// Application includes
#include "atestcase1.h"
#include "atestcase2.h"

// Constants and defintions

// Namespace


int mUnitTests(int inCounter, char *inArguments[]) {

	QTest::qExec(new ATestCase1,inCounter,inArguments);
	QTest::qExec(new ATestCase2,inCounter,inArguments);
	return 0;
}

#endif // AUNITTEST_H
