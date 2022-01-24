// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/01/2022 at 09:06:52
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
#include <aloggerglobal.h>
#include <asmtp.h>

// Constants and definitions

// Namespace

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		QGuiApplication* pApplication = nullptr;
		QQmlApplicationEngine* pQmlApplicationEngine = nullptr;
		QQmlContext* pRootContext = nullptr;

		ASMTP* pSMTP = nullptr;

		static ABackend& mInstance();
		void mInit(
			QGuiApplication* inApplication = nullptr,
			QQmlApplicationEngine* inQmlApplicationEngine = nullptr,
			QQmlContext* inRootContext = nullptr
		);

	signals:

		void sgInitiated(void);

	private:

		explicit ABackend(QObject* parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)

		void mInitSMTP(void);
};

#endif // ABACKEND_H
