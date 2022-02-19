// ----------------------------------------------------------
/*!
	\headerfile ASequenceNumber
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/02/2022 at 12:44:27
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASEQUENCENUMBER_H
#define ASEQUENCENUMBER_H

// System includes
#include <QObject>
#include <QRandomGenerator>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ASequenceNumber : public QObject {

	Q_OBJECT

	public:

		explicit ASequenceNumber(QObject* parent = nullptr);
		virtual ~ASequenceNumber(void);

		static int mRandom(void);
		static int mRandom(int Number1,int Number2);
		static int mRandomPositive(void);
		static int mRandomNegative(void);
};

#endif // ASEQUENCENUMBER_H
