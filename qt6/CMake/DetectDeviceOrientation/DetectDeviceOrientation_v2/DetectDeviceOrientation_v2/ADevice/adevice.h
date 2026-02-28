// ----------------------------------------------------------
/*!
	\headerfile ADevice
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/02/2026 at 08:00:12
	\endlist
*/
// ----------------------------------------------------------
#ifndef ADEVICE_H
#define ADEVICE_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class ADevice : public QObject {

	Q_OBJECT

	public:

		explicit ADevice(QObject* parent = nullptr);
		virtual ~ADevice(void);

	signals:

		void sgOrientationChanged(Qt::ScreenOrientation inOrientation);

	private slots:

		void slOnOrientationChaged(Qt::ScreenOrientation inOrientation);

	private:

		QScreen* pScreen = nullptr;
};

#endif // ADEVICE_H
