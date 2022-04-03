// ----------------------------------------------------------
/*!
	\headerfile IOSAppState
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/04/2022 at 08:29:57
	\endlist
*/
// ----------------------------------------------------------

#ifndef IOSAPPSTATE_H
#define IOSAPPSTATE_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Global functions
void InitializeDelegate(void);

// Class definitions
class IOSAppState : public QObject {

	Q_OBJECT

	public:

		explicit IOSAppState(QObject* parent = nullptr);
		virtual ~IOSAppState(void);

		static IOSAppState* getInstance(void);
		static void destroyInstance(void);
		void applicationDidEnterBackGround(void);
		void applicationDidEnterForeGround(void);
		void applicationDidBecomeActive(void);

	private:

		static IOSAppState* m_delegate;
};

#endif // IOSAPPSTATE_H
