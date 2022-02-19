// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/05/2021 at 12:33:21
	\endlist
*/
// ----------------------------------------------------------
#ifndef ENUMEXAMPLE_H
#define ENUMEXAMPLE_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions

// Namespace
namespace ARB {

class EnumExample: public QObject {

	Q_OBJECT

	public:

		enum class Values: int {

			One = 1,
			Two = 2,
			Three = 3,
			Four = 4,
			Five = 5
		};
		Q_ENUM(Values)
};

}

#endif // ENUMEXAMPLE_H
