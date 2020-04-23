SHELL=/bin/sh

# Makefile for WordNet 3.0 "tight", minimalist cmd line program generator 
# 4/17/2020 Dalton Bentley mod of Princeton software and dictionary

# CC make intrinsic variable compiler for c files
CC = gcc

# -O try reduce code size and speed up a little
LOCAL_CFLAGS = -O -DUNIX
# look in current directory for the include file
CFLAGS = -I. $(LOCAL_CFLAGS)
# compile of library source uses CFLAGS implicit

# static linking only, i.e., no dynamic linking; look for our lib in current dir .
LINK_FLAGS = -static -L.

# gcc flag -l to search library named "libwn.a" when linking into executable
WN_LIB = -lwn
LIB_ARCH = libwn.a

# library code source and objects
LIB_SRC = binsrch.c  morph.c  search.c  wnglobal.c  wnhelp.c  wnrtl.c  wnutil.c
LIB_OBJ = binsrch.o  morph.o  search.o  wnglobal.o  wnhelp.o  wnrtl.o  wnutil.o

# interface code to make library wordnet functions available to user in terminal
INTERFACE_SRC = wn.c
INTERFACE_OBJ = wn.o

# the single include used by interface and library code
WN_INCLUDE = wn.h

# the executable for the cmd line version of WordNet is wn, will be our target
WN_EXEC = wn

# default phony target "all" if you invoke simply "make" (or make all), depend on exec goal
all : $(WN_EXEC) 

# when prerequisite objects and .a are satisfied, link the objects and .a in final wn
$(WN_EXEC) : $(INTERFACE_OBJ) $(LIB_ARCH)
	$(CC) -o $(WN_EXEC) $(INTERFACE_OBJ) $(WN_LIB) $(LINK_FLAGS)

# capture dependency on header by interface and library c source:
$(INTERFACE_OBJ) : $(WN_INCLUDE)
$(LIB_OBJ) : $(WN_INCLUDE)

# compile interface code; required explicit use of CFLAGS since recipe stated
$(INTERFACE_OBJ) : $(INTERFACE_SRC)
	$(CC) $(CFLAGS) -c $(INTERFACE_SRC)

# compile library source implicitly, update library archive and its index
# it should use CFLAGS implicitly
$(LIB_ARCH) : $(LIB_OBJ)
	ar rcv $(LIB_ARCH) $(LIB_OBJ); ranlib $(LIB_ARCH)





