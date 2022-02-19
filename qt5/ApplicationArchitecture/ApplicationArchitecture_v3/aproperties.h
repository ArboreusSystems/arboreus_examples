// ----------------------------------------------------------
/*!
	\headerfile AProperties
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/03/2021 at 15:11:43
	\endlist
*/
// ----------------------------------------------------------

#ifndef APROPERTIES_H
#define APROPERTIES_H

// System includes
#include <QObject>
#include <QString>

// Application includes
#include <aloggerservice.h>
#include <adir.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AProperties : public QObject {

	Q_OBJECT

	public:

		explicit AProperties(QObject *parent = nullptr);
		virtual ~AProperties(void);

		void mInit(void);
		QString mGetPathDataApplication(void);

	private:

		ABackend* pBackend = nullptr;
		QString pPathDataApplication = "NoPathDataApplication";
};

#endif // APROPERTIES_H
