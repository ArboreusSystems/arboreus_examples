#include <stdio.h>
#include <string.h>
#include <sqlite3mc_amalgamation.h>


int main() {

	sqlite3* oDB;
	sqlite3_stmt* oStatement;
	char* oError;
	char* oSQL;
	char* oTail;
	char* oName;
	int oResult;
	int oIterator;
	int oNumberOfColumns;
	int oID;
	int oCID;

	oResult = sqlite3_open_v2(":memory",&oDB,SQLITE_OPEN_READWRITE|SQLITE_OPEN_CREATE,NULL);
	if (oResult) {
		fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(oDB));
		sqlite3_close(oDB);
		return 1;
	} else {
		fprintf(stdout,"Opened database\n");
	}

	oSQL =
		"CREATE TABLE IF NOT EXISTS persons (first_name text, last_name text, age int, height real);"
		"INSERT INTO persons (first_name, last_name, age, height) VALUES ('John','Smith',12,4.4);"
		"INSERT INTO persons (first_name, last_name, age, height) VALUES ('Alice','Cooper',35,3.8);"
		"INSERT INTO persons (first_name, last_name, age, height) VALUES ('Mat','Gilby',45,5.2);";

	while (sqlite3_complete(oSQL)) {

		oResult = sqlite3_prepare_v2(oDB,oSQL,-1,&oStatement,&oTail);
		if (oResult != SQLITE_OK) {
			fprintf(stderr,"Can't prepare SQL. SQL error: %s\n",oError);
			sqlite3_free(oError);
		} else {
			fprintf(stdout,"SQL prepared\n");
		}

		oResult = sqlite3_step(oStatement);
		oNumberOfColumns = sqlite3_column_count(oStatement);
		while (oResult == SQLITE_ROW) {
			oResult = sqlite3_step(oStatement);
		}

		oSQL = oTail;
	}

	oSQL = "SELECT first_name, last_name FROM persons";
	oResult = sqlite3_prepare_v2(oDB,oSQL,strlen(oSQL),&oStatement,NULL);
	oNumberOfColumns = sqlite3_column_count(oStatement);
	oResult = sqlite3_step(oStatement);

	for(oIterator = 0; oIterator < oNumberOfColumns; oIterator++) {
		fprintf(
			stdout, "Column: name=%s, storage class=%i, declared=%s\n",
			sqlite3_column_name(oStatement,oIterator),
			sqlite3_column_type(oStatement,oIterator),
			sqlite3_column_decltype(oStatement,oIterator)
		);
	}
	fprintf(stdout,"\n");

	sqlite3_finalize(oStatement);
	sqlite3_close(oDB);

	printf("SQLite_v5\n");

	return 0;
}
