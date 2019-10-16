#ifndef ATIMERCONTROLLER_H
#define ATIMERCONTROLLER_H

#include <QObject>
#include <QThread>
#include "aglobal.h"


class ATimerController : public QObject {

	Q_OBJECT

	public:

		explicit ATimerController(QObject *parent = nullptr);
		virtual ~ATimerController(void);
		void mStartTimer(void);
		void mStopTimer(void);

	signals:

		void sgStartTimer(void);
		void sgStopTimer(void);
};

#endif // ATIMERCONTROLLER_H
