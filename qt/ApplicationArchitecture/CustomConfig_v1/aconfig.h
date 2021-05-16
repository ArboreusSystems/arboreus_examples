// ----------------------------------------------------------
/*!
	\headerfile AConfig
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/05/2021 at 10:23:53
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACONFIG_H
#define ACONFIG_H

// System includes
#include <QObject>

// Application includes
#include <alogger.h>
#include <abackend.h>

// Constants and definitions

// Namespace

// Class definitions
class AConfig :
	public QObject,
	public ABackendConfig,
	public ALoggerConfig
{

	Q_OBJECT
	Q_INTERFACES(
		ABackendConfig
		ALoggerConfig
	)

	public:

		explicit AConfig(QObject *parent = nullptr);
		virtual ~AConfig(void);

		QString mLoggerConfigValue(void);

};

#endif // ACONFIG_H
