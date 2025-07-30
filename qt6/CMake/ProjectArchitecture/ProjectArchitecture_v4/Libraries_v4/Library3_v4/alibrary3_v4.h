#ifndef ALIBRARY3_V4_H
#define ALIBRARY3_V4_H

#include <iostream>
#include <alibrary2_v4.h>

using namespace std;

class ALibrary3_v4 {

	public:

		ALibrary3_v4(void);
		~ALibrary3_v4(void);

	private:

		ALibrary2_v4* pLibrary2 = nullptr;
};

#endif // ALIBRARY3_V4_H
