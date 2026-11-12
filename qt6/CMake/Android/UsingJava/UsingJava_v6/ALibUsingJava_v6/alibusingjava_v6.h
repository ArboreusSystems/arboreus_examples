// ----------------------------------------------------------
/*!
	\headerfile ALibUsingJava_v6
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/11/2026 at 14:24:48
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALIBUSINGJAVA_V6_H
#define ALIBUSINGJAVA_V6_H

// Precompiled includes
#include <alibusingjava_v6_pch.h>

// System includes

// Application includes
#include <alogger.h>

// Class definition
class ALibUsingJava_v6: public QObject {

	Q_OBJECT

	public:

		explicit ALibUsingJava_v6(QObject* parent = nullptr);
		virtual ~ALibUsingJava_v6(void);

		QString mMessageWithString(QString inMessage);
		QString mMessage(void);
};

#endif // ALIBUSINGJAVA_V6_H
