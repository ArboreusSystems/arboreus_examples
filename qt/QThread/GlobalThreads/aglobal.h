// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/12/2019 at 07:48:36
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QObject>
#include <QThread>
#include <QDebug>
#include <QDateTime>

// Application includes

// Constants and definitions
#define A_MESSAGE_CONSOLE qDebug()
#define A_MESSAGE_DEBUG A_MESSAGE_CONSOLE << QDateTime::currentMSecsSinceEpoch()
#define A_GLOBAL_PROPERTY AGlobal* pGlobal
#define A_GLOBAL_INSTANCE pGlobal = &AGlobal::mInstance()


// Class definitions
class AGlobal : public QObject {

	Q_OBJECT

	public:

		static AGlobal& mInstance(void) {
			static AGlobal oSingletone;
			return oSingletone;
		}

		QThread* pThreadNormal;
		QThread* pThreadLow;
		QThread* pThreadLowest;

	private:

		explicit AGlobal(QObject *parent = nullptr);
		virtual ~AGlobal(void);
		Q_DISABLE_COPY(AGlobal)
};

#endif // AGLOBAL_H
