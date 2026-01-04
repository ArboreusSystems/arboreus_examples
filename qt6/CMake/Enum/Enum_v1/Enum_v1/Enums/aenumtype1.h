// ----------------------------------------------------------
/*!
	\headerfile AEnumType1
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 04/01/2026 at 11:59:02
	\endlist
*/
// ----------------------------------------------------------
#ifndef AENUMTYPE1_H
#define AENUMTYPE1_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes

// Namesapces

// Constants and definitions

// Class definitions
class AEnumType1 : public QObject {

	Q_OBJECT

	public:

		explicit AEnumType1(QObject* parent = nullptr) {}
		virtual ~AEnumType1(void) {}

		enum Type1 {
			Zero = 0,
			One = 1,
			Two = 2,
			Three = 3
		};
		Q_ENUM(Type1)
};

#endif // AENUMTYPE1_H
