// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 21:01:09
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATHREADOBJECTCONTROLLERTEMPLATE_H
#define ATHREADOBJECTCONTROLLERTEMPLATE_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>

// Constants and defintions

// Namespace

class AThreadObjectControllerTemplate : public QObject {

	Q_OBJECT

	public:

		explicit AThreadObjectControllerTemplate(QObject* parent = nullptr): QObject(parent) {

			_A_DEBUG << "AThreadObjectControllerTemplate created";
		}

		virtual ~AThreadObjectControllerTemplate(void) {

			_A_DEBUG << "AThreadObjectControllerTemplate deleted";
		}

	signals:

		void sgRun(void);
};


#endif // ATHREADOBJECTCONTROLLERTEMPLATE_H
