#include <QCoreApplication>
#include <QObject>
#include <QPointer>
#include <QMap>
#include <QThread>

#include "aglobal.h"
#include "aloader.h"
#include "aobject1.h"
#include "aobject2.h"
#include "aobject3.h"


int main(int inCounter, char *inArguments[]) {

	QCoreApplication oApplication(inCounter,inArguments);

	aLOG << "MAIN: Thread ID ->" << QThread::currentThreadId();

	aObject1* oObject1 = new aObject1();
	QThread* oThread1 = new QThread();
	oObject1->moveToThread(oThread1);

	aObject2* oObject2 = new aObject2();
	QThread* oThread2 = new QThread();
	oObject2->moveToThread(oThread2);

	aObject3* oObject3 = new aObject3();
	QThread* oThread3 = new QThread();
	oObject3->moveToThread(oThread3);

	aLOG << "MAIN: Loading started";

	if (oObject1 && oObject2 && oObject3) {
		QObject::connect(
			oThread1,&QThread::started,
			[&oObject1,&oThread1](){
				oThread1->setPriority(QThread::Priority::LowPriority);
				oObject1->mSetup();
			}
		);
		QObject::connect(
			oObject1,&aObject1::sCreated,
			[&oThread2](){oThread2->start();}
		);
		QObject::connect(
			oThread2,&QThread::started,
			[&oObject2,&oThread2](){
				oThread2->setPriority(QThread::Priority::HighestPriority);
				oObject2->mSetup();
			}
		);
		QObject::connect(
			oObject2,&aObject2::sCreated,
			[&oThread3](){oThread3->start();}
		);
		QObject::connect(
			oThread3,&QThread::started,
			[&oObject3,&oThread3](){
				oThread3->setPriority(QThread::Priority::LowestPriority);
				oObject3->mSetup();
			}
		);
		QObject::connect(
			oObject3,&aObject3::sCreated,
			[&oObject1,&oObject2,&oObject3](){
				aLOG << oObject1->mTestString();
				aLOG << oObject2->mTestString();
				aLOG << oObject3->mTestString();
				aLOG << "MAIN: Loading finished";
			}
		);
		oThread1->start();
	}

	return oApplication.exec();
}
