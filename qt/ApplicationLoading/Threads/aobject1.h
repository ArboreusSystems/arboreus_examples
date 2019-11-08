#ifndef AOBJECT1_H
#define AOBJECT1_H

#include <QObject>
#include <QTimer>
#include <QThread>

#include "aglobal.h"


class aObject1 : public QObject {

	Q_OBJECT

	public:

		explicit aObject1(QObject *parent = nullptr);
		virtual ~aObject1(void);

		QString mTestString(void);

	signals:

		void sCreated(void);

	public slots:

		void mSetup(void);

	private:

		QString* pTestString = new QString("Default value");
};

#endif // AOBJECT1_H
