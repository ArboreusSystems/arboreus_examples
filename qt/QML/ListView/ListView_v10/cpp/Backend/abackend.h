// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/07/2021 at 22:40:11
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
#include <aloggerglobal.h>
#include <astorage.h>
#include <aproperties.h>
#include <alistviewmodel.h>
#include <adbdatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ABackend : public QObject {

	Q_OBJECT

	public:

		AProperties* pProperties = nullptr;
		AStorage* pStorage = nullptr;

		QGuiApplication* pGuiApplication = nullptr;
		QQmlApplicationEngine* pEngine = nullptr;
		QQmlContext* pRootContext = nullptr;

		static ABackend& mInstance(void);
		void mInit(
			QGuiApplication* inGuiApplication = nullptr,
			QQmlApplicationEngine* inEngine = nullptr,
			QQmlContext* inRootContext = nullptr
		);

	signals:

		void sgInitiated(void);

	private:

		explicit ABackend(QObject *parent = nullptr);
		virtual ~ABackend(void);
		Q_DISABLE_COPY(ABackend)

		void mInitQMLTypes(void);
		void mInitProperties(void);
		void mInitStorage(void);

	private slots:

		void slInitiated(void);
};

#endif // ABACKEND_H
