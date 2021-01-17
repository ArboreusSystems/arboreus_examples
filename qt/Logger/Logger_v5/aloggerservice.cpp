// ----------------------------------------------------------
/*!
	\class ALoggerService
	\title
	\brief Template file classes/cpp/file.cpp

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 16/01/2021 at 17:21:46
	\endlist
*/
// ----------------------------------------------------------

// Class header
#include "aloggerservice.h"


// -----------
/*!
	\fn

	Doc.
*/

ALoggerService::ALoggerService(QObject *parent) : QObject(parent) {}


// -----------
/*!
	\fn

	Doc.
*/

ALoggerService::~ALoggerService(void) {}


// -----------
/*!
	\fn

	Doc.
*/

void ALoggerService::mWriteToLog(ALoggerModelMessage* inMessage) {

	switch (inMessage->pMsgType) {
		case QtDebugMsg:
#ifdef QT_DEBUG
			fprintf(
				stderr, "%llu [DBG]:%s %s [%s]:[%u]:[%s]\n",
				inMessage->pTime, inMessage->pActorType.toStdString().c_str(),
				inMessage->pMessage.toStdString().c_str(), inMessage->pFile.toStdString().c_str(),
				inMessage->pLine, inMessage->pFuntcion.toStdString().c_str()
			);
#endif
			break;
		case QtInfoMsg:
			fprintf(
				stderr, "%llu [INF]:%s %s [%s]:[%u]:[%s]\n",
				inMessage->pTime, inMessage->pActorType.toStdString().c_str(),
				inMessage->pMessage.toStdString().c_str(), inMessage->pFile.toStdString().c_str(),
				inMessage->pLine, inMessage->pFuntcion.toStdString().c_str()
			);
			break;
		case QtWarningMsg:
			fprintf(
				stderr, "%llu [WAR]:%s %s [%s]:[%u]:[%s]\n",
				inMessage->pTime, inMessage->pActorType.toStdString().c_str(),
				inMessage->pMessage.toStdString().c_str(), inMessage->pFile.toStdString().c_str(),
				inMessage->pLine, inMessage->pFuntcion.toStdString().c_str()
			);
			break;
		case QtCriticalMsg:
			fprintf(
				stderr, "%llu [CRI]:%s %s [%s]:[%u]:[%s]\n",
				inMessage->pTime, inMessage->pActorType.toStdString().c_str(),
				inMessage->pMessage.toStdString().c_str(), inMessage->pFile.toStdString().c_str(),
				inMessage->pLine, inMessage->pFuntcion.toStdString().c_str()
			);
			break;
		case QtFatalMsg:
			fprintf(
				stderr, "%llu [FAT]:%s %s [%s]:[%u]:[%s]\n",
				inMessage->pTime, inMessage->pActorType.toStdString().c_str(),
				inMessage->pMessage.toStdString().c_str(), inMessage->pFile.toStdString().c_str(),
				inMessage->pLine, inMessage->pFuntcion.toStdString().c_str()
			);
			break;
	}

	emit sgLogUpdated();
}
