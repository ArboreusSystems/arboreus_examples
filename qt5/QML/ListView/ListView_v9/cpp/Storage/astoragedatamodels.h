// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/08/2021 at 20:44:13
	\endlist
*/
// ----------------------------------------------------------
#ifndef ASTORAGEDATAMODELS_H
#define ASTORAGEDATAMODELS_H

// System includes
#include <QString>

// Application includes

// Constants and defintions

// Namespace

class ADBRequestAddModel {

	public:

		QString FirstName = "NoFirstName";
		QString LastName = "NoLastName";
		QString PhoneNumber = "NoPhoneNumber";

		explicit ADBRequestAddModel(void) {}
		virtual ~ADBRequestAddModel(void) {}
};

#endif // ASTORAGEDATAMODELS_H
