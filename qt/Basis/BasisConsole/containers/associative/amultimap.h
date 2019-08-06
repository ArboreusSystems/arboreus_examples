// ----------------------------------------------------------
/*!
	\headerfile aMultiMap
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 02/08/2019 at 17:17:21
	\endlist
*/
// ----------------------------------------------------------

#ifndef AMULTIMAP_H
#define AMULTIMAP_H

// System includes
#include <QObject>
#include <QMultiMap>

// Application includes
#include "../../aglobal.h"
#include "handlers/ahandlermain.h"


class aMultiMap : public QObject {

	Q_OBJECT

	public:
		explicit aMultiMap(QObject *parent = nullptr);
		virtual ~aMultiMap(void);
		void mDoTest(void);
};

#endif // AMULTIMAP_H
