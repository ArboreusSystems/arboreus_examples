// ----------------------------------------------------------
/*!
	\headerfile AApplicationAndroidNativeDelegate
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 06/06/2022 at 14:10:59
	\endlist
*/
// ----------------------------------------------------------

#ifndef AAPPLICATIONANDROIDNATIVEDELEGATE_H
#define AAPPLICATIONANDROIDNATIVEDELEGATE_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AApplicationAndroidNativeDelegate : public QObject {

	Q_OBJECT

	public:

		explicit AApplicationAndroidNativeDelegate(QObject* parent = nullptr);
		virtual ~AApplicationAndroidNativeDelegate(void);
};

#endif // AAPPLICATIONANDROIDNATIVEDELEGATE_H
