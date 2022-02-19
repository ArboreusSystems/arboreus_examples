#ifndef AWORKER_H
#define AWORKER_H

#include <QObject>
#include <QTimer>
#include "aglobal.h"


class AWorker : public QObject {

	Q_OBJECT

	public:

		explicit AWorker(QObject *inParent = nullptr);
		virtual ~AWorker(void);

	private:

		int pCounter;
		QTimer *pTimer;

	signals:

		void sgValueGanged(int inValue);
		void sgFinished(void);

	public slots:

		void slStartDemo(void);
		void slStopDemo(void);

	private slots:

		void slSetNext(void);
};

#endif // AWORKER_H
