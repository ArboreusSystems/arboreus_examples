// ----------------------------------------------------------
/*!
	\headerfile aSlots
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 01/08/2019 at 18:02:17
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASLOTS_H
#define ASLOTS_H

// System includes
#include <QObject>

// Application includes
#include "aglobal.h"


class aSlots : public QObject {

	Q_OBJECT

	public:
		explicit aSlots(QObject *parent = nullptr);
		virtual ~aSlots(void);

	private slots:
		void mDoSlot(quint32 inNumber, int inIteration);
};

#endif // ASLOTS_H
