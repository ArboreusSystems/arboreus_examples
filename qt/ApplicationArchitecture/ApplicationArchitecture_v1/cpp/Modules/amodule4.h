// ----------------------------------------------------------
/*!
	\headerfile AModule4
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/10/2020 at 10:10:14
	\endlist
*/
// ----------------------------------------------------------

#ifndef AMODULE4_H
#define AMODULE4_H

// System includes
#include <QObject>

// Application includes
#include "../Logger/alogger.h"

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class AModule4 : public QObject {

	Q_OBJECT

	public:

		explicit AModule4(QObject *parent = nullptr);
		virtual ~AModule4(void);
};

} // namespace ARB

#endif // AMODULE4_H
