#ifndef ASQLITE_H
#define ASQLITE_H

#include <QObject>
#include <QDebug>

#include <sqlite.conf.h>


class ASqlite : public QObject {

	Q_OBJECT

	public:

		explicit ASqlite(QObject* parent = nullptr);
		virtual ~ASqlite(void);

		int mOpenDB(QString inPath);
		int mCloseDB(void);
		int mPrepare(QString inSQL);
		QString mStep(void);

	private:

		sqlite3* pSQLiteDB = nullptr;
		sqlite3_stmt* pStatement = nullptr;
		int pResult = 0;
};

#endif // ASQLITE_H
