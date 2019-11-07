#include <QCoreApplication>
#include <QObject>
#include <QPointer>
#include <QMap>

#include "aglobal.h"
#include "aloader.h"
#include "aobject1.h"
#include "aobject2.h"
#include "aobject3.h"


int main(int inCounter, char *inArguments[]) {

	QCoreApplication oApplication(inCounter,inArguments);

	aObject1* oObject1 = new aObject1();
	aObject2* oObject2 = new aObject2();
	aObject3* oObject3 = new aObject3();

	aLOG << "MAIN: Loading started";

	if (oObject1 && oObject2 && oObject3) {
		QObject::connect(
			oObject1,SIGNAL(sCreated()),
			oObject2,SLOT(mSetup())
		);
		QObject::connect(
			oObject2,SIGNAL(sCreated()),
			oObject3,SLOT(mSetup())
		);
		oObject1->mSetup();
	}

	aLOG << oObject1->mTestString();
	aLOG << oObject2->mTestString();
	aLOG << oObject3->mTestString();

	return oApplication.exec();
}
