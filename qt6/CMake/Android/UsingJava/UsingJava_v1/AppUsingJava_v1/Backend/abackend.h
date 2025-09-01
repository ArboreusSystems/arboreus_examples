// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/08/2025 at 23:06:20
	\endlist
*/
// ----------------------------------------------------------
#ifndef ABACKEND_H
#define ABACKEND_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <aloggerglobal.h>
#include <JavaWrapper/ajavawrapper.h>

// Namesapces

// Constants and definitions


// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

#ifdef Q_OS_ANDROID
		AJavaWrapper* pJavaWrapper = nullptr;
#endif

		static ABackend& mInstance(void);
		void mInit(
			QGuiApplication* inGuiApplication = nullptr,
			QQmlApplicationEngine* inEngine = nullptr,
			QQmlContext* inRootContext = nullptr
		);

	private:

		QGuiApplication* pGuiApplication = nullptr;
		QQmlApplicationEngine* pEngine = nullptr;
		QQmlContext* pRootContext = nullptr;

		explicit ABackend(QObject* parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)
};

#endif // ABACKEND_H
