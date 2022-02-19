// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 29/09/2020 at 09:43:41
	\endlist
*/
// ----------------------------------------------------------
#ifndef ADEVICEDATAMODELS_H
#define ADEVICEDATAMODELS_H

// System includes
#include <QObject>
#include <QString>
#include <QVariantMap>

// Application includes

// Constants and defintions

// Namespace


struct ADeviceType {

	public:

		enum class Enum: int {

			Undefined = 0,
			Phone = 1,
			Tablet = 2,
			Desktop = 3
		};

		static QString mToString(ADeviceType::Enum inType) {

			QString oOutput;
			switch (inType) {
				case ADeviceType::Enum::Phone: oOutput = QString("Phone"); break;
				case ADeviceType::Enum::Tablet: oOutput = QString("Tablet"); break;
				case ADeviceType::Enum::Desktop: oOutput = QString("Desktop"); break;
				default: oOutput = QString("UndefinedADeviceType"); break;
			}
			return oOutput;
		}
};


struct ADeviceSafeArea {

	public:

		int pTop = 0;
		int pBottom = 0;
		int pLeft = 0;
		int pRight = 0;

		static QVariantMap mToVariantMap(ADeviceSafeArea inSafeArea) {

			QVariantMap oOutput = {};
			oOutput.insert("pTop",inSafeArea.pTop);
			oOutput.insert("pBottom",inSafeArea.pBottom);
			oOutput.insert("pLeft",inSafeArea.pLeft);
			oOutput.insert("pRight",inSafeArea.pRight);
			return oOutput;
		}
};


struct ADeviceStatusBarStyle {

	public:

		enum class Enum: int {

			Default = 0,
			Light = 1,
			Dark = 2
		};

		static QString mToString(ADeviceStatusBarStyle::Enum inStyle) {

			QString oOutput;
			switch (inStyle) {
				case ADeviceStatusBarStyle::Enum::Default: oOutput = QString("Default"); break;
				case ADeviceStatusBarStyle::Enum::Dark: oOutput = QString("Dark"); break;
				case ADeviceStatusBarStyle::Enum::Light: oOutput = QString("Light"); break;
				default: oOutput = QString("UndefinedADeviceStatusBarStyle"); break;
			}
			return oOutput;
		}
};

#endif // ADEVICEDATAMODELS_H
