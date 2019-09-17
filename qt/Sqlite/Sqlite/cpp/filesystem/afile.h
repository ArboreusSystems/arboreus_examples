// ----------------------------------------------------------
/*!
	\headerfile
	\title
	\brief Template file wizard/classes/cpp/file.h

	\list
	\li @notice Template file classes/file.h
	\li @copyright Arboreus (http://arboreus.systems)
	\li @author Alexandr Kirilov (http://alexandr.kirilov.me)
	\li @created 17/09/2019 at 12:35:31
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

// Application includes
#include "cpp/global/aglobal.h"


class aFile : public QObject {

	Q_OBJECT

	public:

		static bool mRemove(QString inPath);
		static bool mExist(QString inPath);

	private:
		explicit aFile(QObject *parent = nullptr);
		virtual ~aFile(void);
};

#endif // AFILE_H
