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
#include <aapplicationdelegate.h>
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AApplicationIOSDelegate : public AApplicationDelegate {

	Q_OBJECT

	public:

		explicit AApplicationIOSDelegate(QObject* parent = nullptr);
		virtual ~AApplicationIOSDelegate(void);

		void mOnQuit(void) override;
		void mOnLaunchFinished(void) override;

		void mOnDidBecomeActive(void);
		void mOnWillTerminate(void);
		void mOnDidFinishLaunchingWithOptions(void);
		void mOnWillResignActive(void);
		void mOnDidEnterBackground(void);
		void mOnWillEnterForeground(void);

	private:

		ABackend* pBackend = nullptr;
};

#endif // AAPPLICATIONIOSDELEGATE_H
