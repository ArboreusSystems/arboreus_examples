#ifndef ATIMER_H
#define ATIMER_H

#include <QObject>
#include <QTimer>
#include <QThread>
#include "aglobal.h"


class ATimer : public QObject {

	Q_OBJECT

	public:

		explicit ATimer(QObject *parent = nullptr);
		virtual ~ATimer(void);

	public slots:

		void slStartTimer(void);
		void slStopTimer(void);

	private:

		QTimer *pTimer;
		int pCounter;
		int pInterval;

	private slots:

		void slAction(void);
};

#endif // ATIMER_H
