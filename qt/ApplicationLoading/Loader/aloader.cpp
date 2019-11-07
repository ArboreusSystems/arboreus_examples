#include "aloader.h"

aLoader::aLoader(
	aObject1* inObject1,
	aObject2* inObject2,
	aObject3* inObject3,
	QObject* inParent
) : QObject(inParent) {

	pObject1 = inObject1;
	pObject2 = inObject2;
	pObject3 = inObject3;

	QObject::connect(
		pObject1,SIGNAL(sCreated()),
		this,SLOT(mCreatedObject1())
	);
	QObject::connect(
		pObject2,SIGNAL(sCreated()),
		this,SLOT(mCreatedObject2())
	);
	QObject::connect(
		pObject3,SIGNAL(sCreated()),
		this,SLOT(mCreatedObject3())
	);

	QObject::connect(
		this,SIGNAL(sAllPrepeared()),
		this,SLOT(mAllPrepeared())
	);
	QObject::connect(
		this,SIGNAL(sAllCreated()),
		this,SLOT(mAllCreated())
	);

	emit sAllPrepeared();
}

aLoader::~aLoader(void) {

	aLOG << "Loader: deleted";
}

void aLoader::mCreatedObject1(void) {

	aLOG << "Loader: creating Object1 finished";
	pObject2->mSetup();
}

void aLoader::mCreatedObject2(void) {

	aLOG << "Loader: creating Object2 finished";
	pObject3->mSetup();
}

void aLoader::mCreatedObject3(void) {

	aLOG << "Loader: creating Object3 finished";
	emit sAllCreated();
}

void aLoader::mAllPrepeared(void) {

	aLOG << "Loader: all prepeared";
	pObject1->mSetup();
}

void aLoader::mAllCreated(void) {

	aLOG << "Loader: created";
}
