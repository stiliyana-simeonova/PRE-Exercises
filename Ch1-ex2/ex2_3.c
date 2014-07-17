#include <stdio.h>
#include <stdlib.h>
#include <string.h> 

char* stringConcat(char* s1, char* s2) {
	char* result = malloc(strlen(s1)+strlen(s2)+1);
	strcpy(result, s1);
        strcat(result, s2);
	return result;
}

int main() {
	char* r;
	char* a = "Test ";
	char* b = "string";
	r = stringConcat(a, b);

	return 0;
}
