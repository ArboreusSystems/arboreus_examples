// ----------------------------------------------------------
/*!
	\headerfile ALogger
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 13/10/2020 at 21:22:21
	\endlist
*/
// ----------------------------------------------------------

#ifndef ALOGGER_H
#define ALOGGER_H

// System includes
#include <QDateTime>
#include <QDebug>

// Application includes
#include "../Templates/aobjecttemplate.h"

// Constants and definitions
#define ALOG qDebug() << QDateTime::currentMSecsSinceEpoch()
#define ALOG_SYSTEM ALOG << "[SYSTEM]"
#define ALOG_QML ALOG << "[QML]"

// Namespace
namespace ARB {

// Class definitions
class ALogger : public AObjectTemplate {

	Q_OBJECT

	public:

		explicit ALogger(QObject *parent = nullptr);
		virtual ~ALogger(void);
};

} // namespace ARB

#endif // ALOGGER_H
