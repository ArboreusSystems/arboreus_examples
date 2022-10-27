// ----------------------------------------------------------
/*!
	\headerfile AObjectiveC
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2022 at 23:29:26
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTIVEC_H
#define AOBJECTIVEC_H

// System includes
#include <QObject>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class AObjectiveC : public QObject {

	Q_OBJECT

public:

	explicit AObjectiveC(QObject *parent = nullptr);
	virtual ~AObjectiveC(void);

signals:

};

#endif // AOBJECTIVEC_H
