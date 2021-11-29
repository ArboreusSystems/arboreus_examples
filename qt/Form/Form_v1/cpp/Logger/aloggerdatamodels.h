// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 18:32:31
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERDATAMODELS_H
#define ALOGGERDATAMODELS_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions

// Namespace

class ALoggerMessageModel {

	public:

		unsigned long long Time = 0;
		QtMsgType Type = QtMsgType::QtDebugMsg;
		const char* Author = "EMP";
		const char* ThreadID = "NoType";
		const char* Message = "NoMessage";
		const char* Function = "NoFunction";
		const char* File = "NoFile";
		int Line = 0;

		explicit ALoggerMessageModel(void) {}
		virtual ~ALoggerMessageModel(void) {}
};

#endif // ALOGGERDATAMODELS_H
