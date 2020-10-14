// ----------------------------------------------------------
/*!
	\headerfile AModule3
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 10:04:51
	\endlist
*/
// ----------------------------------------------------------

#ifndef AMODULE3_H
#define AMODULE3_H

// System includes

// Application includes
#include "../Templates/aobjecttemplate.h"

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class AModule3 : public AObjectTemplate {

	Q_OBJECT

	public:

		static AModule3& mInstance(void) {
			static AModule3 oInstance;
			return oInstance;
		}

	public:

		explicit AModule3(QObject *parent = nullptr);
		virtual ~AModule3(void);
		Q_DISABLE_COPY(AModule3)
};

} // namespace ARB

#endif // AMODULE3_H
