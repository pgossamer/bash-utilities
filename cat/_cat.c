#include "_cat.h"

int main(int argc, char *argv[]) {
    Token flag;
    FILE *file;
    memset(&flag, 0, sizeof(flag));
    for (int i = 1; i < argc; i++) {
        if (argv[i][0] != '-') {
            if ((file = fopen(argv[i], "r")) != NULL) {
                work_flag_cat(file, &flag);
                fclose(file);
            } else {
                printf("ERROR\n");
            }
        } else {
            flagonizer_cat(argc, argv, &flag);
        }
    }
    return 0;
}

void flagonizer_cat(int argc, char *argv[], Token *flag) {
    const struct option longopts[] = {
        {"--number-nonblan", 0, 0, 'b'},
        {"--number", 0, 0, 'n'},
        {"--squeeze-blank", 0, 0, 's'},
        {0, 0, 0, 0}
    };
    char res;
    while ((res = getopt_long(argc, argv, "benstETv", longopts, 0)) != -1) {
        if (res == 'b') {
            flag->b = 1;
        }
        if (res == 'e' || res == 'E') {
            flag->e = 1;
        }
        if (res == 'n') {
            flag->n = 1;
        }
        if (res == 's') {
            flag->s = 1;
        }
        if (res == 't' || res == 'T') {
            flag->t = 1;
        }
        if (res == 'v') {
            flag->v = 1;
        }
    }
}

void work_flag_cat(FILE *file, Token *flag) {
    char str;
    int count = 1, null_str = 0, len_str = 0, count2 = 1;
    while ((str = fgetc(file)) != EOF) {
        if (flag->s == 1) {
            if (str == '\n') {
                count2++;
                if (count2 > 2) continue;
            }
            if (str != '\n') count2 = 0;
        }
        if (str != '\n') null_str = 0;
        if (flag->b == 1 && len_str == 0 && null_str < 3 && str != '\n') {
            printf("%6d\t", count++);
        }
        if (flag->n == 1 && !flag->b && len_str == 0) {
            printf("%6d\t", count++);
        }
        if (flag->e == 1 && str == '\n') {
            if (!flag->s) {
                printf("$");
            } else {
                if (null_str < 3) printf("$");
            }
        }
        if (flag->v == 1 && (flag->e == 1 || flag->t == 1)) {
            if (str < 32 && str != 10 && str != 9 && str != 12) {
                printf("^%c", str + 64);
            }
        }
        if (str == '\t' && flag->t && null_str < 3) {
            printf("^I");
        } else {
            putchar(str);
        }
        len_str++;
        if (str == '\n') {
            null_str = 0;
            len_str = 0;
        } else {
            null_str++;
        }
    }
}
