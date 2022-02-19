// ----------------------------------------------------------
/*!
	\headerfile AThread
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/03/2021 at 08:25:00
	\endlist
*/
// ----------------------------------------------------------

#ifndef ATHREAD_H
#define ATHREAD_H

// System includes
#include <QThread>

// Application includes
#include <aloggerservice.h>

// Constants and definitions

// Namespace

// Class definitions
template <typename TService>
class AThread : public QThread {

	public:

		explicit AThread(
			QThread::Priority inPriority,
			TService* inService,
			QObject* parent = nullptr
		): QThread(parent) {

			pService = inService;
			pService->moveToThread(this);

			this->setPriority(inPriority);
			this->start();

			ALOG << "AThread created";
		}

		virtual ~AThread(void) {

			this->quit();
			this->wait();

			ALOG << "AThread deleted";
		}

		TService* mService(void) const {

			return pService;
		}

		void mSuspend(void) {

			auto oService = qobject_cast<AService*>(pService);
			if (oService != nullptr) {
				oService->mSuspend();
			}
		}

		void mResume(void) {

			auto oService = qobject_cast<AService*>(pService);
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

#endif // ATHREAD_H
