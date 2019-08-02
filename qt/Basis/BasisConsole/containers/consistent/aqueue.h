// ----------------------------------------------------------
/*!
	\headerfile aQueue
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:06:56
	\endlist
*/
// ----------------------------------------------------------

#ifndef AQUEUE_H
#define AQUEUE_H

// System includes
#include <QObject>
#include <QQueue>

// Application includes
#include "../../aglobal.h"


class aQueue : public QObject {

	Q_OBJECT

	public:
		explicit aQueue(QObject *parent = nullptr);
		virtual ~aQueue(void);
		void mDoTest(void);

};

#endif // AQUEUE_H
