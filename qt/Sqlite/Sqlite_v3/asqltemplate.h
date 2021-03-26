// ----------------------------------------------------------
/*!
	\headerfile ASqlTemplate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/03/2021 at 12:00:40
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASQLTEMPLATE_H
#define ASQLTEMPLATE_H

// System includes
#include <QObject>

// Application includes
#include <alogger.h>
#include <asqldatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ASqlTemplate : public QObject {

	Q_OBJECT

	public:

		explicit ASqlTemplate(QObject *parent = nullptr);
		virtual ~ASqlTemplate(void);

	public slots:

		void slInit(ASqlDatabaseProperties* inProperties);

	private:

		ASqlDatabaseProperties* pProperties = nullptr;
};

#endif // ASQLTEMPLATE_H
