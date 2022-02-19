// ----------------------------------------------------------
/*!
	\headerfile AService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 12:28:35
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASERVICE_H
#define ASERVICE_H

// System includes
#include <QObject>
#include <QMutex>
#include <QWaitCondition>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class AService : public QObject {

	Q_OBJECT

	public:

		explicit AService(QObject *parent = nullptr);
		virtual ~AService(void);

		void mResume(void);
		void mSuspend(void);

	private slots:

		void slSuspend(void);

	private:

		QMutex pMutex;
		QWaitCondition pWaitCondition;
};

#endif // ASERVICE_H
