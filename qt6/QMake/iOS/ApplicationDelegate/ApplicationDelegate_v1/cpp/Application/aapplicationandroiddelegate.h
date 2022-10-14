// ----------------------------------------------------------
/*!
	\headerfile AApplicationAndroidDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 13:43:20
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONANDROIDDELEGATE_H
#define AAPPLICATIONANDROIDDELEGATE_H

// System includes
#include <QObject>

// Application includes
#include <aapplicationdelegateinterface.h>
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AApplicationAndroidDelegate :
	public QObject,
	public AApplicationDelegateInterface {

	Q_OBJECT
	Q_INTERFACES(
		AApplicationDelegateInterface
	)

	public:

		explicit AApplicationAndroidDelegate(QObject *parent = nullptr);
		virtual ~AApplicationAndroidDelegate(void);

		void mOnDidBecomeActive(void);
		void mOnWillTerminate(void);
		void mOnDidFinishLaunchingWithOptions(void);
		void mOnWillResignActive(void);
		void mOnDidEnterBackground(void);
		void mOnWillEnterForeground(void);
};

#endif // AAPPLICATIONANDROIDDELEGATE_H
