// ----------------------------------------------------------
/*!
	\headerfile AProperties
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 28/07/2021 at 11:40:41
	\endlist
*/
// ----------------------------------------------------------

#ifndef APROPERTIES_H
#define APROPERTIES_H

// System includes
#include <QObject>
#include <QString>
#include <QStandardPaths>

// Application includes
#include <adir.h>

// Constants and definitions

// Namespace

// Classes
class ABackend;

// Class definitions
class AProperties : public QObject {

	Q_OBJECT

	public:

		explicit AProperties(QObject* parent = nullptr);
		virtual ~AProperties(void);
		Q_DISABLE_COPY(AProperties)

		void mInit(void);

		const char* mNameOrganisationChar(void);
		const char* mNameDomainChar(void);
		const char* mNameApplicationChar(void);

		QString mNameOrganisationString(void);
		QString mNameDomainString(void);
		QString mNameApplicationString(void);

		QString mPathDataApplication(void);
		QString mPathDataConfig(void);
		QString mPathDataCache(void);

	signals:

		void sgInitiated();

	private:

		ABackend* pBackend = nullptr;

		const char* pNameOrganisation = "Arboreus";
		const char* pNameDomain = "arboreus.systems";
		const char* pNameApplication = "TableView v3";

		QString pPathDataApplication = "NoPathDataApplication";
		QString pPathDataConfig = "NoPathDataConfig";
		QString pPathDataCache = "NoPathDataCache";

		void mInitPaths(void);
};

#endif // APROPERTIES_H
