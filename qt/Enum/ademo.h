// ----------------------------------------------------------
/*!
	\headerfile ADemo
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 25/11/2019 at 10:29:50
	\endlist
*/
// ----------------------------------------------------------
#ifndef ADEMO_H
#define ADEMO_H

// System includes
#include <QObject>

// Application includes
#include <aglobal.h>
#include <enum.h>

// Constants and definitions


// Class definitions
class ADemo : public QObject {

	Q_OBJECT

	public:

		explicit ADemo(QObject *parent = nullptr);
		virtual ~ADemo(void);


	public slots:

		void mTestEnum1(AEnum1::List1 inEnumValue);
		void mTestEnum2(AEnum2::List2 inEnumValue);
};

#endif // ADEMO_H
