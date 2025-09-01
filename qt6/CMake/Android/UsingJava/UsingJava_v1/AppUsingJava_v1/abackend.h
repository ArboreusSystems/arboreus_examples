// ----------------------------------------------------------
/*!
	\headerfile ABackend
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 31/08/2025 at 23:04:32
	\endlist
*/
// ----------------------------------------------------------
#ifndef ABACKEND_H
#define ABACKEND_H

// System includes
#include <QObject>

// Application includes

// Namesapces

// Constants and definitions

// Class definitions
class ABackend : public QObject {

		Q_OBJECT

	public:

		explicit ABackend(QObject *parent = nullptr);

	signals:


};

#endif // ABACKEND_H
