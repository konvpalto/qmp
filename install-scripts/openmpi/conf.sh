#!/bin/sh
#
# Configures QMP for OpenMPI-powered build.

PREFIX="$HOME"/lattice-qcd/prefix
export CC=mpicc
export CXX=mpicxx
: ${CFLAGS:='-O3 -Wall -Werror'}
export CFLAGS

if ! [ -d "$PREFIX" ]; then
	echo "Directory '${PREFIX}' does not exist." >&2
	exit 1
fi

if [ -z "$(which "$CC" 2>/dev/null)" ]; then
	echo "No C compiler '$CC'.  Check PATH or activate proper environment." >&2
	exit 1
fi

if [ -z "$(which "$CXX" 2>/dev/null)" ]; then
	echo "No C++ compiler '$CXX'.  Check PATH or activate proper environment." >&2
	exit 1
fi

./configure --prefix="$PREFIX" --with-qmp-comms-type=MPI
