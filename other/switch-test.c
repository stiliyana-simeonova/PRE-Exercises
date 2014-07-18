#include <stdio.h>

int main() {
	int choice=3;
	int outcome=0;

	switch(choice) {
		case 0:
		case 1:
			outcome=40;
			break;
		case 2:
		case 5:
			outcome=30;
			break;
		case 3:
			outcome=20;
			break;
		case 4:
			outcome=48;
			break;
		dedault:
			printf("Default message/n");
			break;	
	}
	printf("The outcome is: %d\n", outcome);

	return 0;
}
