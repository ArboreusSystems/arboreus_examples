// ----------------------------------------------------------
/*!
	\headerfile ATestCase1
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/09/2020 at 18:03:55
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATESTCASE1_H
#define ATESTCASE1_H

// System includes
#include <QObject>
#include <QTest>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ATestCase1 : public QObject {

	Q_OBJECT

	public:

		explicit ATestCase1(void);
		virtual ~ATestCase1(void);

	private slots:

		void mTestAction1(void);
		void mTestAction2(void);
		void mTestAction3(void);

};

#endif // ATESTCASE1_H
