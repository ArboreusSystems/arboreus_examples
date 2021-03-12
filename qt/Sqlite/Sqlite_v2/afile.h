// ----------------------------------------------------------
/*!
	\headerfile AFile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 12/03/2021 at 19:43:51
	\endlist
*/
// ----------------------------------------------------------

#ifndef AFILE_H
#define AFILE_H

// System includes
#include <QObject>
#include <QDir>
#include <QFileInfo>
#include <QFile>
#include <QByteArray>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class AFile : public QObject {

	Q_OBJECT

	public:

		explicit AFile(QObject *parent = nullptr);
		virtual ~AFile(void);

		static bool mRemove(QString inPath);
		static bool mExist(QString inPath);
};

#endif // AFILE_H
