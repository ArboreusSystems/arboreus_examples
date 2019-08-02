// ----------------------------------------------------------
/*!
	\headerfile aHash
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:20:35
	\endlist
*/
// ----------------------------------------------------------

#ifndef AHASH_H
#define AHASH_H

// System includes
#include <QObject>
#include <QHash>

// Application includes
#include "../../aglobal.h"


class aHash : public QObject {

	Q_OBJECT

	public:
		explicit aHash(QObject *parent = nullptr);
		virtual ~aHash(void);
		void mDoTest(void);
};

#endif // AHASH_H
