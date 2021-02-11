// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/02/2021 at 18:04:02
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


class ALoggerMessageModel {

	public:

		uint64_t Time;
		const char* Actor;
		const char* Message;
		int Line;
		const char* File;
		const char* Function;

		ALoggerMessageModel() {}
		~ALoggerMessageModel() {}
};

#endif // ALOGGERDATAMODELS_H
