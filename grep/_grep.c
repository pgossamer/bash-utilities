#include "_grep.h"

int main(int argc, char *argv[]) {
  Tokens flags;
  FILE *file = NULL;
  memset(&flags, 0, sizeof(flags));
  char format[999] = {0};
  char files_name[128] = {0};
  for (int i = 1; i < argc; i++) {
    if (argv[1][0] != '-') {
      strcpy(format, argv[1]);
      flags.no_option = 1;
      if ((file = fopen(argv[i], "r")) != NULL) {
        snprintf(files_name, 128, "%s", argv[i]);
        work_flag_grep(&flags, file, format, argc, argv, files_name);
        fclose(file);
      }
    } else {
      flagonizer_grep(argc, argv, &flags, format);
      if ((file = fopen(argv[i], "r")) != NULL) {
        snprintf(files_name, 128, "%s", argv[i]);
        work_flag_grep(&flags, file, format, argc, argv, files_name);
        fclose(file);
      }
    }
  }
  return 0;
}

void flagonizer_grep(int argc, char *argv[], Tokens *flags, char *format) {
  char res;
  while ((res = getopt(argc, argv, "e:i:v:c:l:n:h:s:o:")) != -1) {
    if (res) {
      if (res == 'e') {
        flags->e = 1;
        snprintf(format, MAX, "%s", optarg);
      }
      if (res == 'i') {
        flags->i = 1;
        snprintf(format, MAX, "%s", optarg);
      }
      if (res == 'v') {
        flags->v = 1;
        snprintf(format, MAX, "%s", optarg);
      }
      if (res == 'c') {
        flags->c = 1;
        snprintf(format, MAX, "%s", optarg);
      }
      if (res == 'l') {
        flags->l = 1;
        snprintf(format, MAX, "%s", optarg);
      }
      if (res == 'n') {
        flags->n = 1;
        snprintf(format, MAX, "%s", optarg);
      }
      if (res == 'h') {
        flags->h = 1;
        snprintf(format, MAX, "%s", optarg);
      }
      if (res == 's') {
        flags->s = 1;
        snprintf(format, MAX, "%s", optarg);
      }
    }
  }
}

void work_flag_grep(Tokens *flags, FILE *file, char *format, int argc,
                    char *argv[], char *files_name) {
  char *str = NULL;
  size_t mas = 0;
  regmatch_t pmatch[2];
  regex_t regex;
  int reg = 0;
  reg = regcomp(&regex, format, REG_EXTENDED);
  size_t nmatch = 2;
  int count_str = 0, count_nmbr = 0;
  while (getline(&str, &mas, file) != EOF) {
    if (flags->e) {
      flag_e(argc, argv, files_name, regex, pmatch, reg, str, nmatch);
    }
    if (flags->no_option) {
      flag_no_option(argc, argv, files_name, regex, pmatch, reg, str, nmatch);
    }
    if (flags->v) {
      flag_v(argc, argv, files_name, regex, pmatch, reg, str, nmatch);
    }
    if (flags->c) {
      if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
      reg = regexec(&regex, str, nmatch, pmatch, REG_NEWLINE);
      if (!reg) count_str++;
    }
    if (flags->i) {
      reg = regcomp(&regex, format, REG_ICASE | REG_NEWLINE);
      flag_i(argc, argv, files_name, regex, pmatch, reg, str, nmatch);
    }
    if (flags->l) {
      if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
      reg = regexec(&regex, str, nmatch, pmatch, REG_NEWLINE);
      if (!reg) {
        printf("%s\n", files_name);
        break;
      }
    }
    if (flags->n) {
      flag_n(argc, argv, files_name, regex, pmatch, reg, str, nmatch,
             count_nmbr);
      count_nmbr++;
    }
    if (flags->h) {
      if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
      reg = regexec(&regex, str, nmatch, pmatch, REG_NEWLINE);
      if (!reg) printf("%s", str);
    }
    if (flags->s) {
      flag_s(argc, argv, files_name, regex, pmatch, reg, str, nmatch);
    }
  }
  if (flags->c) {
    if (argc <= 4) {
      printf("%d\n", count_str);
    } else {
      if (argv) printf("%s:%d\n", files_name, count_str);
    }
  }
  count_str = 0;
  count_nmbr = 0;
  regfree(&regex);
  if (str != NULL) free(str);
}

void flag_n(int argc, char *const argv[], char *files_name, regex_t regex,
            regmatch_t pmatch[], int reg, char *str, size_t nmatch,
            int count_nmbr) {
  if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
  reg = regexec(&regex, str, nmatch, pmatch, REG_NEWLINE);
  count_nmbr++;
  if (argc <= 4) {
    if (!reg) printf("%d:%s", count_nmbr, str);
  } else {
    if (!reg) {
      if (argv) printf("%s:%d:%s", files_name, count_nmbr, str);
    }
  }
}

void flag_s(int argc, char *const argv[], char *files_name, regex_t regex,
            regmatch_t pmatch[], int reg, char *str, size_t nmatch) {
  if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
  reg = regexec(&regex, str, nmatch, pmatch, REG_NEWLINE);
  if (!reg) {
    if (argc <= 4) printf("%s", str);
  } else {
    if (argv) printf("%s:%s", files_name, str);
  }
}

void flag_e(int argc, char *const argv[], char *files_name, regex_t regex,
            regmatch_t pmatch[], int reg, char *str, size_t nmatch) {
  if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
  reg = regexec(&regex, str, nmatch, pmatch, REG_NEWLINE);
  if (!reg) {
    if (argc <= 4) {
      printf("%s", str);
    } else {
      if (argv) printf("%s:%s", files_name, str);
    }
  }
}

void flag_no_option(int argc, char *const argv[], char *files_name,
                    regex_t regex, regmatch_t pmatch[], int reg, char *str,
                    size_t nmatch) {
  if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
  reg = regexec(&regex, str, nmatch, pmatch, REG_NEWLINE);
  if (!reg) {
    if (argc <= 3) {
      printf("%s", str);
    } else {
      if (argv) printf("%s:%s", files_name, str);
    }
  }
}

void flag_v(int argc, char *const argv[], char *files_name, regex_t regex,
            regmatch_t pmatch[], int reg, char *str, size_t nmatch) {
  if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
  reg = regexec(&regex, str, nmatch, pmatch, REG_NEWLINE);
  if (argc <= 4) {
    if (reg) printf("%s", str);
  } else {
    if (reg) {
      if (argv) printf("%s:%s", files_name, str);
    }
  }
}

void flag_i(int argc, char *const argv[], char *files_name, regex_t regex,
            regmatch_t pmatch[], int reg, char *str, size_t nmatch) {
  if (str[(int)strlen(str) - 1] != '\n') strncat(str, "\n", 2);
  reg = regexec(&regex, str, nmatch, pmatch, 0);
  if (argc <= 4) {
    if (!reg) printf("%s", str);
  } else {
    if (!reg) {
      if (argv) printf("%s:%s", files_name, str);
    }
  }
}
