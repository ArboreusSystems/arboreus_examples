#include <iostream>

#include "aglobal.h"
#include "aqueue.h"

using namespace std;

int main() 	{

	ALOG << "Demo std::vector" << endl;

	AQueue<int>* oQueue = new AQueue<int>();
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPut(1111);
	ALOG << "Added: 1111" << endl;
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPut(2222);
	ALOG << "Added: 2222" << endl;
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPut(3333);
	ALOG << "Added: 3333" << endl;
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPut(4444);
	ALOG << "Added: 4444" << endl;
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;

	ALOG << "All elements in queue:" << endl;
	std::vector<int> oAllInQueue = oQueue->mGetAll();
	std::vector<int>::iterator oIterator = oAllInQueue.begin();
	for (oIterator; oIterator != oAllInQueue.end(); ++oIterator) {
		ALOG << "Element: " << *oIterator << endl;
	}

	if (!oQueue->mIsEmpty()) {
		ALOG << "Element from queue: " << oQueue->mGet() << endl;
		ALOG << "All elements in queue:" << endl;
		oAllInQueue = oQueue->mGetAll();
		oIterator = oAllInQueue.begin();
		for (oIterator; oIterator != oAllInQueue.end(); ++oIterator) {
			ALOG << "Element: " << *oIterator << endl;
		}
	} else {
		ALOG << "Queue empty" << endl;
	}

	if (!oQueue->mIsEmpty()) {
		ALOG << "Element from queue: " << oQueue->mGet() << endl;
		ALOG << "All elements in queue:" << endl;
		oAllInQueue = oQueue->mGetAll();
		oIterator = oAllInQueue.begin();
		for (oIterator; oIterator != oAllInQueue.end(); ++oIterator) {
			ALOG << "Element: " << *oIterator << endl;
		}
	} else {
		ALOG << "Queue empty" << endl;
	}

	if (!oQueue->mIsEmpty()) {
		ALOG << "Element from queue: " << oQueue->mGet() << endl;
		ALOG << "All elements in queue:" << endl;
		oAllInQueue = oQueue->mGetAll();
		oIterator = oAllInQueue.begin();
		for (oIterator; oIterator != oAllInQueue.end(); ++oIterator) {
			ALOG << "Element: " << *oIterator << endl;
		}
	} else {
		ALOG << "Queue empty" << endl;
	}

	if (!oQueue->mIsEmpty()) {
		ALOG << "Element from queue: " << oQueue->mGet() << endl;
		ALOG << "All elements in queue:" << endl;
		oAllInQueue = oQueue->mGetAll();
		oIterator = oAllInQueue.begin();
		for (oIterator; oIterator != oAllInQueue.end(); ++oIterator) {
			ALOG << "Element: " << *oIterator << endl;
		}
	} else {
		ALOG << "Queue empty" << endl;
	}

	if (!oQueue->mIsEmpty()) {
		ALOG << "Element from queue: " << oQueue->mGet() << endl;
		ALOG << "All elements in queue:" << endl;
		oAllInQueue = oQueue->mGetAll();
		oIterator = oAllInQueue.begin();
		for (oIterator; oIterator != oAllInQueue.end(); ++oIterator) {
			ALOG << "Element: " << *oIterator << endl;
		}
	} else {
		ALOG << "Queue empty" << endl;
	}

	return 0;
}
