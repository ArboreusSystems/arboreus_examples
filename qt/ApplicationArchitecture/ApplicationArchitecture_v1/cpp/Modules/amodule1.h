// ----------------------------------------------------------
/*!
	\headerfile AModule1
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 09:25:21
	\endlist
*/
// ----------------------------------------------------------

#ifndef AMODULE1_H
#define AMODULE1_H

// System includes

// Application includes
#include "../Templates/aobjecttemplate.h"

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class AModule1 : public AObjectTemplate {

	Q_OBJECT

	public:

		explicit AModule1(QObject *parent = nullptr);
		virtual ~AModule1(void);

		void mTestMethod(void);
};

} // namespace ARB

#endif // AMODULE1_H
