#include <stddef.h>
#include <stdio.h>
#include "cJSON/cJSON.h"

int main(int argc, char *argv[])
{
	char *line = NULL;
	size_t size;
	cJSON *root;

	while (getline(&line, &size, stdin) != -1)
	{
		root = cJSON_Parse(line);
		if (root != 0)
			printf("%s", line);
	}

	return 0;
}
