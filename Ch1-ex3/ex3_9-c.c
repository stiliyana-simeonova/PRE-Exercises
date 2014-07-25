#include <stdio.h>

char *strrchrA(const char *string, char c) {

	char *result=0;
	do {
		if (*string==c) {
			result = (char*) string;
		}
	} while (*string++);

	return result;	
}


char *strrchrB(const char *string, char c) {

	if (!string)
		return 0;
	char *result=0;
	while(*string!='\0'){
		if(*string==c)
			result = (char*)string;
		*string++;
	}

	return result;
}


int main() {

	char *string = "Test stringi123";
	char *result1 = strrchrA(string, 'i');
	char *result2 = strrchrB(string, 'i');
	if (result1==0) {
		printf("Not found!\n");
	}
	else {
		printf("Found: %s\n", result1);
	}

	if (result2==0) {
		printf("Not found!\n");
	}
	else {
		printf("Found: %s\n", result2);
	}
	
	return 0;	

}
