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
#include <aapplicationdelegate.h>

// Constants and definitions

// Namespace

// Class definitions
class AApplicationAndroidDelegate : public AApplicationDelegate {

	Q_OBJECT

	public:

		explicit AApplicationAndroidDelegate(QObject* parent = nullptr);
		virtual ~AApplicationAndroidDelegate(void);

		void mOnQuit(void) override;
		void mOnLaunchFinished(void) override;
};

#endif // AAPPLICATIONANDROIDDELEGATE_H
