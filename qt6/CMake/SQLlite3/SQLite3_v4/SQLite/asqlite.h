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
		bool mCloseDB(void);
		bool mExecute(QString inSQL);

	private:

		sqlite3* pSQLiteDB = nullptr;
};

#endif // ASQLITE_H
