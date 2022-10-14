// ----------------------------------------------------------
/*!
	\headerfile LibOne
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2022 at 12:38:04
	\endlist
*/
// ----------------------------------------------------------

#ifndef LIBONE_H
#define LIBONE_H

// System includes

// Precompiled headers
#include <libonepch.h>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class LibOne : public QObject {

	Q_OBJECT

	public:

		explicit LibOne(QObject* parent = nullptr);
		virtual ~LibOne(void);
};

#endif // LIBONE_H
