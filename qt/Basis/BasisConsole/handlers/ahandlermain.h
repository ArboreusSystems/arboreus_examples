// ----------------------------------------------------------
/*!
	\headerfile aHandlerMain
	\title
	\brief Template file classes/cpp/file.h

	\list
		\li @notice Template file classes/file.h
		\li @copyright Arboreus (http://arboreus.systems)
		\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
		\li @created 03/08/2019 at 11:51:18
	\endlist
*/
// ----------------------------------------------------------

#ifndef AHANDLERMAIN_H
#define AHANDLERMAIN_H

// System includes
#include <QObject>
#include <QString>
#include <QVector>
#include <QRandomGenerator>

// Application includes
#include "../aglobal.h"

enum aDictionaryType {
	AlphaLower,
	AlphaUpper,
	Numeric,
	Symbolic
};

class aHandlerMain : public QObject {

	Q_OBJECT

	public:
		explicit aHandlerMain(QObject *parent = nullptr);
		virtual ~aHandlerMain(void);
		static QString mStringRandom(int inLength,QString inDictionary);
		static QString mStringDictionary(QVector<aDictionaryType> inSchema);
};

#endif // AHANDLERMAIN_H
