// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 15:22:20
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATHREADTEMPLATE_H
#define ATHREADTEMPLATE_H

// System includes
#include <QThread>

// Application includes
#include <athreadservicetemplate.h>

// Constants and defintions

// Namespace

// Class definitions
template <typename TService>
class AThread : public QThread {

	public:

		explicit AThread(TService* inService, QObject* parent = nullptr): QThread(parent) {

			pService = inService;
			pService->moveToThread(this);

			this->start();
		}

		virtual ~AThread(void) {

			this->quit();
			this->wait();
		}

		TService* mService(void) const {

			return pService;
		}

		void mSuspend(void) {

			auto oService = qobject_cast<AThreadServiceTemplate*>(pService);
			if (oService != nullptr) {
				oService->mSuspend();
			}
		}

		void mResume(void) {

			auto oService = qobject_cast<AThreadServiceTemplate*>(pService);
			if (oService != nullptr) {
				oService->mResume();
			}
		}

	protected:

		void run(void) override {

			QThread::run();
			delete pService;
		}

	private:

		TService* pService = nullptr;
};


#endif // ATHREADTEMPLATE_H
