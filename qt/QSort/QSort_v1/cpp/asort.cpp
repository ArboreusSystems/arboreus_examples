// ----------------------------------------------------------
/*!
	\class ASort
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 15/10/2021 at 20:41:15
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "asort.h"


// -----------
/*!
	\fn

	Doc.
*/

ASort::ASort(QObject *parent) : QObject(parent) {

	QVariantList oData00 = {};
	oData00.append(0); oData00.append("Robert"); oData00.append("Tyler");
	oData00.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData00);

	QVariantList oData01 = {};
	oData01.append(1); oData01.append("Daniel"); oData01.append("Perry");
	oData01.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData01);

	QVariantList oData02 = {};
	oData02.append(2); oData02.append("David"); oData02.append("Carter");
	oData02.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData02);

	QVariantList oData03 = {};
	oData03.append(3); oData03.append("Lisa"); oData03.append("Riley");
	oData03.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData03);

	QVariantList oData04 = {};
	oData04.append(4); oData04.append("Phyllis"); oData04.append("Lamb");
	oData04.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData04);

	QVariantList oData05 = {};
	oData05.append(5); oData05.append("Pamela"); oData05.append("Wagner");
	oData05.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData05);

	QVariantList oData06 = {};
	oData06.append(6); oData06.append("Joel"); oData06.append("Fields");
	oData06.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData06);

	QVariantList oData07 = {};
	oData07.append(7); oData07.append("Carolyn"); oData07.append("Johnson");
	oData07.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData07);

	QVariantList oData08 = {};
	oData08.append(8); oData08.append("Helen"); oData08.append("Lane");
	oData08.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData08);

	QVariantList oData09 = {};
	oData09.append(9); oData09.append("Joshua"); oData09.append("Rogers");
	oData09.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData09);

	QVariantList oData10 = {};
	oData10.append(10); oData10.append("Ruby"); oData10.append("Johnson");
	oData10.append(ARandom::mNumberFromRange(0,100));
	pData.append(oData10);

	_A_DEBUG << "ASort created";
}


// -----------
/*!
	\fn

	Doc.
*/

ASort::~ASort(void) {

	_A_DEBUG << "ASort deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASort::mRun(int inIndex,_A_ENUMS_SORT_DIRECTION inDirection) {

	pIndex = inIndex;
	pDirection = inDirection;

	if (this->pIndex < (pData[0].length() - 1)) {

		std::sort(pData.begin(),pData.end(),[this](
			QVariantList lFirst,QVariantList lSecond
		){
			bool oOutput = false;
			if (this->pDirection == _A_ENUMS_SORT_DIRECTION::Ascending) {
				oOutput = lFirst[this->pIndex] < lSecond[this->pIndex];
			} else {
				oOutput = lFirst[this->pIndex] > lSecond[this->pIndex];
			}
			return oOutput;
		});

		this->mPrint();

	} else {
		_A_WARNING << "The index is out of range";
	}

	_A_DEBUG << "Sort procedure for" << inIndex << "finished";
}


// -----------
/*!
	\fn

	Doc.
*/

void ASort::mPrint(void) {

	QList<QVariantList>::iterator oDataIterator;
	for (oDataIterator = pData.begin(); oDataIterator != pData.end(); ++oDataIterator) {
		QList<QVariant>* oRow = &*oDataIterator;
		_A_DEBUG \
			<< "Index:" << oRow->at(0).toInt() \
			<< "First Name:" << oRow->at(1).toString() \
			<< "Last Name:" << oRow->at(2).toString();
	}
}

