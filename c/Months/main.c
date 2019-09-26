#include <stdio.h>

int main() {

    static char *oMonths[] = {
		"January", "February", "March",
		"April", "May", "June",
		"July", "August", "September",
		"October", "November", "December"
    };
    for (int i = 0; i < sizeof(oMonths) / sizeof(char*); i++) {
    	printf("%d:%s\n",i+1,oMonths[i]);
    }

    char oMonthAlpha3[4];
	for (int j = 0; j < sizeof(oMonths) / sizeof(char*); j++) {
		oMonthAlpha3[0] = oMonths[j][0];
		oMonthAlpha3[1] = oMonths[j][1];
		oMonthAlpha3[2] = oMonths[j][2];
		oMonthAlpha3[3] = 0;§
		printf("%s\n",oMonthAlpha3);
	}

    return 0;
}