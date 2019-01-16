/* ------------------------------------------
 * @author Alexandr KIRILOV
 * @copyright (C) 2019, http://arboreus.system
 * @doc Arboreus C++ Examples. Handling files 01
 *
 * @end
 * Created : 01/16/2019 at 17:34
*///-----------------------------------------

#include <iostream>
#include <fstream>

using namespace std;

int main()
{

	string File_name = "test_filestream.txt";
	string Test_messsage = "Test_message_for_file_stream";
	int Test_number = 111;

	ofstream OFS(File_name);
	OFS << Test_messsage << endl << Test_number << endl;
	OFS.close();

	string Text_from_file;
	int Number_from_file;

	ifstream IFS(File_name);
	IFS >> Text_from_file >> Number_from_file;
	cout << "Text from file: " << Text_from_file << endl;
	cout << "Number from file: " << Number_from_file << endl;

	cout << endl <<"-------------------" << endl;
	cout << "Arboreus file read/write example." << endl;

	return 0;
}
