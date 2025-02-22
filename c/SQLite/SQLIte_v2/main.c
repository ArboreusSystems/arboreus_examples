#include <stdio.h>
#include <sqlite3mc_amalgamation.h>


int main() {

	sqlite3* oDB;
	sqlite3_stmt* oStatement;
	char* oError;
	char* oSQL;
	char* oTail;
	int oResult;
	int oIterator;
	int oNumberOfColumns;


	oResult = sqlite3_open_v2(":memory",&oDB,SQLITE_OPEN_READWRITE|SQLITE_OPEN_CREATE,NULL);
	if (oResult) {
		fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(oDB));
		sqlite3_close(oDB);
		return 1;
	} else {
		fprintf(stdout,"Opened database\n");
	}

	oSQL = "CREATE TABLE IF NOT EXISTS persons (first_name text, last_name text);";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Create table. SQL error: %s\n", oError);
			sqlite3_free(oError);
		}
	} else {
		fprintf(stdout,"Created table\n");
	}

	oSQL = "INSERT INTO persons (first_name, last_name) VALUES ('John', 'Smith')";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Can't insert data for John Smith. SQL error: %s\n", oError);
			sqlite3_free(oError);
		}
	} else {
		fprintf(stdout,"Insert data for John Smith\n");
	}

	oSQL = "INSERT INTO persons (first_name, last_name) VALUES ('Alice', 'Cooper')";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Can't insert data for Alice Cooper. SQL error: %s\n", oError);
			sqlite3_free(oError);
		}
	} else {
		fprintf(stdout,"Insert data for Alice Cooper\n");
	}

	oSQL = "INSERT INTO persons (first_name, last_name) VALUES ('Mat', 'Gilby')";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Can't insert data for Mat Gilby. SQL error: %s\n", oError);
			sqlite3_free(oError);
		}
	} else {
		fprintf(stdout,"Insert data for Mat Gilby\n");
	}

	oSQL = "SELECT * FROM persons";
	oResult = sqlite3_prepare_v2(oDB,oSQL,-1,&oStatement,&oTail);
	if (oResult != SQLITE_OK) {
		fprintf(stderr, "Can't prepare SQL. SQL error: %s\n", oError);
		sqlite3_free(oError);
	} else {
		fprintf(stdout,"SQL prepared\n");
	}

	oResult = sqlite3_step(oStatement);
	oNumberOfColumns = sqlite3_column_count(oStatement);
	while (oResult == SQLITE_ROW) {
		fprintf(stdout,"Data: ");
		for(oIterator = 0; oIterator < oNumberOfColumns; oIterator++) {
			fprintf(stdout,"'%s' ",sqlite3_column_text(oStatement,oIterator));
		}
		fprintf(stdout,"\n");
		oResult = sqlite3_step(oStatement);
	}

	sqlite3_finalize(oStatement);
	sqlite3_close(oDB);

	printf("SQLite_v2\n");

	return 0;
}
