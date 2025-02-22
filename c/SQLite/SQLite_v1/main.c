#include <stdio.h>
#include <sqlite3mc_amalgamation.h>

int fCallback(void* inData, int inColumns, char** inValues, char** inHeaders) {

	int i;

	fprintf(stderr, "%s: ", (const char*)inData);
	for(i = 0; i < inColumns; i++) {
		fprintf(stderr, "%s=%s ", inHeaders[i], inValues[i]);
	}
	fprintf(stderr, "\n");

	return 0;
}


int main() {

	sqlite3* oDB;
	char* oError;
	int oResult;
	char* oSQL;

	oResult = sqlite3_open(":memory",&oDB);
	if (oResult) {
		fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(oDB));
		sqlite3_close(oDB);
		return 1;
	}

	oSQL = "CREATE TABLE persons (first_name text, last_name text);";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Create table. SQL error: %s\n", oError);
			sqlite3_free(oError);
		}
	}

	oSQL = "INSERT INTO persons (first_name, last_name) VALUES ('John', 'Smith')";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Insert data for John Smith. SQL error: %s\n", oError);
			sqlite3_free(oError);
		}
	}

	oSQL = "INSERT INTO persons (first_name, last_name) VALUES ('John', 'Smith Junior')";
	oResult = sqlite3_exec(oDB,oSQL,NULL,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Insert data for John Smith Junior. SQL error: %s\n", oError);
			sqlite3_free(oError);
		}
	}

	oSQL = "SELECT * FROM persons";
	oResult = sqlite3_exec(oDB,oSQL,fCallback,NULL,&oError);
	if (oResult != SQLITE_OK) {
		if (oError != NULL) {
			fprintf(stderr, "Insert data for John Smith Junior. SQL error: %s\n", oError);
			sqlite3_free(oError);
		}
	}

	printf("SQLite_v1\n");

	sqlite3_close(oDB);
	return 0;
}
