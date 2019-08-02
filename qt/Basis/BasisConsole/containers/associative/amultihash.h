// ----------------------------------------------------------
/*!
	\headerfile aMultiHash
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:24:14
	\endlist
*/
// ----------------------------------------------------------

#ifndef AMULTIHASH_H
#define AMULTIHASH_H

// System includes
#include <QObject>
#include <QMultiHash>

// Application includes
#include "../../aglobal.h"


class aMultiHash : public QObject {

	Q_OBJECT

	public:
		explicit aMultiHash(QObject *parent = nullptr);
		virtual ~aMultiHash(void);
		void mDoTest(void);
};

#endif // AMULTIHASH_H
