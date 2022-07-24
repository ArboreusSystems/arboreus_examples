// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/07/2022 at 15:31:51
	\endlist
*/
// ----------------------------------------------------------
#ifndef AAPPLICATIONCONFIG_H
#define AAPPLICATIONCONFIG_H

// System includes

// Application includes

// Constants and defintions

// Namespace

class AApplicationConfig {

	public:

		virtual void AApplicationConfig_mOnQuit(void) = 0;
		virtual void AApplicationConfig_mOnLaunchFinished(void) = 0;

		virtual void AApplicationConfig_mOnStateUndefined(void) = 0;
		virtual void AApplicationConfig_mOnStateSuspended(void) = 0;
		virtual void AApplicationConfig_mOnStateHidden(void) = 0;
		virtual void AApplicationConfig_mOnStateInactive(void) = 0;
		virtual void AApplicationConfig_mOnStateActive(void) = 0;
};

Q_DECLARE_INTERFACE(AApplicationConfig,"Arboreus.AApplicationConfig/1.0")

#endif // AAPPLICATIONCONFIG_H
