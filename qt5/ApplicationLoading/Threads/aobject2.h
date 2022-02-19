#ifndef AOBJECT2_H
#define AOBJECT2_H

#include <QObject>
#include <QTimer>
#include <QThread>

#include "aglobal.h"


class aObject2 : public QObject {

	Q_OBJECT

	public:

		explicit aObject2(QObject *parent = nullptr);
		virtual ~aObject2(void);

		QString mTestString(void);

	signals:

		void sCreated(void);

	public slots:

		void mSetup(void);

	private:

		QString* pTestString = new QString("Default value");
};

#endif // AOBJECT2_H
