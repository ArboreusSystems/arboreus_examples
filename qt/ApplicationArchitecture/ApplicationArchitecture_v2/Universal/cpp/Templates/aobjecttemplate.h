// ----------------------------------------------------------
/*!
	\headerfile AObjectTemplate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 20:17:31
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTTEMPLATE_H
#define AOBJECTTEMPLATE_H

// System includes
#include <QObject>

// Application includes

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AObjectTemplate : public QObject {

	Q_OBJECT

	public:

		ABackend* pBackend = nullptr;

		explicit AObjectTemplate(QObject *parent = nullptr);
		virtual ~AObjectTemplate(void);
};

#endif // AOBJECTTEMPLATE_H
