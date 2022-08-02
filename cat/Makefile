CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: _cat test

_cat:
	$(CC) $(CFLAGS) _cat.c -o _cat

test: _cat
	chmod 777 test.sh
	./test.sh

clean:
	rm -f ./_cat
	rm -rf _cat.txt orig_cat.txt

rebuild: clean all
