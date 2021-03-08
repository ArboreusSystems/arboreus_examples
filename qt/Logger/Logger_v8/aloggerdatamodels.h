// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file files/cppheader/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 14:28:24
	\endlist
*/
// ----------------------------------------------------------
#ifndef ALOGGERDATAMODELS_H
#define ALOGGERDATAMODELS_H

// System includes
#include <QObject>
#include <QString>

// Application includes

// Constants and defintions

// Namespace
namespace ARB {

class ALoggerMessageModel {

	public:

		uint64_t Time;
		QString Type;
		QString Actor;
		QString Message;
		QString Line;
		QString File;
		QString Function;

		ALoggerMessageModel() {

			this->Time = QDateTime::currentMSecsSinceEpoch();
			this->Type = QString("DBG");
			this->Actor = QString("SYS");
			this->Message = QString("NoMessage");
			this->Line = QString("0");
			this->File = QString("NoFile");
			this->Function = QString("NoFunction");
		}
		~ALoggerMessageModel() {}
};

} // namespace ARB

#endif // ALOGGERDATAMODELS_H
