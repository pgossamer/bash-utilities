CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: s21_grep test

s21_grep:
	$(CC) $(CFLAGS) s21_grep.c -o s21_grep

test:
	chmod 777 test.sh
	./test.sh

clean:
	rm -f ./s21_grep
	rm -rf s21_grepi orig_grepi

rebuild: clean all
