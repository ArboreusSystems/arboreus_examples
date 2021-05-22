// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/05/2021 at 18:12:07
	\endlist
*/
// ----------------------------------------------------------
#ifndef ADEVICEDATAMODELS_H
#define ADEVICEDATAMODELS_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions

// Namespace
class ADeviceEnums : public QObject {

	Q_OBJECT

	public:

		enum class PermissionCamera: int {

			NotDetermined,
			Granted,
			Denied,
			Restricted,
			Error
		};
		Q_ENUM(PermissionCamera)

		enum class PermissionMicrophone: int {

			NotDetermined,
			Granted,
			Denied,
			Error
		};
		Q_ENUM(PermissionMicrophone)
};

#endif // ADEVICEDATAMODELS_H
