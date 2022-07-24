// ----------------------------------------------------------
/*!
	\headerfile AApplicationDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/07/2022 at 14:45:54
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONDELEGATE_H
#define AAPPLICATIONDELEGATE_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AApplicationDelegate : public QObject {

	Q_OBJECT

	public:

		explicit AApplicationDelegate(QObject* parent = nullptr);
		virtual ~AApplicationDelegate(void);

		virtual void mOnQuit(void) = 0;
		virtual void mOnLaunchFinished(void) = 0;

	signals:

		void sgOnLaunch(void);
		void sgOnQuit(void);
		void sgOnStateChanged(Qt::ApplicationState inState);
};

#endif // AAPPLICATIONDELEGATE_H
