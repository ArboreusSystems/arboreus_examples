// ----------------------------------------------------------
/*!
	\headerfile Test
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 19:09:20
	\endlist
*/
// ----------------------------------------------------------

#ifndef TEST_H
#define TEST_H

#include <QObject>

// System includes
#include <QObject>

// Application includes

class Test : public QObject {

	Q_OBJECT

public:
	explicit Test(QObject *parent = nullptr);
signals:
public slots:
};

#endif // TEST_H