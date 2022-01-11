// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 11/01/2022 at 15:01:48
	\endlist
*/
// ----------------------------------------------------------
#ifndef AIMAPDATAMODELS_H
#define AIMAPDATAMODELS_H

// System includes

// Application includes

// Constants and defintions

// Namespace

class AIMAPProperties {

	public:

		const char* Tag = "NoTag";
		const char* Server = "NoServer";
		int Port = 0;
		const char* User = "NoUser";
		const char* Password = "NoPassword";

		explicit AIMAPProperties(void) {}
		virtual ~AIMAPProperties(void) {}
};

#endif // AIMAPDATAMODELS_H
