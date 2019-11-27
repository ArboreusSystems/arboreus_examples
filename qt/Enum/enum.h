// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/11/2019 at 10:03:09
	\endlist
*/
// ----------------------------------------------------------
#ifndef ENUM_H
#define ENUM_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions


struct AEnum1: public QObject {

	Q_OBJECT

	public:

		enum class List1: int {
			Value1_1,
			Value1_2,
			Value1_3
		}; Q_ENUM(List1)
};

struct AEnum2: public QObject {

	Q_OBJECT

	public:

		enum class List2: int {
			Value2_1,
			Value2_2,
			Value2_3
		}; Q_ENUM(List2)
};

#endif // ENUM_H
