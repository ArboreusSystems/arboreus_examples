// ----------------------------------------------------------
/*!
	\headerfile ADevice
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/05/2021 at 17:40:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADEVICE_H
#define ADEVICE_H

// System includes
#include <QObject>

// Application includes
#include <adevicedatamodels.h>

// iOS includes
#ifdef Q_OS_IOS
#include "adeviceios.h"
#endif

// Android includes
#ifdef Q_OS_ANDROID
#include "adeviceandroid.h"
#endif

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class ADevice : public QObject {

	Q_OBJECT

	public:

		explicit ADevice(QObject* parent = nullptr);
		virtual ~ADevice(void);

		void mInit(void);
		void mDefinePermissionCamera(void);
		void mDefinePermissionMicrophone(void);

	public slots:

		ADeviceEnums::PermissionCamera mPermissionCamera(void);
		ADeviceEnums::PermissionMicrophone mPermissionMicrophone(void);

	private:

		ABackend* pBackend = nullptr;
		ADeviceEnums::PermissionCamera pPermissionCamera = ADeviceEnums::PermissionCamera::Error;
		ADeviceEnums::PermissionMicrophone pPermissionMicrophone = ADeviceEnums::PermissionMicrophone::Error;
};

#endif // ADEVICE_H
