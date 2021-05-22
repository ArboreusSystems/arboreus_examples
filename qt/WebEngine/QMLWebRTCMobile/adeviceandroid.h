// ----------------------------------------------------------
/*!
	\headerfile ADeviceAndroid
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 21/05/2021 at 18:34:35
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADEVICEANDROID_H
#define ADEVICEANDROID_H

// System includes
#include <QObject>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ADeviceAndroid : public QObject {

	Q_OBJECT

public:

	explicit ADeviceAndroid(QObject *parent = nullptr);
	virtual ~ADeviceAndroid(void);

signals:

};

#endif // ADEVICEANDROID_H
