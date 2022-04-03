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

#ifndef AIOSAPPSTATE_H
#define AIOSAPPSTATE_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Global functions
void fInitializeDelegate(void);

// Class definitions
class AIOSAppState : public QObject {

	Q_OBJECT

	public:

        explicit AIOSAppState(QObject* parent = nullptr);
        virtual ~AIOSAppState(void);

        static AIOSAppState* mGetInstance(void);
        static void mDestroyInstance(void);
        void mApplicationDidEnterBackGround(void);
        void mApplicationDidEnterForeGround(void);
        void mApplicationDidBecomeActive(void);

	private:

        static AIOSAppState* pDelegate;
};

#endif // AIOSAPPSTATE_H
