// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 13:41:59
	\endlist
*/
// ----------------------------------------------------------
#ifndef AAPPLICATIONDELEGATEINTERFACE_H
#define AAPPLICATIONDELEGATEINTERFACE_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions

// Namespace


class AApplicationDelegateInterface {

	public:

		virtual void mOnDidBecomeActive(void) = 0;
		virtual void mOnWillTerminate(void) = 0;
		virtual void mOnDidFinishLaunchingWithOptions(void) = 0;
		virtual void mOnWillResignActive(void) = 0;
		virtual void mOnDidEnterBackground(void) = 0;
		virtual void mOnWillEnterForeground(void) = 0;
};

Q_DECLARE_INTERFACE(AApplicationDelegateInterface,"AApplicationDelegateInterface/1.0")

#endif // AAPPLICATIONDELEGATEINTERFACE_H
