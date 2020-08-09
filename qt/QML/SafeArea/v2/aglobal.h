// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 14/06/2020 at 10:50:06
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QObject>
#include <QGuiApplication>
#include <QScreen>

// Application includes
#include "alogger.h"

// Constants and definitions


// Class definitions
class AGlobal : public QObject {

	Q_OBJECT

	public:

		static AGlobal& mInstance() {
			static AGlobal oInstance;
			return oInstance;
		}

	signals:

		void sgOrientationChanged(Qt::ScreenOrientation inOrientation);

	public slots:

		bool mIsLanscape(void);

	private slots:

		void mOrientationChanged(Qt::ScreenOrientation inOrientation);

	private:

		QScreen* pScreen;

		explicit AGlobal(QObject *parent = nullptr);
		virtual ~AGlobal(void);
		Q_DISABLE_COPY(AGlobal)
};

#endif // AGLOBAL_H
