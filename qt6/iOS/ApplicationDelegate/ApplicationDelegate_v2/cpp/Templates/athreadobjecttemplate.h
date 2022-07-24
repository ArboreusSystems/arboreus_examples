// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 21:02:18
	\endlist
*/
// ----------------------------------------------------------
#ifndef ATHREADOBJECTTEMPLATE_H
#define ATHREADOBJECTTEMPLATE_H

// System includes
#include <QObject>

// Application includes

// Constants and defintions

// Namespace

class AThreadObjectTemplate : public QObject {

	Q_OBJECT

	public:

		explicit AThreadObjectTemplate(QObject* parent = nullptr): QObject(parent) {}
		virtual ~AThreadObjectTemplate(void) {}

	public slots:

		virtual void slRun(void) = 0;

	signals:

		void sgFinished(void);
};


#endif // ATHREADOBJECTTEMPLATE_H
