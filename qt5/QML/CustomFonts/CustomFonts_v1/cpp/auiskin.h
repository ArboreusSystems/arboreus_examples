// ----------------------------------------------------------
/*!
	\headerfile AUISkin
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/10/2020 at 23:37:34
	\endlist
*/
// ----------------------------------------------------------

#ifndef AUISKIN_H
#define AUISKIN_H

// System includes
#include <QObject>
#include <QVariantList>
#include <QFontDatabase>
#include <QTimer>

// Application includes
#include "alogger.h"
#include "aglobaldatamodels.h"

// Constants and definitions

// Namespace

// Class definitions
class AUISkin : public QObject {

	Q_OBJECT

	public:

		static AUISkin& mInstance(void) {
			static AUISkin oInstance;
			return oInstance;
		}

	signals:

		void sgSkinChanged(void);

	public slots:

		QString mFontFamily(void);
		QVariantList mFontFamiliesSystem(void);
		QVariantList mFontFamiliesCustom(void);
		void mSetFontFamilyCustom(QString inFontFamilyID);

	private:

		QFontDatabase* pFontDatabase = nullptr;
		QString pFontFamily = AGLOBAL_DEFAULT_STRING;
		QVariantList pFontFamiliesSystem = {};
		QVariantList pFontFamiliesCustom = {};

		explicit AUISkin(QObject *parent = nullptr);
		virtual ~AUISkin(void);
		Q_DISABLE_COPY(AUISkin)

		void mSetFontFamiliesSystem(void);
		void mSetFontFamiliesCustom(void);
		void mSetFontFamilyCaveat(void);
		void mSetFontFamilyOpenSansCondensed(void);
		void mSetFontFamilyPangolin(void);
		void mSetFontFamilyPhilosopher(void);
};

#endif // AUISKIN_H
