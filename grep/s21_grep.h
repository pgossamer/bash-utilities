#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>
#include <regex.h>

#define MAX 3999

typedef struct flags {
    int e;
    int i;
    int v;
    int c;
    int l;
    int n;
    int h;
    int s;
    int no_option;
} Tokens;

void flagonizer_grep(int argc, char *argv[], Tokens *flags, char *format);
void work_flag_grep( Tokens *flags, FILE *file, char *man, int argc, char *argv[], char *files_name);
int s21_grep(int argc, char *argv[]);
void flag_i(int argc, char *const argv[], char *files_name, regex_t regex, regmatch_t pmatch[], int reg, char *str, size_t nmatch);
void flag_e(int argc, char *const argv[], char *files_name, regex_t regex, regmatch_t pmatch[], int reg, char *str, size_t nmatch);
void flag_no_option(int argc, char *const argv[], char *files_name, regex_t regex, regmatch_t pmatch[], int reg, char *str, size_t nmatch);
void flag_v(int argc, char *const argv[], char *files_name, regex_t regex, regmatch_t pmatch[], int reg, char *str, size_t nmatch);
void flag_s(int argc, char *const argv[], char *files_name, regex_t regex, regmatch_t pmatch[], int reg, char *str, size_t nmatch);
void flag_n(int argc, char *const argv[], char *files_name, regex_t regex, regmatch_t pmatch[], int reg, char *str, size_t nmatch, int count_nmbr);

#endif // SRC_GREP_S21_GREP_H_
