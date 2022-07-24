// ----------------------------------------------------------
/*!
	\class AApplication
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:33:24
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aapplication.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

AApplication::AApplication(QObject* parent) : AThreadTemplate<AApplicationService>(new AApplicationService, parent) {

	this->setPriority(QThread::Priority::LowestPriority);

	QObject::connect(
		this,&AApplication::sgInit,
		this->mService(),&AApplicationService::slInit
	);
	QObject::connect(
		this->mService(),&AApplicationService::sgInitiated,
		this,&AApplication::slInitiated
	);

	_A_DEBUG << "AApplication created";
}


// -----------
/*!
	\fn

	Doc.
*/

AApplication::~AApplication(void) {

	_A_DEBUG << "AApplication deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mInit(void) {

	pBackend = &ABackend::mInstance();
	pConfig = qobject_cast<AApplicationConfig*>(pBackend->pApplicationConfigObject);

#if defined(Q_OS_IOS)
	pDelegate = qobject_cast<AApplicationDelegate*>(
		new AApplicationIOSDelegate(this)
	);
#elif defined(Q_OS_ANDROID)
	pDelegate = qobject_cast<AApplicationDelegate*>(
		new AApplicationAndroidDelegate(this)
	);
#else
	pDelegate = new AApplicationDelegate(this);
#endif

	this->mInitStates();

	emit this->sgInit();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnQuit(void) {

	pConfig->AApplicationConfig_mOnQuit();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mOnLaunchFinished(void) {

	pConfig->AApplicationConfig_mOnLaunchFinished();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::slInitiated(void) {

	_A_DEBUG << "AApplication initiated";

	emit this->sgInitiated();
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mGetCurrentState(void) {

	return pCurrentState;
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::mInitStates(void) {

#if defined(Q_OS_IOS)
	QObject::connect(
		pDelegate,&AApplicationDelegate::sgOnStateChanged,
		this,&AApplication::slOnStateChanged
	);
#elif defined(Q_OS_ANDROID)
	QObject::connect(
		pBackend->pGuiApplication,&QGuiApplication::applicationStateChanged,
		this,&AApplication::slOnStateChanged
	);
#else
	QObject::connect(
		pBackend->pGuiApplication,&QGuiApplication::applicationStateChanged,
		this,&AApplication::slOnStateChanged
	);
#endif
}


// -----------
/*!
	\fn

	Doc.
*/

void AApplication::slOnStateChanged(Qt::ApplicationState inState) {

	switch (inState) {
		case Qt::ApplicationState::ApplicationSuspended:
			pCurrentState = _A_ENUM_APPLICATION_STATE::Suspended;
			pConfig->AApplicationConfig_mOnStateSuspended();
			break;
		case Qt::ApplicationState::ApplicationHidden:
			pCurrentState = _A_ENUM_APPLICATION_STATE::Hidden;
			pConfig->AApplicationConfig_mOnStateHidden();
			break;
		case Qt::ApplicationState::ApplicationInactive:
			pCurrentState = _A_ENUM_APPLICATION_STATE::Inactive;
			pConfig->AApplicationConfig_mOnStateInactive();
			break;
		case Qt::ApplicationState::ApplicationActive:
			pCurrentState = _A_ENUM_APPLICATION_STATE::Active;
			pConfig->AApplicationConfig_mOnStateActive();
			break;
		default:
			pCurrentState = _A_ENUM_APPLICATION_STATE::Undefined;
			pConfig->AApplicationConfig_mOnStateUndefined();
			break;
	}

	emit this->sgOnDidStateChanged(pCurrentState);
}
