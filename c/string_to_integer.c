// -------------------------------------------------------------------
// @author Alexandr KIRILOV
// @copyright (C) 2019, http://arboreus.system
// @doc Arboreus Examples of converting string to integer
//
// @end
// Created : 01/03/2019 at 19:20
// -------------------------------------------------------------------

// System includes
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Application includes
#include "headers/string_to_integer.h"


// Convert string to integer by pointer
int by_pointer(char *String, long long int *Number){
	
	size_t Size = strlen(String);
	int i = 0;
	int Sign = 1;
	int Cipher = 0;
	
	if (Size < 20){
		if (String[0] == '-'){
			Sign = -1; i++;
		}
		for(;i < Size; i++){
			Cipher = acnv_char_to_cipher((int)String[i]);
			if (Cipher < 0){
				return -3;
			} else {
				*Number = *Number * 10 + Cipher;
			}
		}
		*Number = *Number * Sign;
		return EXIT_SUCCESS;
	} else {
		return -2;
	}
}


// Convert string to integer by pointer
long long int return_int(char *String){
	
	long long int Number = 0;
	size_t Size = strlen(String);
	int i = 0;
	int Sign = 1;
	int Cipher = 0;
	
	if (String[0] == '-'){
		Sign = -1; i++;
	}
	for(;i < Size; i++){
		Cipher = acnv_char_to_cipher((int)String[i]);
		if (Cipher < 0){
			return -3;
		} else {
			Number = Number * 10 + Cipher;
		}
	}
	
	return Number * Sign;
}


// Convert unicode char to cipher
int acnv_char_to_cipher(int Char){
	
	int Cipher = Char - '0';
	
	if (Cipher < 0){
		return -1;
	} else if(Cipher > 9){
		return -1;
	} else {
		return (Char - '0');
	}
}