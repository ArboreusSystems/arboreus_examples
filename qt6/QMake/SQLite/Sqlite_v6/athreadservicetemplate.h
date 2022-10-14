// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/03/2021 at 14:53:53
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATHREADSERVICETEMPLATE_H
#define ATHREADSERVICETEMPLATE_H

// System includes
#include <QObject>
#include <QMutex>
#include <QWaitCondition>

// Application includes

// Constants and defintions

// Namespace

// Class definitions
class AThreadServiceTemplate : public QObject {

	Q_OBJECT

	public:

		explicit AThreadServiceTemplate(QObject *parent = nullptr): QObject(parent) {

			pMutex.lock();
		}

		virtual ~AThreadServiceTemplate(void){

			pWaitCondition.wakeAll();
			pMutex.unlock();
		}

		void mResume(void){

			pWaitCondition.wakeAll();
		}

		void mSuspend(void) {

			QMetaObject::invokeMethod(this,&AThreadServiceTemplate::slSuspend);
			pMutex.lock();
			pMutex.unlock();
		}

	private slots:

		void slSuspend(void) {

			pWaitCondition.wait(&pMutex);
		}

	private:

		QMutex pMutex;
		QWaitCondition pWaitCondition;
};

#endif // ATHREADSERVICETEMPLATE_H
