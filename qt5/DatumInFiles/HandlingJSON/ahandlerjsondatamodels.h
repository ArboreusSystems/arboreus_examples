// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/12/2019 at 20:03:08
	\endlist
*/
// ----------------------------------------------------------
#ifndef AHANDLERJSONDATAMODELS_H
#define AHANDLERJSONDATAMODELS_H

// System includes
#include <QJsonDocument>

// Application includes

// Constants and defintions

struct AHandlerJSONReply {

	bool Status = false;
	QJsonDocument JsonDocument = QJsonDocument();
};


#endif // AHANDLERJSONDATAMODELS_H
