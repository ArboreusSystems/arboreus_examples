// ----------------------------------------------------------
/*!
	\headerfile aStack
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:04:13
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASTACK_H
#define ASTACK_H

// System includes
#include <QObject>
#include <QStack>

// Application includes
#include "../../aglobal.h"


class aStack : public QObject {

	Q_OBJECT

	public:
		explicit aStack(QObject *parent = nullptr);
		virtual ~aStack(void);
		void mDoTest(void);
};

#endif // ASTACK_H
