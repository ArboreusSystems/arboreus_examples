#ifndef AOBJECT3_H
#define AOBJECT3_H

#include <QObject>
#include <QTimer>
#include <QThread>

#include "aglobal.h"


class aObject3 : public QObject {

	Q_OBJECT

	public:

		explicit aObject3(QObject *parent = nullptr);
		virtual ~aObject3(void);

		QString mTestString(void);

	signals:

		void sCreated(void);

	public slots:

		void mSetup(void);

	private:

		QString* pTestString = new QString("Default value");
};

#endif // AOBJECT3_H
