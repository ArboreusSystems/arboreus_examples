// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 11:14:11
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKEND_H
#define ABACKEND_H

// System includes
#include <QObject>
#include <QEventLoop>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include <alogger.h>
#include <aapplication.h>

// Constants and definitions

// Namespace

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		QGuiApplication* pGuiApplication = nullptr;
		QQmlApplicationEngine* pQmlApplicationEngine = nullptr;
		QQmlContext* pRootContext = nullptr;

		QObject* pApplicationConfigObject = nullptr;
		ALogger* pLogger = nullptr;
		AApplication* pApplication = nullptr;

		static ABackend& mInstance();
		void mInit(
			QGuiApplication* inGuiApplication = nullptr,
			QQmlApplicationEngine* inQmlApplicationEngine = nullptr,
			QQmlContext* inRootContext = nullptr,
			QObject* inApplicationConfigObject = nullptr
		);

	signals:

		void sgInitiated(void);

	private:

		explicit ABackend(QObject* parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)

		void mInitLogger(void);
		void mInitApplication(void);
};

#endif // ABACKEND_H
