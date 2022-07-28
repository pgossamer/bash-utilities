CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: s21_cat test

s21_cat:
	$(CC) $(CFLAGS) s21_cat.c -o s21_cat

test: s21_cat
	chmod 777 test.sh
	./test.sh

clean:
	rm -f ./s21_cat
	rm -rf s21_cat.txt orig_cat.txt

rebuild: clean all
