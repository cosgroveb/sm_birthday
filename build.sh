#!/bin/bash

SOURCEMOD_HOME=${SOURCEMOD_HOME-"${HOME}/sourcemod"}
COMPILE_BIN="${SOURCEMOD_HOME}/addons/sourcemod/scripting/spcomp"
CODE_RELATIVE_DIR="addons/sourcemod/scripting"
OUTPUT_RELATIVE_DIR="addons/sourcemod/plugins"

if [ $# -eq 0 ]; then
 echo "Usage: $0 sourcefilename.sp"
 exit 1
fi

sourcefile=$1

smxfile="`echo $sourcefile | sed -e 's/\.sp$/\.smx/'`";

if [ -e $COMPILE_BIN ]; then
  $COMPILE_BIN $CODE_RELATIVE_DIR/$sourcefile -o$OUTPUT_RELATIVE_DIR/$smxfile
  if [ $0 == "0" ]; then
    exit 0;
  fi
else
  echo "${COMPILE_BIN} not found! Set SOURCEMOD_HOME to your sourcemod folder."
  exit 1;
fi

