// ----------------------------------------------------------
/*!
	\headerfile AModule2
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 09:32:53
	\endlist
*/
// ----------------------------------------------------------

#ifndef AMODULE2_H
#define AMODULE2_H

// System includes

// Application includes
#include "../Templates/aobjecttemplate.h"
#include "amodule4.h"

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class AModule2 : public AObjectTemplate {

	Q_OBJECT

	public:

		static AModule2& mInstance(void) {
			static AModule2 oInstance;
			return oInstance;
		}

		void mTestMethod(void);
		void mDelete(void);

	private:

		AModule4* pModule4 = nullptr;

		explicit AModule2(QObject *parent = nullptr);
		virtual ~AModule2(void);
		Q_DISABLE_COPY(AModule2)
};

} // namespace ARB

#endif // AMODULE2_H
