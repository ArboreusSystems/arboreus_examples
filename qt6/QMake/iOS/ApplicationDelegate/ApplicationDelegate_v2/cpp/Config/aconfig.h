// ----------------------------------------------------------
/*!
	\headerfile AConfig
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/07/2022 at 14:32:16
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACONFIG_H
#define ACONFIG_H

// System includes
#include <QObject>

// Application includes
#include <aapplicationconfig.h>
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AConfig :
	public QObject,
	public AApplicationConfig {

	Q_OBJECT
	Q_INTERFACES(
		AApplicationConfig
	)

	public:

		explicit AConfig(QObject* parent = nullptr);
		virtual ~AConfig(void);

		// ------------------------------
		// AApplicationConfig

		void AApplicationConfig_mOnQuit(void);
		void AApplicationConfig_mOnLaunchFinished(void);

		void AApplicationConfig_mOnStateUndefined();
		void AApplicationConfig_mOnStateSuspended();
		void AApplicationConfig_mOnStateHidden();
		void AApplicationConfig_mOnStateInactive();
		void AApplicationConfig_mOnStateActive();
};

#endif // ACONFIG_H
