// -------------------------------------------------------------------
// @author Alexandr KIRILOV
// @copyright (C) 2019, http://arboreus.system
// @doc Arboreus Examples of converting integer to string
//
// @end
// Created : 01/03/2019 at 15:06
// -------------------------------------------------------------------

// System includes
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Application includes
#include "headers/integer_to_string.h"


// Put the string into the array by pointer
int by_pointer(long long int Number, char **String){
	
	char Output[20];
	long long int Sign = 0;
	int Counter = 0;
	
	if ((Sign = Number) < 0){Sign = -Sign;}
	do {
		Output[Counter++] = acnv_cipher_to_char((int)(Sign % 10));
	} while ((Sign /= 10) > 0);
	if (Number < 0){
		Output[Counter++] = '-';
	}
	Output[Counter] = '\0';
	astr_reverse(Output);
	*String = malloc(Counter * sizeof(char));
	if (*String != NULL){
		strcpy(*String,Output);
		return EXIT_SUCCESS;
	} else {
		return EXIT_FAILURE;
	}
}


// Return the string
char *return_string(long long int Number){

	char *Output;
	char Buffer[20];
	long long int Sign = 0;
	int Counter = 0;

	if ((Sign = Number) < 0){Sign = -Sign;}
	do {
		Buffer[Counter++] = acnv_cipher_to_char((int)(Sign % 10));
	} while ((Sign /= 10) > 0);
	if (Number < 0){
		Buffer[Counter++] = '-';
	}
	Buffer[Counter] = '\0';
	astr_reverse(Buffer);
	Output = malloc(Counter * sizeof(char));
	strcpy(Output,Buffer);
	return Output;
}


// Original from book
void itoa(long long int n, char *s[]){
	
	long long int i, sign;
	
	if ((sign = n) < 0)
		n = -n;
	i = 0;
	do {
		s[i++] = (char *)(n % 10 + '0');
	} while ((n /= 10) > 0);
	if (sign < 0)
		*s[i++] = '-';
	*s[i] = '\0';
	astr_reverse(*s);
}


// Convert cipher to unicode char
char acnv_cipher_to_char(int Cipher){
	return (char)('0' + Cipher);
}


// Reverse string
int astr_reverse(char *String){
	
	int i = 0;
	size_t Length = strlen(String) - 1;
	char Output;
	
	for (; i < Length; i++, Length--) {
		Output = String[i];
		String[i] = String[Length];
		String[Length] = Output;
	}
	
	return EXIT_SUCCESS;
}