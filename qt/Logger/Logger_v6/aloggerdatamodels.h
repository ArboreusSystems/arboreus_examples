// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2021 at 18:31:19
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERDATAMODELS_H
#define ALOGGERDATAMODELS_H

// System includes
#include <QObject>
#include <QDebug>
#include <QString>

// Application includes

// Constants and defintions

// Namespace

struct ALoggerMessage {

	uint64_t Time = 0;
	const char* Type = "DBG";
	const char* Actor = "SYS";
	const char* Message = "no_message";
	int Line = 0;
	const char* File = "no_file";
	const char* Function = "no_function";
};

Q_DECLARE_METATYPE(ALoggerMessage)


#endif // ALOGGERDATAMODELS_H
