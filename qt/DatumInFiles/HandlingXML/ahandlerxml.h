// ----------------------------------------------------------
/*!
	\headerfile AHandlerXML
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 27/12/2019 at 15:54:04
	\endlist
*/
// ----------------------------------------------------------
#ifndef AHANDLERXML_H
#define AHANDLERXML_H

// System includes
#include <QObject>
#include <QDomDocument>
#include <QString>
#include <QFile>
#include <QTextStream>
#include <QIODevice>

// Application includes
#include "aglobal.h"

// Constants and definitions


// Class definitions
class AHandlerXML : public QObject {

	Q_OBJECT

	public:

		explicit AHandlerXML(QObject *parent = nullptr);
		virtual ~AHandlerXML(void);

		static bool mToFile(QString inFile,QDomDocument inDom);
};

#endif // AHANDLERXML_H
