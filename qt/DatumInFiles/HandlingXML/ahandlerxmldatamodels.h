// ----------------------------------------------------------
/*!
	\headerfile %{CN}
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/12/2019 at 20:31:30
	\endlist
*/
// ----------------------------------------------------------
#ifndef AHANDLERXMLDATAMODELS_H
#define AHANDLERXMLDATAMODELS_H

// System includes
#include <QDomDocument>

// Application includes

// Constants and defintions

struct AHandlerXMLReply {

	bool Status = false;
	QDomDocument DomDocument = QDomDocument();
};


#endif // AHANDLERXMLDATAMODELS_H
