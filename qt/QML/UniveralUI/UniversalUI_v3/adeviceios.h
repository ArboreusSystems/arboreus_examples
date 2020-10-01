// ----------------------------------------------------------
/*!
	\headerfile ADeviceIOS
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 09:32:37
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADEVICEIOS_H
#define ADEVICEIOS_H

// System includes
#include <QObject>

// Application includes
#include "adevicedatamodels.h"

// Constants and definitions

// Namespace

// Class definitions
class ADeviceIOS : public QObject {

	Q_OBJECT

	public:

		explicit ADeviceIOS(QObject *parent = nullptr);
		virtual ~ADeviceIOS(void);

		static ADeviceType::Enum mType(void);
		static ADeviceSafeArea mSafeArea(void);
		static void mSetStatusBarStyle(ADeviceStatusBarStyle::Enum inStyle);
};

#endif // ADEVICEIOS_H
