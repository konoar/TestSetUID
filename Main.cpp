#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>

int main (void)
{

	printf("uid: %d\n", geteuid());

	FILE *fp = fopen("./data.txt", "w"); {

		if (!fp) {
			printf("cannot open file!\n");
			return 1;
		}

		fprintf(fp, "Hello SetUID World.\n");

	} fclose(fp);

	return 0;

}

