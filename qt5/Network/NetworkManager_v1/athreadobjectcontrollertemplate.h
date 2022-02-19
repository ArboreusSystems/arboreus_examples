// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 03/04/2021 at 18:17:38
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATHREADOBJECTCONTROLLERTEMPLATE_H
#define ATHREADOBJECTCONTROLLERTEMPLATE_H

// System includes
#include <QObject>

// Application includes
#include <alogger.h>

// Constants and defintions

// Namespace

class AThreadObjectControllerTemplate : public QObject {

	Q_OBJECT

	public:

		explicit AThreadObjectControllerTemplate(QObject* parent = nullptr): QObject(parent) {

			ALOG << "AThreadObjectControllerTemplate created";
		}

		virtual ~AThreadObjectControllerTemplate(void) {

			ALOG << "AThreadObjectControllerTemplate deleted";
		}

	signals:

		void sgStartAction(void);
};

#endif // ATHREADOBJECTCONTROLLERTEMPLATE_H
