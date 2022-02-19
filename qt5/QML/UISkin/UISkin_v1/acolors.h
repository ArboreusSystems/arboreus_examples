// ----------------------------------------------------------
/*!
	\headerfile AColors
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/09/2020 at 19:55:16
	\endlist
*/
// ----------------------------------------------------------

#ifndef ACOLORS_H
#define ACOLORS_H

// System includes
#include <QObject>
#include <QString>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Class definitions
class AColors : public QObject {

	Q_OBJECT

	public:

		explicit AColors(QObject *parent = nullptr);
		virtual ~AColors(void);

	public slots:

		QString mTransparent();

		QString mWhiteLight();
		QString mWhite();

		QString mGreyLight();
		QString mGrey();
		QString mGreyDark();
		QString mGreyDarkest();

		QString mBlackLight();
		QString mBlack();
		QString mBlackDark();

		QString mPurpleLight();
		QString mPurple();
		QString mPurpleDark();

		QString mRedLight();
		QString mRed();
		QString mRedDark();

		QString mGreenLight();
		QString mGreen();
		QString mGreenDark();

		QString mBlueLight();
		QString mBlue();
		QString mBlueDark();

		QString mSaladLight();
		QString mSalad();
		QString mSaladDark();

		QString mFiolentLight();
		QString mFiolent();
		QString mFiolentDark();

		QString mOrangeLight();
		QString mOrange();
		QString mOrangeDark();
};

#endif // ACOLORS_H
