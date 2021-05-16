// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/05/2021 at 10:18:57
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERCONFIG_H
#define ALOGGERCONFIG_H

// System includes
#include <QObject>
#include <QString>

// Application includes

// Constants and defintions

// Namespace
class ALoggerConfig {

	public:

		virtual QString mLoggerConfigValue(void) = 0;
};

Q_DECLARE_INTERFACE(ALoggerConfig,"Arboreus.ALoggerConfig/1.0")

#endif // ALOGGERCONFIG_H
