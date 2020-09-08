// ----------------------------------------------------------
/*!
	\headerfile ATests
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/09/2020 at 11:04:34
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATESTS_H
#define ATESTS_H

// System includes
#include <QObject>
#include <QTest>

// Application includes
#include "atestcase1.h"
#include "atestcase2.h"

// Constants and definitions

// Namespace

// Class definitions
class ATests : public QObject {

	Q_OBJECT

	public:

		explicit ATests(QObject *parent = nullptr);
		virtual ~ATests(void);

		void mRun(int inCounter, char *inArguments[]);
};

#endif // ATESTS_H
