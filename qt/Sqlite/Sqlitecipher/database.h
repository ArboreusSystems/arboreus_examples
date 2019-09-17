#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>

#define DATABASE_HOSTNAME   "NameDataBase"
#define DATABASE_NAME       "NameCrypto2.db"

#define TABLE                   "NameTable"
#define TABLE_FNAME             "FisrtName"
#define TABLE_SNAME             "SurName"
#define TABLE_NIK               "Nik"

class DataBase : public QObject
{
	Q_OBJECT
public:
	explicit DataBase(QObject *parent = nullptr);
	~DataBase();
	void connectToDataBase();

private:
	QSqlDatabase    db;

private:
	bool openDataBase();
	bool restoreDataBase();
	void closeDataBase();
	bool createTable();

public slots:
	bool inserIntoTable(const QVariantList &data);      // Adding entries to the table
	bool inserIntoTable(const QString &fname, const QString &sname, const QString &nik);
	bool removeRecord(const int id); // Removing records from the table on its id
};

#endif // DATABASE_H
