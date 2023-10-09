A_DIR_ROOT = $(shell pwd)
A_UNAME := $(shell uname)
A_COMPILER = g++
A_COMPILER_FLAGS = -fPIC -shared

ifeq (${A_UNAME}, Darwin)
	A_COMPILER_FLAGS := ${A_COMPILER_FLAGS} -undefined dynamic_lookup -std=c++17
endif
ifeq (${A_UNAME}, Linux)
	A_COMPILER_FLAGS := ${A_COMPILER_FLAGS}
endif

A_MAKEFILE_CONFIG = ${A_DIR_ROOT}/../../../../Makefile.conf
ifneq ("$(wildcard ${A_MAKEFILE_CONFIG})","")
  $(info using ${A_MAKEFILE_CONFIG})
  include ${A_MAKEFILE_CONFIG}
else
  $(error No config file ${A_MAKEFILE_CONFIG})
endif

INCLUDES += \
	-I${A_DIR_INCLUDES_ERLANG}

DIR_LIBS +=

LIBS +=

HEADERS += \
	aniftest.h

SOURCES += \
	nif_v3.cpp \
	aniftest.cpp 
	

# ----------------------------------------------
# Targets

all: clean build

clean:

#	rm write_stream_v1.so
#	rm write_stream_v1.beam

build:
	g++ --verbose -o nif_v3.so -undefined dynamic_lookup -fPIC -shared -std=c++11 ${SOURCES} ${INCLUDES} ${DIR_LIBS} ${LIBS}
