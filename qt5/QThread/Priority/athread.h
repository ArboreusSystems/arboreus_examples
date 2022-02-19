#ifndef ATHREAD_H
#define ATHREAD_H

#include <QThread>
#include "aglobal.h"


class AThread : public QThread {

	public:

		explicit AThread(void);
		virtual ~AThread(void) override;
		void run() override;
};

#endif // ATHREAD_H
