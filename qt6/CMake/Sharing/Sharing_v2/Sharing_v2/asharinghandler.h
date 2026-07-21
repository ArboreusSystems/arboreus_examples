// ----------------------------------------------------------
/*!
	\headerfile ASharingHandler
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 20/07/2026 at 22:09:41
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASHARINGHANDLER_H
#define ASHARINGHANDLER_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Class definitions
class ASharingHandler : public QObject {

	Q_OBJECT

	public:

		explicit ASharingHandler(QObject* parent = nullptr);
		virtual ~ASharingHandler(void) override;

		static void mReceivePendingText(void);

	signals:

		void sgTextReceived(const QString &text);

	private:

		static ASharingHandler* pInstance;

		static QString mTakeSharedText(void);
};

#endif // ASHARINGHANDLER_H
