// ----------------------------------------------------------
/*!
	\headerfile LibTwo
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2022 at 21:29:30
	\endlist
*/
// ----------------------------------------------------------

#ifndef LIBTWO_H
#define LIBTWO_H

// System includes
#include <QObject>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class LibTwo : public QObject {

	Q_OBJECT

	public:

		explicit LibTwo(QObject* parent = nullptr);
		virtual ~LibTwo(void);
};

#endif // LIBTWO_H
