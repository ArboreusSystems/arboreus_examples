#ifndef LIBRARY3_V4_H
#define LIBRARY3_V4_H

#include <iostream>
#include <library2_v4.h>

using namespace std;

class Library3_v4 {

	public:

		Library3_v4(void);
		~Library3_v4(void);

	private:

		Library2_v4* pLibrary2 = nullptr;
};

#endif // LIBRARY3_V4_H
