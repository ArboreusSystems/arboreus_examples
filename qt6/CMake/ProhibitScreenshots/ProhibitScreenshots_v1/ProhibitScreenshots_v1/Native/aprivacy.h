// ----------------------------------------------------------
/*!
	\headerfile APrivacy
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/09/2026 at 15:01:00
	\endlist
*/
// ----------------------------------------------------------
#ifndef APRIVACY_H
#define APRIVACY_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Namesapces

// Constants and definitions

// Global functions
extern "C" void fAPrivacy_Init();
extern "C" void fAPrivacy_SetAction(bool inAction);

// Class definitions
class APrivacy : public QObject {

	Q_OBJECT
	Q_PROPERTY(bool mIsScreenRecording READ mIsScreenRecording NOTIFY sgScreenRecordingChanged)

	public:

		explicit APrivacy(QObject* parent = nullptr);
		virtual ~APrivacy(void);
		Q_DISABLE_COPY(APrivacy)

		static APrivacy* mInstance(void);

		void mInit(void);
		void mSetAction(bool inAction);
		bool mIsScreenRecording(void) const;
		void mScreenshotTakenHandler(void);
		void mScreenRecordingHandler(bool isCaptured);

	signals:

		void sgScreenshotTaken(void);
		void sgScreenRecordingChanged(bool isCaptured);

	private:

		bool pIsScreenRecording = false;
};

#endif // APRIVACY_H
