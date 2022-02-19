// ----------------------------------------------------------
/*!
	\headerfile AUIConstants
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/11/2021 at 19:02:07
	\endlist
*/
// ----------------------------------------------------------

#ifndef AUICONSTANTS_H
#define AUICONSTANTS_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>

// Constants and definitions

// Namespace

// Class definitions
class AUIConstants : public QObject {

	Q_OBJECT

	public:

		explicit AUIConstants(QObject* parent = nullptr);
		virtual ~AUIConstants(void);

	public slots:

		int mElementHight(void);

		int mFontBodySize(void);
		int mFontHeaderSize(void);

	private:

		int pElementHight = 45;

		int pFontBodySize = 18;
		int pFontHeaderSize = 22;
};

#endif // AUICONSTANTS_H
