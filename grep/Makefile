CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: _grep test

_grep:
	$(CC) $(CFLAGS) _grep.c -o _grep

test:
	chmod 777 test.sh
	./test.sh

clean:
	rm -f ./_grep
	rm -rf _grepi orig_grepi

rebuild: clean all
