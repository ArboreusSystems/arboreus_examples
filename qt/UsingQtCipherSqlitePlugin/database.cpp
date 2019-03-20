#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent)
{

}

DataBase::~DataBase()
{

}

void DataBase::connectToDataBase()
{
	if(!QFile("/Users/alexandr/Projects/dbtest/" DATABASE_NAME).exists()){
		this->restoreDataBase();
	} else {
		this->openDataBase();
	}
}

bool DataBase::restoreDataBase()
{
	if(this->openDataBase()){
		return (this->createTable()) ? true : false;
	} else {
		qDebug() << "Failed to restore the database";
		return false;
	}
}

bool DataBase::openDataBase()
{
	db = QSqlDatabase::addDatabase("SQLITECIPHER");
	db.setHostName(DATABASE_HOSTNAME);
	db.setDatabaseName("/Users/alexandr/Projects/dbtest/" DATABASE_NAME);
//	db.setPassword("password");
	if(db.open()){
		return true;
	} else {
		return false;
	}
}

void DataBase::closeDataBase()
{
	db.close();
}

bool DataBase::createTable()
{
	QSqlQuery query;
	if(!query.exec( "CREATE TABLE " TABLE " ("
							"id INTEGER PRIMARY KEY AUTOINCREMENT, "
							TABLE_FNAME     " VARCHAR(255)    NOT NULL,"
							TABLE_SNAME     " VARCHAR(255)    NOT NULL,"
							TABLE_NIK       " VARCHAR(255)    NOT NULL"
						" )"
					)){
		qDebug() << "DataBase: error of create " << TABLE;
		qDebug() << query.lastError().text();
		return false;
	} else {
		return true;
	}
}

bool DataBase::inserIntoTable(const QVariantList &data)
{
	QSqlQuery query;
	query.prepare("INSERT INTO " TABLE " ( " TABLE_FNAME ", "
											 TABLE_SNAME ", "
											 TABLE_NIK " ) "
				  "VALUES (:FName, :SName, :Nik)");
	query.bindValue(":FName",       data[0].toString());
	query.bindValue(":SName",       data[1].toString());
	query.bindValue(":Nik",         data[2].toString());

	if(!query.exec()){
		qDebug() << "error insert into " << TABLE;
		qDebug() << query.lastError().text();
		return false;
	} else {
		return true;
	}
}

bool DataBase::inserIntoTable(const QString &fname, const QString &sname, const QString &nik)
{
	QVariantList data;
	data.append(fname);
	data.append(sname);
	data.append(nik);

	if(inserIntoTable(data))
		return true;
	else
		return false;
}

bool DataBase::removeRecord(const int id)
{
	QSqlQuery query;

	query.prepare("DELETE FROM " TABLE " WHERE id= :ID ;");
	query.bindValue(":ID", id);

	if(!query.exec()){
		qDebug() << "error delete row " << TABLE;
		qDebug() << query.lastError().text();
		return false;
	} else {
		return true;
	}
}
