#ifndef SRC_CAT__CAT_H_
#define SRC_CAT__CAT_H_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>

typedef struct flag {
    int b;
    int e;
    int n;
    int s;
    int t;
    int v;
} Token;

void flagonizer_cat(int argc, char *argv[], Token *flag);
void work_flag_cat(FILE *file, Token *flag);
int _cat(int argc, char *argv[]);

#endif // SRC_CAT__CAT_H_
