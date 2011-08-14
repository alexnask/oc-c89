#!/bin/sh

echo $0

export OOC_LIBS=..

mkdir -p bin .libs

if [[ ! -e $PREFIX ]]; then
    export PREFIX=$PWD/prefix
    mkdir -p $PREFIX
fi

if [[ ! -e $LIBDIR ]]; then
    export LIBDIR=$PREFIX/lib
    mkdir -p $LIBDIR
fi

echo Library directory is $LIBDIR

OC_DIST=../oc
OOC_FLAGS="-v -g -nolines +-rdynamic"

mkdir -p $OC_DIST/plugins
rock $OOC_FLAGS -packagefilter=backend/c89/ -dynamiclib=$OC_DIST/plugins/c89_backend.so -sourcepath=source backend/c89/Backend 
