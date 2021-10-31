// ----------------------------------------------------------
/*!
	\class AStorage
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/07/2021 at 23:10:20
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "astorage.h"

// Forwarded classes
#include <abackend.h>


// -----------
/*!
	\fn

	Doc.
*/

AStorage::AStorage(QObject* parent) : AThreadTemplate<AStorageService>(new AStorageService, parent) {

	_A_DEBUG << "AStorage created";
}


// -----------
/*!
	\fn

	Doc.
*/

AStorage::~AStorage(void) {

	_A_DEBUG << "AStorage deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

void AStorage::mInit(void) {

	pBackend = &ABackend::mInstance();

	QObject::connect(
		this,&AStorage::sgInit,
		this->mService(),&AStorageService::slInit
	);
	QObject::connect(
		this->mService(),&AStorageService::sgInitiated,
		this,&AStorage::slInitiated
	);

	emit sgInit(pBackend->pProperties->mPathDataApplication());
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantList AStorage::mGetAllOrdered(QString inFieldname, _A_ENUM_DB_SORTING_DIRECTION inDirection) {

	QEventLoop oEventLoop;

	AThreadObjectControllerTemplate oController;
	ADBRequestAllOrdered oRequest(
		inFieldname,inDirection,this->mService()->mGetDB()
	);

	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oRequest,&ADBRequestAllOrdered::slRun
	);
	QObject::connect(
		&oRequest,&ADBRequestAllOrdered::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	oRequest.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	return oRequest.pResult;
}


// -----------
/*!
	\fn

	Doc.
*/

qlonglong AStorage::mAdd(QString inFirstName, QString inLastName, QString inPhoneNumber) {

	QEventLoop oEventLoop;

	AThreadObjectControllerTemplate oController;
	ADBRequestAdd oRequest(this->mService()->mGetDB());
	oRequest.pModel.FirstName = inFirstName;
	oRequest.pModel.LastName = inLastName;
	oRequest.pModel.PhoneNumber = inPhoneNumber;

	QObject::connect(
		&oController,&AThreadObjectControllerTemplate::sgRun,
		&oRequest,&ADBRequestAdd::slRun
	);
	QObject::connect(
		&oRequest,&ADBRequestAdd::sgFinished,
		&oEventLoop,&QEventLoop::quit
	);
	oRequest.moveToThread(this);

	emit oController.sgRun();
	oEventLoop.exec();

	emit sgDataUpdated();
	return qvariant_cast<qlonglong>(oRequest.pResult.at(0));
}


// -----------
/*!
	\fn

	Doc.
*/

void AStorage::slInitiated(void) {

	this->mAdd("Brenda","Khomchik","634543563465");
	this->mAdd("Kengard","Bjorns","987234523524");
	this->mAdd("Richard","Miller","315313541");
	this->mAdd("Harold","Morris","31543425645");
	this->mAdd("Richard","Miller","564654676456");
	this->mAdd("Regina","Gray","923231223465431221");
	this->mAdd("Kevin","Bowman","642534656");
	this->mAdd("Edna","Harrison","46225347563673");
	this->mAdd("Antonio","Young","654464633456");
	this->mAdd("Dean","Smith","6445625424");
	this->mAdd("Lawrence","Bell","5436345567");
	this->mAdd("Troy","Lloyd","5364653563546");
	this->mAdd("Robert","Thomas","6754735764326");
	this->mAdd("Joyce","Gray","65336456");
	this->mAdd("Nicholas","Roberts","43656386547");
	this->mAdd("Philip","Davis","4665436536346");
	this->mAdd("Patrick","Goodwin","43565666364");
	this->mAdd("Adam","Chapman","6434634645534");
	this->mAdd("Raymond","Washington","63464563465");
	this->mAdd("Betty","Green","23455442465346");
	this->mAdd("Joshua","Hines","3254657");
	this->mAdd("Paul","Gardner","4576231443");
	this->mAdd("Linda","Copeland","542345256");
	this->mAdd("Elaine","Smith","54343254374657");
	this->mAdd("Brian","Gonzales","1525432334554");
	this->mAdd("Renee","Green","243545452323");
	this->mAdd("Gary","Valdez","14337654798");
	this->mAdd("Larry","Porter","34176798867");
	this->mAdd("Elizabeth","Jones","4352543225");
	this->mAdd("Gregory","Lane","5424212576478");
	this->mAdd("Dorothy","Bennett","3234552555");
	this->mAdd("James","Martinez","67856755647567");
	this->mAdd("Michael","Zimmerman","3545235656453");
	this->mAdd("Rodney","Smith","3456787787867");
	this->mAdd("Becky","Woods","35435265767887655");
	this->mAdd("Greg","Clayton","454357687");
	this->mAdd("Carla","Gonzalez","56464777756");
	this->mAdd("Florence","Keller","34566563463");
	this->mAdd("David","Brown","6546653634565");
	this->mAdd("William","Ray","64365546789765343");
	this->mAdd("Kyle","Washington","456356656778745");
	this->mAdd("Kenneth","Brady","4374586765567");
	this->mAdd("Susan","Baker","5654734777");
	this->mAdd("Christopher","Henry","00758766675647456");
	this->mAdd("Sam","Riley","65445656578");
	this->mAdd("Patricia","Byrd","56365346445");
	this->mAdd("Peggy","Morgan","6544657884573");
	this->mAdd("Mary","Malone","3466875454657");
	this->mAdd("Deanna","Jenkins","457645674567");
	this->mAdd("Ray","Jackson","3456565346346");
	this->mAdd("Jennifer","Floyd","563767858");
	this->mAdd("Clayton","Collins","3563463466688");

	_A_DEBUG << "AStorage initiated";
	emit sgInitiated();
}
