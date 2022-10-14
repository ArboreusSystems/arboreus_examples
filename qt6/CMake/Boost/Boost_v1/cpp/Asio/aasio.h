// ----------------------------------------------------------
/*!
	\headerfile AAsio
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/10/2022 at 19:14:27
	\endlist
*/
// ----------------------------------------------------------

#ifndef AASIO_H
#define AASIO_H

// System includes
#include <QObject>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class AAsio : public QObject {

	Q_OBJECT

public:

	explicit AAsio(QObject *parent = nullptr);
	virtual ~AAsio(void);

signals:

};

#endif // AASIO_H
