// ----------------------------------------------------------
/*!
	\headerfile ASwiftIOSNative
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/12/2022 at 23:25:31
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASWIFTIOSNATIVE_H
#define ASWIFTIOSNATIVE_H

// System includes
#include <QObject>
#include <QString>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ASwiftIOSNative : public QObject {

	Q_OBJECT

	public:

		explicit ASwiftIOSNative(QObject* parent = nullptr);
		virtual ~ASwiftIOSNative(void);

		QString mString(void);
};

#endif // ASWIFTIOSNATIVE_H
