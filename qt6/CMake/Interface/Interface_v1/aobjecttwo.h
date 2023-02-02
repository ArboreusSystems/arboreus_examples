// ----------------------------------------------------------
/*!
	\headerfile AObjectTwo
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 02/02/2023 at 11:01:05
	\endlist
*/
// ----------------------------------------------------------

#ifndef AOBJECTTWO_H
#define AOBJECTTWO_H

// System includes
#include <QObject>
#include <QDebug>

// Application includes
#include <aobjectoneinterface.h>

// Constants and definitions

// Namespace

// Class definitions
class AObjectTwo :
	public QObject,
	public AObjectOneInterface
{

	Q_OBJECT
	Q_INTERFACES(
		AObjectOneInterface
	)

	public:

		explicit AObjectTwo(QObject* parent = nullptr);
		virtual ~AObjectTwo(void);

		void mTestMethod(void);
};

#endif // AOBJECTTWO_H
