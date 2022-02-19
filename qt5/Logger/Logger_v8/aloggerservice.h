// ----------------------------------------------------------
/*!
	\headerfile ALoggerService
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 08/03/2021 at 14:37:44
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGERSERVICE_H
#define ALOGGERSERVICE_H

// System includes

// Application includes
#include <aloggerglobal.h>
#include <aloggerdatamodels.h>

// Constants and definitions

// Namespace
namespace ARB {

// Class definitions
class ALoggerService : public QObject {

Q_OBJECT

	public:

		explicit ALoggerService(QObject *parent = nullptr);
		virtual ~ALoggerService(void);

	public slots:

		void slWriteToLog(ALoggerMessageModel* inMessage);

	signals:

		void sgLogUpdated(void);

	private:

		void mWriteToDB(ALoggerMessageModel* inMessage);
};

} // namespace ARB

#endif // ALOGGERSERVICE_H
