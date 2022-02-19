// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/09/2020 at 17:35:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QObject>
#include <QGuiApplication>
#include <QScreen>

// Application includes
#include "alogger.h"
#include "adevice.h"

// Constants and definitions

// Namespace

// Class definitions
class AGlobal : public QObject {

	Q_OBJECT

	public:

		ADeviceType::Enum pDeviceType = ADeviceType::Enum::Undefined;

		static AGlobal& mInstance() {
			static AGlobal oInstance;
			return oInstance;
		}

	signals:

		void sgOrientationChanged(Qt::ScreenOrientation inOrientation);

	public slots:

		bool mIsLanscape(void);
		int mDeviceType(void);
		QVariantMap mDeviceSafeArea(void);

	private slots:

		void mOrientationChanged(Qt::ScreenOrientation inOrientation);

	private:

		QScreen* pScreen;

		explicit AGlobal(QObject *parent = nullptr);
		virtual ~AGlobal(void);
		Q_DISABLE_COPY(AGlobal)
};

#endif // AGLOBAL_H
