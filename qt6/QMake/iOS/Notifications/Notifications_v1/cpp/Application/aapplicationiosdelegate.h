// ----------------------------------------------------------
/*!
	\headerfile AApplicationIOSDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 13:42:47
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONIOSDELEGATE_H
#define AAPPLICATIONIOSDELEGATE_H

// System includes
#include <QObject>

// Application includes
#include <aapplicationglobal.h>
#include <aapplicationdelegateinterface.h>
#include <aloggerglobal.h>
#include <anotificationsglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AApplicationIOSDelegate :
	public QObject,
	public AApplicationDelegateInterface {

	Q_OBJECT
	Q_INTERFACES(
		AApplicationDelegateInterface
	)

	public:

		explicit AApplicationIOSDelegate(QObject* parent = nullptr);
		virtual ~AApplicationIOSDelegate(void);

		void mOnDidBecomeActive(void);
		void mOnWillTerminate(void);
		void mOnDidFinishLaunchingWithOptions(void);
		void mOnWillResignActive(void);
		void mOnDidEnterBackground(void);
		void mOnWillEnterForeground(void);
};

#endif // AAPPLICATIONIOSDELEGATE_H
