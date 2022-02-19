// ----------------------------------------------------------
/*!
	\headerfile OOPSingletoneCPP
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 05/09/2019 at 12:47:28
	\endlist
*/
// ----------------------------------------------------------

#ifndef OOPSINGLETONECPP_H
#define OOPSINGLETONECPP_H


// System includes

// Application includes
#include "aglobal.h"


class OOPSingletoneCPP {

	public:
		static OOPSingletoneCPP& Instance(void) {
			static OOPSingletoneCPP oSingletone;
			return oSingletone;
		}
		int pTestInt = 0;

	private:
		OOPSingletoneCPP(void);
		~OOPSingletoneCPP(void);
		OOPSingletoneCPP(OOPSingletoneCPP const&) = delete;
		OOPSingletoneCPP& operator=(OOPSingletoneCPP const&) = delete;
};

#endif // OOPSINGLETONECPP_H
