// ----------------------------------------------------------
/*!
	\headerfile ASqlService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 12:01:06
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASQLSERVICE_H
#define ASQLSERVICE_H

// System includes

// Application includes
#include <asqltemplate.h>

// Constants and definitions

// Namespace

// Class definitions
class ASqlService : public ASqlTemplate {

	Q_OBJECT

	public:

		explicit ASqlService(QObject *parent = nullptr);
		virtual ~ASqlService(void);
};

#endif // ASQLSERVICE_H
