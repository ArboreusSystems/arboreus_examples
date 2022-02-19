// ----------------------------------------------------------
/*!
	\headerfile ALoggerModelMessage
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/01/2021 at 18:02:37
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGERMODELMESSAGE_H
#define ALOGGERMODELMESSAGE_H

// System includes
#include <QObject>
#include <QDebug>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ALoggerModelMessage {

	public:

		QtMsgType pMsgType = QtDebugMsg;
		uint64_t pTime = 0;
		QString pActorType = QString("[SYS]");
		QString pMessage = QString("No message");
		QString pFile = QString("No file");
		int pLine = 0;
		QString pFuntcion = QString("No function");

		explicit ALoggerModelMessage(void);
		virtual ~ALoggerModelMessage(void);
};

Q_DECLARE_METATYPE(ALoggerModelMessage)

#endif // ALOGGERMODELMESSAGE_H
