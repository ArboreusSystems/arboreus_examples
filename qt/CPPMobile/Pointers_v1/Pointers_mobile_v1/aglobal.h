// ----------------------------------------------------------
/*!
	\headerfile AGlobal
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 23/07/2020 at 17:13:20
	\endlist
*/
// ----------------------------------------------------------
#ifndef AGLOBAL_H
#define AGLOBAL_H

// System includes
#include <QObject>
#include <string>
#include <iostream>

// Application includes
#include "alogger.h"

// Constants and definitions
enum class ADataType {

	Integer = 0,
	Float,
	Char
};

// Namesapce
using namespace std;


// Class definitions
class AGlobal : public QObject {

	Q_OBJECT

	public:

		explicit AGlobal(QObject *parent = nullptr);
		virtual ~AGlobal(void);

		static void mPrintValue(string inName,void* inPointer,ADataType inType);

	signals:

	public slots:
};

#endif // AGLOBAL_H
