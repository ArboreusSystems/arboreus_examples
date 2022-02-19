// ----------------------------------------------------------
/*!
	\headerfile ASqlManager
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/03/2021 at 16:46:25
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASQLMANAGER_H
#define ASQLMANAGER_H

// System includes
#include <QObject>

// Application includes
#include <asqldatamodels.h>
#include <alogger.h>

// Constants and definitions

// Namespace

// Class definitions
class ASqlManager : public QObject {

	Q_OBJECT

	public:

		explicit ASqlManager(QObject *parent = nullptr);
		virtual ~ASqlManager(void);

		void mAddDatabase(ASqlDatabaseProperties* inProperties);

	signals:

		void sgAddDatabase(ASqlDatabaseProperties* inProperties);
};

#endif // ASQLMANAGER_H
