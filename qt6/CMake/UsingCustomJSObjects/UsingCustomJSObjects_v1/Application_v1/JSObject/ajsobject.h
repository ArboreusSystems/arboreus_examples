// ----------------------------------------------------------
/*!
	\headerfile AJSObject
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 30/08/2025 at 13:32:23
	\endlist
*/
// ----------------------------------------------------------
#ifndef AJSOBJECT_H
#define AJSOBJECT_H

// Precompiled includes
#include <main_pch.h>

// System includes

// Application includes
#include <Logger/aloggerglobal.h>

// Namesapces

// Constants and definitions


// Class definitions
class AJSObject : public QObject {

		Q_OBJECT

	public:

		explicit AJSObject(QObject* parent = nullptr);
		virtual ~AJSObject(void);

	public slots:

		QString mTestString(void);

	signals:


};

#endif // AJSOBJECT_H
