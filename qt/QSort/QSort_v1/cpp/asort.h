// ----------------------------------------------------------
/*!
	\headerfile ASort
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 15/10/2021 at 20:41:15
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASORT_H
#define ASORT_H

// System includes
#include <QObject>
#include <algorithm>

// Application includes
#include <aloggerglobal.h>
#include <arandom.h>
#include <asortdatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ASort : public QObject {

	Q_OBJECT

	public:

		explicit ASort(QObject* parent = nullptr);
		virtual ~ASort(void);

		void mRun(
			int inIndex,
			_A_ENUMS_SORT_DIRECTION inDirection = _A_ENUMS_SORT_DIRECTION::Ascending
		);

	private:

		int pIndex = 0;
		_A_ENUMS_SORT_DIRECTION pDirection = _A_ENUMS_SORT_DIRECTION::Ascending;
		QList<QVariantList> pData = {};

		void mPrint(void);
};

#endif // ASORT_H
