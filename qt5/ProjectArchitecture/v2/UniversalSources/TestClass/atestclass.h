// ----------------------------------------------------------
/*!
	\headerfile aTestClass
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 03/09/2019 at 20:39:59
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATESTCLASS_H
#define ATESTCLASS_H


// System includes
#include <QObject>

// Application includes

class aTestClass : public QObject {

	Q_OBJECT

	public:
		explicit aTestClass(QObject *parent = nullptr);
		virtual ~aTestClass(void);
		int mTest(void);
};

#endif // ATESTCLASS_H
