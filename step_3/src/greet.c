#include <stdio.h>
#include <stdlib.h>

#include "greet.h"


void
hello_doctor(void) {
#if defined(DR_NAME)
	printf("Hello, Dr. %s!\n", DR_NAME);
#else
	printf("Hello, Dr. Who!\n");
#endif
}
