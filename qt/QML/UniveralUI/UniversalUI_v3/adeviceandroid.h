// ----------------------------------------------------------
/*!
	\headerfile ADeviceAndroid
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 13:25:05
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADEVICEANDROID_H
#define ADEVICEANDROID_H

// System includes
#include <QObject>

// Application includes
#include "alogger.h"
#include "adevicedatamodels.h"

// Constants and definitions

// Namespace

// Class definitions
class ADeviceAndroid : public QObject {

	Q_OBJECT

	public:

		explicit ADeviceAndroid(QObject *parent = nullptr);
		virtual ~ADeviceAndroid(void);

		static ADeviceType::Enum mType(void);
		static ADeviceSafeArea mSafeArea(void);
		static void mSetStatusBarStyle(ADeviceStatusBarStyle::Enum inStyle);
};

#endif // ADEVICEANDROID_H
