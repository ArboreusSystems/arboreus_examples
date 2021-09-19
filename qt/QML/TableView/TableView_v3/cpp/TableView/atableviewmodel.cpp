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
#include "atableviewmodel.h"


// -----------
/*!
	\fn

	Doc.
*/

ATableViewModel::ATableViewModel(QObject* parent) : QAbstractListModel(parent) {

	pBackend = &ABackend::mInstance();

	QObject::connect(
		pBackend->pStorage,&AStorage::sgDataUpdated,
		this,&ATableViewModel::slDataUpdated
	);

	pRoleNames = {{ARow,"ARow"}};
	pCache = pBackend->pStorage->mGetAll();
	pRowCount = pCache.count();

	_A_DEBUG << "ATableViewModel created";
}


// -----------
/*!
	\fn

	Doc.
*/

ATableViewModel::~ATableViewModel(void) {

	_A_DEBUG << "ATableViewModel deleted";
}


// -----------
/*!
	\fn

	Doc.
*/

QHash<int, QByteArray> ATableViewModel::roleNames() const {

	_A_DEBUG << "ATableViewModel roleNames";

	return pRoleNames;
}


// -----------
/*!
	\fn

	Doc.
*/

QVariant ATableViewModel::data(const QModelIndex& index, int role) const {

	Q_UNUSED(role);

	if (!index.isValid()) return QVariant();

	int oIndexRow = index.row();
	_A_DEBUG << "ATableViewModel data for index:" << oIndexRow;
	return pCache[oIndexRow];
}


// -----------
/*!
	\fn

	Doc.
*/

int ATableViewModel::rowCount(const QModelIndex& parent) const {

	_A_DEBUG << "ATableViewModel rowCount for index:" << parent.row();

	return pRowCount;
}


// -----------
/*!
	\fn

	Doc.
*/

void ATableViewModel::mAdd(QString inColor,QString inText) {

	pBackend->pStorage->mAdd(inColor,inText);

	_A_DEBUG << "ATableViewModel add";
}


// -----------
/*!
	\fn

	Doc.
*/
void ATableViewModel::slDataUpdated(void) {

	_A_DEBUG << "ATableViewModel slDataUpdated begin";

	beginResetModel();
	pCache = pBackend->pStorage->mGetAll();
	pRowCount = pCache.count();
	endResetModel();

	_A_DEBUG << "ATableViewModel slDataUpdated end";
}
