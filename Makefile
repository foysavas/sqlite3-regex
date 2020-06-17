ifeq ($(OS),Windows_NT)
    OUT_EXT := dll
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        OUT_EXT := so
		INSTALL_DIR=/usr/local
    endif
    ifeq ($(UNAME_S),Darwin)
        OUT_EXT := dylib
		INSTALL_DIR=/usr/local
    endif
endif

CC=g++
INSTALL=install
CFLAGS=$(shell pkg-config --cflags sqlite3) -fPIC
LIBS=-lboost_regex

.PHONY : clean

build :
	mkdir -p dist/
	${CC} -O3 -fPIC -std=c++11 -shared sqlite3-regexp.cpp -o dist/sqlite3-regexp.${OUT_EXT} ${CFLAGS} -W -Werror -Wno-unused-parameter ${LIBS}

clean :
	-rm -rf dist/

add_to_rc : build
	echo ".load '`pwd`/dist/sqlite3-regexp.${OUT_EXT}'" >> ~/.sqliterc