// ----------------------------------------------------------
/*!
	\headerfile ADevice
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 09:31:52
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADEVICE_H
#define ADEVICE_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"
#include "adevicedatamodels.h"

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

// Class definitions
class ADevice : public QObject {

	Q_OBJECT

	public:

		explicit ADevice(QObject *parent = nullptr);
		virtual ~ADevice(void);

		static ADeviceType::Enum mType(void);
		static ADeviceSafeArea mSafeArea(void);
		static void mSetStatusBarStyle(ADeviceStatusBarStyle::Enum inStyle);
};

#endif // ADEVICE_H
