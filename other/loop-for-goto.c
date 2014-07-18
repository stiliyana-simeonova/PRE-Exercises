#include <stdio.h>

int main() {
	int i=0;
	loop_start:
		if(i<10) {
			printf("%d\n",i);
			i++;
			goto loop_start;
		}

	printf("Done!\n");
	return 0;
}
