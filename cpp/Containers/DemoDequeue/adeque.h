// ----------------------------------------------------------
/*!
	\headerfile ADeque
    \title
    \brief Template file files/cppheader/file.h

    \list
    \li @notice Template file classes/file.h
    \li @copyright Arboreus (http://arboreus.systems)
    \li @author Alexandr Kirilov (http://alexandr.kirilov.me)
    \li @created 29/01/2020 at 15:06:07
    \endlist
*/
// ----------------------------------------------------------
#ifndef ADEQUEUE_H
#define ADEQUEUE_H

// System includes
#include <iostream>
#include <deque>

// Application includes
#include "aglobal.h"

// Constants and defintions


template <class Type>
class ADeque {

	public:

		ADeque(void);
		~ADeque(void);

		bool mIsEmpty(void);
		int mSize(void);
		void mPutToBegin(Type inElement);
		void mPutToEnd(Type inElement);
		Type mGet(void);
		std::deque<Type> mGetAll(void);

	private:

		std::deque<Type> pStorage;
};

// Class body
#include "adeque.hpp"

#endif // ADEQUEUE_H
