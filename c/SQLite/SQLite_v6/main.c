#include <stdio.h>
#include <string.h>
#include <sqlite3mc_amalgamation.h>

int fCloseAndFinalize(sqlite3_stmt* inStatement,sqlite3* inDB,int inValue) {

	sqlite3_finalize(inStatement);
	sqlite3_close(inDB);
	return inValue;
}

int main() {

	sqlite3* oDB;
	sqlite3_stmt* oStatement;
	char* oError;
	char* oSQL;
	int oResult;
	int oIterator;
	int oNumberOfColumns;

	oResult = sqlite3_open_v2(":memory",&oDB,SQLITE_OPEN_READWRITE|SQLITE_OPEN_CREATE,NULL);
	if (oResult) {
		fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(oDB));
		return fCloseAndFinalize(oStatement,oDB,-1);
	} else {
		fprintf(stdout,"Opened database\n");
	}

	oSQL = "CREATE TABLE IF NOT EXISTS data_table (value1 int, value2 int, value3 int, value4 int);";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Create table. SQL error: %s\n", oError);
			sqlite3_free(oError);
			return fCloseAndFinalize(oStatement,oDB,-1);
		}
	} else {
		fprintf(stdout,"Created table\n");
	}

	int oData[][4] = {
		{1,2,4,5555},
		{1055,11,12,13},
		{14,15,16,17},
		{18,1955,20,21}
	};

	oSQL = "INSERT INTO data_table (value1, value2, value3, value4) VALUES (:1,:2,:3,:4);";

	for (oIterator = 0; oIterator < sizeof(oData) / sizeof(oData[0]); oIterator++) {
		oResult = sqlite3_prepare_v2(oDB,oSQL,strlen(oSQL),&oStatement,NULL);
		if (oResult != SQLITE_OK) {
			fprintf(stderr, "Inserting Data. SQL error: %s\n", oError);
			sqlite3_free(oError);
			return fCloseAndFinalize(oStatement,oDB,-1);
		} else {
			sqlite3_bind_int(oStatement,1,oData[oIterator][0]);
			sqlite3_bind_int(oStatement,2,oData[oIterator][1]);
			sqlite3_bind_int(oStatement,3,oData[oIterator][2]);
			sqlite3_bind_int(oStatement,4,oData[oIterator][3]);
			sqlite3_step(oStatement);
		}
	}

	oSQL = "SELECT * FROM data_table";

	oResult = sqlite3_prepare_v2(oDB,oSQL,strlen(oSQL),&oStatement,NULL);
	if (oResult != SQLITE_OK) {
		fprintf(stderr, "Selecting data. SQL error: %s\n", oError);
		sqlite3_free(oError);
		return fCloseAndFinalize(oStatement,oDB,-1);
	} else {
		oResult = sqlite3_step(oStatement);
		oNumberOfColumns = sqlite3_column_count(oStatement);
		while (oResult == SQLITE_ROW) {
			fprintf(stdout,"Data: ");
			for(oIterator = 0; oIterator < oNumberOfColumns; oIterator++) {
				fprintf(
					stdout,"'%s'(%d) ",
					sqlite3_column_text(oStatement,oIterator),
					sqlite3_column_type(oStatement,oIterator)
				);
			}
			fprintf(stdout,"\n");
			oResult = sqlite3_step(oStatement);
		}
	}

	oSQL = "DROP TABLE data_table;";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Drop table. SQL error: %s\n", oError);
			sqlite3_free(oError);
			return fCloseAndFinalize(oStatement,oDB,-1);
		}
	} else {
		fprintf(stdout,"Dropped table\n");
	}

	printf("SQLite_v6\n");

	return fCloseAndFinalize(oStatement,oDB,0);
}
