// ----------------------------------------------------------
/*!
	\headerfile ASking
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/09/2020 at 20:14:29
	\endlist
*/
// ----------------------------------------------------------

#ifndef ASKING_H
#define ASKING_H

// System includes
#include <QObject>
#include <QString>
#include <QMap>

// Application includes
#include "alogger.h"
#include "acolors.h"

// Constants and definitions
#define SKIN_NO_COLOR "no_color"
#define SKIN_DEFAULT_COLOR_ID "default"

// Namespace

// Class definitions
class ASkin : public QObject {

	Q_OBJECT

	public:

		explicit ASkin(AColors* inColors, QObject *parent = nullptr);
		explicit ASkin(QObject *parent = nullptr);
		virtual ~ASkin(void);

	signals:

		void sgSkinChanged(void);

	public slots:

		void mSetSkin(QString inSkinID);
		QString mGetColorFor(QString inUIObjectID);

	private:

		QMap<QString,QString> pCurrentSkin;
		AColors* pColors;

		void mSetDefaultSkin1(void);
		void mSetDefaultSkin2(void);
		void mSetDefaultSkin3(void);
};

#endif // ASKING_H
