// ----------------------------------------------------------
/*!
	\headerfile ASwift
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/12/2022 at 23:00:14
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASWIFT_H
#define ASWIFT_H

// System includes
#include <QObject>
#include <QString>

// Application includes
#include <aloggerglobal.h>
#include <aswiftiosnative.h>

// Constants and definitions

// Namespace

// Class definitions
class ASwift : public QObject {

	Q_OBJECT

	public:

		explicit ASwift(QObject* parent = nullptr);
		virtual ~ASwift(void);

		void mInit(void);
		QString mString(void);

	private:

		ASwiftIOSNative* pIOSNative = nullptr;
};

#endif // ASWIFT_H
