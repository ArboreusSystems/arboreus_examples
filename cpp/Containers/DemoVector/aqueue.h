// ----------------------------------------------------------
/*!
	\headerfile AQueue
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/01/2020 at 20:40:23
	\endlist
*/
// ----------------------------------------------------------
#ifndef AQUEUE_H
#define AQUEUE_H

// System includes
#include <iostream>
#include <vector>

// Application includes
#include "aglobal.h"

// Constants and defintions


template <class Type>
class AQueue {

	public:

		AQueue(void);
		~AQueue(void);

		bool mIsEmpty(void);
		int mSize(void);
		void mPut(Type inElement);
		Type mGet(void);
		std::vector<Type> mGetAll(void);

	private:

		std::vector<Type> pStorage;
};

// Class body
#include "aqueue.hpp"

#endif // AQUEUE_H
