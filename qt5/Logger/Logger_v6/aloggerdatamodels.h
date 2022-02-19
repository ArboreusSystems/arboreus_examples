// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 09/02/2021 at 18:31:19
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERDATAMODELS_H
#define ALOGGERDATAMODELS_H

// System includes
#include <QObject>
#include <QDebug>
#include <QString>

// Application includes

// Constants and defintions

// Namespace

class ALoggerMessageModel {

	public:

		uint64_t Time = 0;
		QtMsgType Type = QtMsgType::QtDebugMsg;
		const QMessageLogContext* Context = nullptr;
		const QString* Message = nullptr;

		ALoggerMessageModel() {}
		~ALoggerMessageModel() {}

};

Q_DECLARE_METATYPE(ALoggerMessageModel)


#endif // ALOGGERDATAMODELS_H
