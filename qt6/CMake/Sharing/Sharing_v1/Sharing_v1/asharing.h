// ----------------------------------------------------------
/*!
	\headerfile ASharing
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2026 at 19:22:45
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASHARING_H
#define ASHARING_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>
#include <asharingnative.h>

// IOS includes
#if defined(Q_OS_IOS)
#include <asharingnativeios.h>
#endif

// Android includes
#if defined(Q_OS_ANDROID)
#include <asharingnativeandroid.h>
#endif

// Namesapces

// Constants and definitions

// Class definitions
class ASharing : public QObject {

	Q_OBJECT

	public:

		explicit ASharing(QObject* parent = nullptr);
		virtual ~ASharing(void);

		Q_INVOKABLE void mShareText(const QString& inText);

	private:

		ASharingNative* pNative = nullptr;
};

#endif // ASHARING_H
