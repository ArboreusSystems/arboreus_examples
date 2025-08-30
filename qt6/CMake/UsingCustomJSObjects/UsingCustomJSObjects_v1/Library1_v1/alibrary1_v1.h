// ----------------------------------------------------------
/*!
	\headerfile ALibrary1_v1
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/08/2025 at 22:04:02
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALIBRARY1_V1_H
#define ALIBRARY1_V1_H

// Precompiled includes
#include <alibrary1_v1_pch.h>

// System includes

// Application includes


// Class definitions
class ALibrary1_v1 : public QObject {

	Q_OBJECT

	public:

		explicit ALibrary1_v1(QObject* parent = nullptr);
		virtual ~ALibrary1_v1(void);

	public slots:

		QString mTestString(void);
};

#endif // ALIBRARY1_V1_H
