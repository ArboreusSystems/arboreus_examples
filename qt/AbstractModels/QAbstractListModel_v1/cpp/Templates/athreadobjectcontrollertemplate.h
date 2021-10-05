// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/07/2021 at 23:06:53
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATHREADOBJECTCONTROLLERTEMPLATE_H
#define ATHREADOBJECTCONTROLLERTEMPLATE_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions

// Namespace


class AThreadObjectControllerTemplate : public QObject {

	Q_OBJECT

	public:

		explicit AThreadObjectControllerTemplate(QObject* parent = nullptr): QObject(parent) {}
		virtual ~AThreadObjectControllerTemplate(void) {}

	signals:

		void sgRun(void);
};


#endif // ATHREADOBJECTCONTROLLERTEMPLATE_H
