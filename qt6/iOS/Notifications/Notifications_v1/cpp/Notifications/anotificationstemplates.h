// ----------------------------------------------------------
/*!
	\headerfile ANotificationsTemplates
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 07/06/2022 at 09:58:34
	\endlist
*/
// ----------------------------------------------------------

#ifndef ANOTIFICATIONSTEMPLATES_H
#define ANOTIFICATIONSTEMPLATES_H

// System includes
#include <QObject>

// Application includes
#include <aloggerglobal.h>
#include <anotificationsdatamodels.h>

// Constants and definitions

// Namespace

// Class definitions
class ANotificationsTemplates : public QObject {

	Q_OBJECT

	public:

		explicit ANotificationsTemplates(QObject* parent = nullptr);
		virtual ~ANotificationsTemplates(void);

	public slots:

		QVariantMap mModelMessage(void);
};

#endif // ANOTIFICATIONSTEMPLATES_H
