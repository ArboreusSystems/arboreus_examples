// ----------------------------------------------------------
/*!
	\headerfile AEnumTest
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/05/2021 at 12:37:10
	\endlist
*/
// ----------------------------------------------------------

#ifndef AENUMTEST_H
#define AENUMTEST_H

// System includes
#include <QObject>

// Application includes
#include <enumexample.h>
#include <alogger.h>

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class AEnumTest : public QObject {

	Q_OBJECT

	public:

		explicit AEnumTest(QObject *parent = nullptr);
		virtual ~AEnumTest(void);

	public slots:

		void mPrintEnum(EnumExample::Values inEnumValue);
};

} // namespace ARB

#endif // AENUMTEST_H
