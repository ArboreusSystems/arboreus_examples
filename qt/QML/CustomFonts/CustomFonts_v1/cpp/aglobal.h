// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/10/2020 at 23:33:19
	\endlist
*/
// ----------------------------------------------------------

#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QObject>
#include <QQmlContext>
#include <QString>

// Application includes
#include "alogger.h"
#include "auiskin.h"

// Constants and definitions

// Namespace

// Class definitions
class AGlobal : public QObject {

	Q_OBJECT

	public:

		static AGlobal& mInstance(void) {
			static AGlobal oInstance;
			return oInstance;
		}

		void mSetContext(QQmlContext* inContext);

	public slots:

		QString mDefaultString(void);

	private:

		ALogger* pLogger = nullptr;
		AUISkin* pUISkin = nullptr;

		explicit AGlobal(QObject *parent = nullptr);
		virtual ~AGlobal(void);
		Q_DISABLE_COPY(AGlobal)
};

#endif // AGLOBAL_H
