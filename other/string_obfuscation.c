#include <stdio.h>
#include <string.h>

char* obfuscate(char* input){
	int stringLength = strlen(input);
	int i = 0;
	int j = 0;

	char output[stringLength+1];
	strcpy(output, input);

	if (stringLength <= 0) {
		output[j] = 0;
		return output;
	}

	while(j <= stringLength) {
		output[i]= output[j];
		j = j+3;
		i++;
	}
	
	return output;
}

int main() {
	char* testInput = "String sample";
	char* testOutput;

	printf ("%s\n", testInput);
	testOutput = obfuscate(testInput);
	printf ("%s\n", testOutput);

	return 0;
}
