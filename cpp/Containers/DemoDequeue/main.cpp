#include <iostream>

#include "aglobal.h"
#include "adeque.h"

using namespace std;

int main() {

	ALOG << "Demo: std::deque " << endl;

	ADeque<int>* oQueue = new ADeque<int>();
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPutToEnd(1111);
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPutToEnd(2222);
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPutToBegin(3333);
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPutToEnd(4444);
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPutToBegin(5555);
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPutToEnd(6666),
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPutToBegin(7777);
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;
	oQueue->mPutToEnd(8888);
	ALOG << "Size: " << oQueue->mSize() << " IsEmpty: " << oQueue->mIsEmpty() << endl;

	ALOG << "All elements in queue:" << endl;
	std::deque<int> oAllInQueue = oQueue->mGetAll();
	std::deque<int>::iterator oIterator = oAllInQueue.begin();
	for (; oIterator != oAllInQueue.end(); ++oIterator) {
		ALOG << "Element: " << *oIterator << endl;
	}

	if (!oQueue->mIsEmpty()) {
		ALOG << "Element from queue: " << oQueue->mGet() << endl;
		ALOG << "All elements in queue:" << endl;
		oAllInQueue = oQueue->mGetAll();
		oIterator = oAllInQueue.begin();
		for (; oIterator != oAllInQueue.end(); ++oIterator) {
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
		for (; oIterator != oAllInQueue.end(); ++oIterator) {
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
		for (; oIterator != oAllInQueue.end(); ++oIterator) {
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
		for (; oIterator != oAllInQueue.end(); ++oIterator) {
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
		for (; oIterator != oAllInQueue.end(); ++oIterator) {
			ALOG << "Element: " << *oIterator << endl;
		}
	} else {
		ALOG << "Queue empty" << endl;
	}

	return 0;
}
