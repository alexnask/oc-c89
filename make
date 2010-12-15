#!/bin/sh
export OOC_LIBS=..

OC_DIST=../oc
OOC_FLAGS="-v -g -nolines +-rdynamic"

mkdir -p $OC_DIST/plugins
rock $OOC_FLAGS -packagefilter=backend/c89/ -dynamiclib=$OC_DIST/plugins/c89_backend.so -sourcepath=source backend/c89/Backend 
