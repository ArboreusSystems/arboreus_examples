// ----------------------------------------------------------
/*!
	\headerfile ADevice
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/06/2026 at 08:35:46
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADEVICE_H
#define ADEVICE_H

// Precompiled includes
#include <adevice_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class ADevice : public QObject {

	Q_OBJECT

	public:

		explicit ADevice(QObject* parent = nullptr);
		virtual ~ADevice(void);

	signals:

		void sgKeyboardVisibleChanged(bool inVisible);
		void sgKeyboardRectangleChanged(void);

	private slots:

		void slInputMethodVisibleChanged(void);
		void slInputMethodKeyboardRectangleChanged(void);
};

#endif // ADEVICE_H
