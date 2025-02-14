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

		sqlite3* mOpenDB(QString inPath);
		bool mCloseDB(sqlite3* inDB);
		bool mExecute(sqlite3* inDB,QString inSQL);
};

#endif // ASQLITE_H
