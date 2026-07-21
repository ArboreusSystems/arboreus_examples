// ----------------------------------------------------------
/*!
	\headerfile ASharingNative
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/07/2026 at 19:44:31
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASHARINGNATIVE_H
#define ASHARINGNATIVE_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class ASharingNative : public QObject {

	Q_OBJECT

	public:

		explicit ASharingNative(QObject *parent = nullptr);
		virtual ~ASharingNative(void);

		virtual void mShareText(const QString& inText);
};

#endif // ASHARINGNATIVE_H
