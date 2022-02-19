// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 13:39:08
	\endlist
*/
// ----------------------------------------------------------

#ifndef ABACKEND_H
#define ABACKEND_H

// System includes
#include <QObject>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

// Application includes
#include <athreadtemplate.h>
#include <alogger.h>
#include <aproperties.h>

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		QGuiApplication* pGuiApplication = nullptr;
		QQmlApplicationEngine* pEngine = nullptr;
		QQmlContext* pRootContext = nullptr;

		AThreadTemplate* pThreadLowest = nullptr;
		AThreadTemplate* pThreadLow = nullptr;
		AThreadTemplate* pThreadNormal = nullptr;
		AThreadTemplate* pThreadHigh = nullptr;
		AThreadTemplate* pThreadHighest = nullptr;

		ALogger* pLogger = nullptr;
		AProperties* pProperties = nullptr;

		static ABackend& mInstance(void);
		void mInit(void);

	private:

		explicit ABackend(QObject *parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)

		void mInitThreads(void);
		void mInitLogger(void);
		void mDeleteThreads(void);
};

} // namespace ARB

#endif // ABACKEND_H
