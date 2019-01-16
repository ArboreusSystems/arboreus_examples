/* ------------------------------------------
 * @author Alexandr KIRILOV
 * @copyright (C) 2019, http://arboreus.system
 * @doc Arboreus C++ Examples. Handling files 02
 *
 * @end
 * Created : 01/16/2019 at 17:39
*///-----------------------------------------

#include <fstream>
#include <iostream>
#include <string>

using namespace std;

int main()
{

	string File_name = "test_filestream.txt";
	ofstream OFS(File_name);
	int i = 0;
	for (; i < 10; i++) cout << i << endl;
	OFS.close();

	string Text_from_file;
	ifstream IFS(File_name);

	if (!IFS) {
		cout << "Error! No file" << endl;
		return -1;
	}

	while (getline(IFS,Text_from_file)){
		cout << "From file: " << Text_from_file << endl;
	}

	IFS.close();

	cout << endl <<"-------------------" << endl;
	cout << "Arboreus file read/write example." << endl;

	return 0;
}
