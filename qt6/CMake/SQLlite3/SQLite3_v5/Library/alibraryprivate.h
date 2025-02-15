#ifndef ALIBRARYPRIVATE_H
#define ALIBRARYPRIVATE_H

#include <QObject>
#include <QDebug>

#include <sqlite3mc_amalgamation.h>


class ALibraryPrivate : public QObject {

	Q_OBJECT

	public:

		explicit ALibraryPrivate(QObject* parent = nullptr);
		virtual ~ALibraryPrivate(void);

		int mOpenDB(QString inPath);
		bool mCloseDB(void);
		bool mExecute(QString inSQL);

	private:

		sqlite3* pSQLiteDB = nullptr;
};

#endif // ALIBRARYPRIVATE_H
