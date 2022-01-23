// ----------------------------------------------------------
/*!
	\headerfile ASMTP
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/01/2022 at 18:00:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASMTP_H
#define ASMTP_H

// System includes
#include <QObject>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ASMTP : public QObject {

	Q_OBJECT

public:

	explicit ASMTP(QObject *parent = nullptr);
	virtual ~ASMTP(void);

signals:

};

#endif // ASMTP_H
