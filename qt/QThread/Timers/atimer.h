#ifndef ATIMER_H
#define ATIMER_H

#include <QThread>
#include <QTimer>
#include "aglobal.h"


class ATimer : public QThread {

	Q_OBJECT

	public:

		explicit ATimer(
			QThread::Priority inPriority = QThread::LowestPriority,
			QObject *inParent = nullptr
		);
		virtual ~ATimer(void);
		void run(void);

	signals:

		void sgStartTimer(void);
		void sgStopTimer(void);

	private:

		QThread::Priority pPriority;
		QTimer *pTimer;
		int pCounter;
		int pInterval;

	public slots:

		void slAction(void);
		void slStartTimer(void);
		void slStopTimer(void);
};

#endif // ATIMER_H
