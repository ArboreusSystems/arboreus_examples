// ----------------------------------------------------------
/*!
	\headerfile AProperties
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/04/2021 at 12:24:34
	\endlist
*/
// ----------------------------------------------------------

#ifndef APROPERTIES_H
#define APROPERTIES_H

// System includes
#include <QObject>
#include <QStandardPaths>

// Application includes

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
		QString mPathApplicationData(void);

	private:

		ABackend* pBackend = nullptr;
		QString pPathApplicationData = "NoPathInProperties";
};

#endif // APROPERTIES_H
