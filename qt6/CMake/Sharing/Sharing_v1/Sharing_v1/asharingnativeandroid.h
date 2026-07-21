// ----------------------------------------------------------
/*!
	\headerfile ASharingNativeAndroid
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2026 at 19:38:55
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASHARINGNATIVEANDROID_H
#define ASHARINGNATIVEANDROID_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <asharingnative.h>

// Namesapces

// Constants and definitions

// Class definitions
class ASharingNativeAndroid : public ASharingNative {

	Q_OBJECT

	public:

		explicit ASharingNativeAndroid(QObject* parent = nullptr);
		virtual ~ASharingNativeAndroid(void);

		void mShareText(const QString& inText) override;
};

#endif // ASHARINGNATIVEANDROID_H
