// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 18/09/2020 at 20:45:16
	\endlist
*/
// ----------------------------------------------------------

#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QObject>
#include <QQmlApplicationEngine>

// Application includes
#include "alogger.h"

// Constants and definitions

// Namespace

// Class definitions
class AGlobal : public QObject {

	Q_OBJECT

	public:

		QQmlApplicationEngine* pEngine;

		static AGlobal& mInstance() {
			static AGlobal oInstance;
			return oInstance;
		}

	private:

		explicit AGlobal(QObject *parent = nullptr);
		virtual ~AGlobal(void);
		Q_DISABLE_COPY(AGlobal)
};

#endif // AGLOBAL_H
