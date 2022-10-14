// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 24/07/2022 at 14:38:51
	\endlist
*/
// ----------------------------------------------------------
#ifndef AAPPLICATIONDATAMODELS_H
#define AAPPLICATIONDATAMODELS_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions
#define _A_ENUM_APPLICATION_STATE AEnumsApplicationState::ApplicationState

// Namespace

class AEnumsApplicationState: public QObject {

	Q_OBJECT

	public:

		enum class ApplicationState: int {

			Undefined,
			Suspended,
			Hidden,
			Inactive,
			Active
		};
		Q_ENUM(ApplicationState)
};

#endif // AAPPLICATIONDATAMODELS_H
