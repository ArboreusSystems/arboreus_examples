// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 21:06:00
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKEND_H
#define ABACKEND_H

// System includes
#include <QObject>

// Application includes
#include "../Logger/alogger.h"
#include "../Modules/amodule1.h"
#include "../Modules/amodule2.h"
#include "../Modules/amodule3.h"

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		ALogger* pLogger = nullptr;
		AModule1* pModule1 = nullptr;
		AModule2* pModule2 = nullptr;
		AModule3* pModule3 = nullptr;

		static ABackend& mInstance(void) {
			static ABackend oInstance;
			return oInstance;
		}

		void mSetup(void);
		void mTestMethod(void);

	private:

		explicit ABackend(QObject *parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)
};

} // namespace ARB

#endif // ABACKEND_H
