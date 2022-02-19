// ----------------------------------------------------------
/*!
	\headerfile AHandlerJSON
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 26/12/2019 at 20:00:56
	\endlist
*/
// ----------------------------------------------------------
#ifndef AHANDLERJSON_H
#define AHANDLERJSON_H

// System includes
#include <QObject>
#include <QJsonDocument>
#include <QJsonParseError>
#include <QJsonObject>
#include <QJsonValueRef>
#include <QString>
#include <QFile>
#include <QIODevice>
#include <QVariant>
#include <QVariantMap>
#include <QVariantHash>

// Application includes
#include "aglobal.h"
#include "ahandlerjsondatamodels.h"

// Constants and definitions



// Class definitions
class AHandlerJSON : public QObject {

	Q_OBJECT

	public:

		explicit AHandlerJSON(QObject *parent = nullptr);
		virtual ~AHandlerJSON(void);

		static AHandlerJSONReply mFromFile(QString inFile);
		static bool mToFileFromDocument(QString inFile,QJsonDocument inDocument);
		static bool mToFileFromQMap(QString inFile,QVariantMap inData);
		static bool mToFileFromQHash(QString inFile,QVariantHash inData);
};

#endif // AHANDLERJSON_H
