// ----------------------------------------------------------
/*!
	\headerfile aSet
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:11:59
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASET_H
#define ASET_H

// System includes
#include <QObject>
#include <QSet>
#include <QVector>

// Application includes
#include "../../aglobal.h"
#include "handlers/ahandlermain.h"


class aSet : public QObject {

	Q_OBJECT

	public:
		explicit aSet(QObject *parent = nullptr);
		virtual ~aSet(void);
		void mDoTest(void);
};

#endif // ASET_H
