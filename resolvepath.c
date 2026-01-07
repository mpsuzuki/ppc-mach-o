#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int main(int argc, char **argv)
{
    char resolved[PATH_MAX];
    if (argc < 2) return 1;

    if (realpath(argv[1], resolved) == NULL) {
        return 1;
    }

    printf("%s\n", resolved);
    return 0;
}
