#ifndef APRINTER_H
#define APRINTER_H

#include <QObject>
#include "aglobal.h"
#include <QDateTime>
#include <QDebug>
#include <QThread>


class APrinter : public QObject {

	Q_OBJECT

	public:

		explicit APrinter(QObject *parent = nullptr);
		virtual ~APrinter(void);

	public slots:

		void slPrint(int inValue);
};

#endif // APRINTER_H
