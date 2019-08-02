// ----------------------------------------------------------
/*!
	\headerfile aSignals
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 01/08/2019 at 18:00:47
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASIGNALS_H
#define ASIGNALS_H

// System includes
#include <QObject>
#include <QRandomGenerator>

// Application includes
#include "aglobal.h"

class aSignals : public QObject {

	Q_OBJECT

	public:
		explicit aSignals(QObject *parent = nullptr);
		virtual ~aSignals(void);
		void mDoTest(void);

	signals:
		void mDoSignal(quint32,int);
};

#endif // ASIGNALS_H
