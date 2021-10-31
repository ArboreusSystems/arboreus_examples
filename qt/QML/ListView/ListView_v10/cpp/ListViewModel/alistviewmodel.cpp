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

	this->mInitStructure();
	this->slDataUpdated();

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
	this->slDataUpdated();

	_A_DEBUG << "Sorted by:" << inFieldNumber;
}


// -----------
/*!
	\fn

	Doc.
*/

void AListViewModel::mSetDirection(_A_ENUM_DB_SORTING_DIRECTION inDirection) {

	pDirection = inDirection;
	this->slDataUpdated();

	_A_DEBUG << "Sorting direction changed onto:" << pDirection;
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

	QVariantList oOutput = {};
	for (int i = 0; i < pStructure.length(); i++) {
		oOutput.append(pStructure[i].mToVariantMap());
	}
	return oOutput;
}


// -----------
/*!
	\fn

	Doc.
*/

void AListViewModel::mInitStructure(void) {

	ADBFieldProperty oFieldID = {};
	oFieldID.Type = _A_ENUM_DB_DATATYPE::Integer;
	oFieldID.Name = "id";
	oFieldID.DisplayName = "ID";
	pStructure.append(oFieldID);

	ADBFieldProperty oFieldFirstName = {};
	oFieldFirstName.Type = _A_ENUM_DB_DATATYPE::Text;
	oFieldFirstName.Name = "first_name";
	oFieldFirstName.DisplayName = "First Name";
	pStructure.append(oFieldFirstName);

	ADBFieldProperty oFieldLastName = {};
	oFieldLastName.Type = _A_ENUM_DB_DATATYPE::Text;
	oFieldLastName.Name = "last_name";
	oFieldLastName.DisplayName = "Last Name";
	pStructure.append(oFieldLastName);

	ADBFieldProperty oFieldPhoneNumber = {};
	oFieldPhoneNumber.Type = _A_ENUM_DB_DATATYPE::Text;
	oFieldPhoneNumber.Name = "phone_number";
	oFieldPhoneNumber.DisplayName = "Phone Number";
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
	pCache = pBackend->pStorage->mGetAllOrdered(
		pStructure[pIndex].Name,
		pDirection
	);
	pRowCount = pCache.count();
	endResetModel();

	_A_DEBUG << "ATableViewModel slDataUpdated end";
}
