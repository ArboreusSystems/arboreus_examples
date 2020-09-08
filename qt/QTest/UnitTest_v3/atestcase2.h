// ----------------------------------------------------------
/*!
	\headerfile ATestCase2
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/09/2020 at 18:17:17
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATESTCASE2_H
#define ATESTCASE2_H

// System includes
#include <QObject>
#include <QTest>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ATestCase2 : public QObject {

	Q_OBJECT

	public:

		explicit ATestCase2(void);
		virtual ~ATestCase2(void);

	private slots:

		void mTestAction1(void);
		void mTestAction2(void);
		void mTestAction3(void);
		void mTestAction4(void);
		void mTestAction5(void);
};

#endif // ATESTCASE2_H
