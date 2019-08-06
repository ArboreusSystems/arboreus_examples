// ----------------------------------------------------------
/*!
	\class aSet
	\title
	\brief Template file classes/cpp/file.cpp

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:11:59
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aset.h"


// -----------
/*!
	\fn

	Doc.
*/

aSet::aSet(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

aSet::~aSet(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void aSet::mDoTest(void) {

	QSet<QString> oSet1; oSet1 << "1" << "2" << "3" << "4";
	QSet<QString> oSet2; oSet2 << "3" << "4" << "5" << "6";
	QSet<QString> oResult;

	oResult = oSet1;
	aLOG << "Unite:" << oResult.unite(oSet2);
	oResult = oSet1;
	aLOG << "Set1 - Set2:" << oResult.subtract(oSet2);
	oResult = oSet2;
	aLOG << "Set2 - Set1:" << oResult.subtract(oSet1);
	oResult = oSet1;
	aLOG << "Intersect:" << oResult.intersect(oSet2).toList();
	oResult = oSet1;
	aLOG << "Intersects:" << oResult.intersects(oSet2);
}
