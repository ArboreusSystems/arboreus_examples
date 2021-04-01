// ----------------------------------------------------------
/*!
	\headerfile ADir
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 01/04/2021 at 13:23:01
	\endlist
*/
// ----------------------------------------------------------

#ifndef ADIR_H
#define ADIR_H

// System includes
#include <QObject>
#include <QDir>
#include <QStringList>
#include <QStringListIterator>

// Application includes

// Constants and definitions

// Namespace

// Class definitions
class ADir : public QObject {

	Q_OBJECT

	public:

		explicit ADir(QObject *parent = nullptr);
		virtual ~ADir(void);

		static bool mEnsure(QString inPath);
		static bool mRemoveRecursively(QString inPath);
		static QStringList mGetSubdirs(QString inPath);
};

#endif // ADIR_H
