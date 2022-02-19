// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/01/2022 at 12:59:14
	\endlist
*/
// ----------------------------------------------------------
#ifndef APOP3DATAMODELS_H
#define APOP3DATAMODELS_H

// System includes

// Application includes

// Constants and defintions

// Namespace

class APOP3Properties {

	public:

		const char* Server = "NoServer";
		int Port = 0;
		const char* User = "NoUser";
		const char* Password = "NoPassword";

		explicit APOP3Properties(void) {}
		virtual ~APOP3Properties(void) {}
};


#endif // APOP3DATAMODELS_H
