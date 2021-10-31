// ----------------------------------------------------------
/*!
	\class ATableViewModel
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/07/2021 at 18:40:44
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "alistviewmodel.h"


// -----------
/*!
	\fn

	Doc.
*/

AListViewModel::AListViewModel(QObject* parent) : QAbstractListModel(parent) {

	pBackend = &ABackend::mInstance();

	QObject::connect(
		pBackend->pStorage,&AStorage::sgDataUpdated,
		this,&AListViewModel::slDataUpdated
	);

	pRoleNames = {{ARow,"ARow"}};
	pCache = pBackend->pStorage->mGetAll();
	pRowCount = pCache.count();

	this->mInitStructure();

	_A_DEBUG << "ATableViewModel created";
}


// -----------
/*!
	\fn

	Doc.
*/

AListViewModel::~AListViewModel(void) {

	_A_DEBUG << "ATableViewModel deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QHash<int, QByteArray> AListViewModel::roleNames() const {

	_A_DEBUG << "ATableViewModel roleNames";

	return pRoleNames;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariant AListViewModel::data(const QModelIndex& index, int role) const {

	Q_UNUSED(role);

	if (!index.isValid()) return QVariant();

	int oIndexRow = index.row();
	return pCache[oIndexRow];
}


// -----------
/*!
	\fn

	Doc.
*/

int AListViewModel::rowCount(const QModelIndex& parent) const {

	return pRowCount;
}


// -----------
/*!
	\fn

	Doc.
*/

qlonglong AListViewModel::mAdd(QString inFirstName, QString inLastName, QString inPhoneNumber) {

	_A_DEBUG << "ATableViewModel add";
	return pBackend->pStorage->mAdd(inFirstName,inLastName,inPhoneNumber);
}


// -----------
/*!
	\fn

	Doc.
*/

void AListViewModel::mSort(int inFieldNumber) {

	pIndex = inFieldNumber;

	beginResetModel();

	std::sort(pCache.begin(),pCache.end(),[this](
		QVariant lFirst,QVariant lSecond
	){
		return qvariant_cast<QVariantList>(lFirst)[this->pIndex] < qvariant_cast<QVariantList>(lSecond)[this->pIndex];
	});

	endResetModel();
	_A_DEBUG << "Sorted by:" << inFieldNumber;
}


// -----------
/*!
	\fn

	Doc.
*/

void AListViewModel::mSetDirection(_A_ENUM_DB_SORTING_DIRECTION inDirection) {

	pDirection = inDirection;
	_A_DEBUG << "Sorting direction changed, current direction:" << pDirection;
}


// -----------
/*!
	\fn

	Doc.
*/

_A_ENUM_DB_SORTING_DIRECTION AListViewModel::mGetDirection(void) {

	return pDirection;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariantList AListViewModel::mStructure(void) {

	return pStructure;
}


// -----------
/*!
	\fn

	Doc.
*/

void AListViewModel::mInitStructure(void) {

	QVariantMap oFieldID = {};
	oFieldID.insert("Type",QVariant::fromValue(_A_ENUM_DB_DATATYPE::Integer));
	oFieldID.insert("Name","id");
	oFieldID.insert("DisplayName","ID");
	pStructure.append(oFieldID);

	QVariantMap oFieldFirstName = {};
	oFieldFirstName.insert("Type",QVariant::fromValue(_A_ENUM_DB_DATATYPE::Text));
	oFieldFirstName.insert("Name","first_name");
	oFieldFirstName.insert("DisplayName","First Name");
	pStructure.append(oFieldFirstName);

	QVariantMap oFieldLastName = {};
	oFieldLastName.insert("Type",QVariant::fromValue(_A_ENUM_DB_DATATYPE::Text));
	oFieldLastName.insert("Name","last_name");
	oFieldLastName.insert("DisplayName","Last Name");
	pStructure.append(oFieldLastName);

	QVariantMap oFieldPhoneNumber = {};
	oFieldPhoneNumber.insert("Type",QVariant::fromValue(_A_ENUM_DB_DATATYPE::Text));
	oFieldPhoneNumber.insert("Name","phone_number");
	oFieldPhoneNumber.insert("DisplayName","Phone Number");
	pStructure.append(oFieldPhoneNumber);
}


// -----------
/*!
	\fn

	Doc.
*/

void AListViewModel::slDataUpdated(void) {

	_A_DEBUG << "ATableViewModel slDataUpdated begin";

	beginResetModel();
	pCache = pBackend->pStorage->mGetAll();
	pRowCount = pCache.count();
	endResetModel();

	_A_DEBUG << "ATableViewModel slDataUpdated end";
}
