// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 20:20:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QObject>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class AGlobal : public QObject {

	Q_OBJECT

public:

	explicit AGlobal(QObject *parent = nullptr);
	virtual ~AGlobal(void);

signals:

};

#endif // AGLOBAL_H
