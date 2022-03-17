#!/bin/bash

export LANG="fr_FR.UTF-8"

usage() {
echo "Usage :script.sh
        -C Catalogue & Schemat 
        -E Event  
        -P Procedure
        -T TRIGGERS 
        -TB Table 
        -V View"
exit 2
}

if [ "${8}" = "" ]; then usage; fi

ARGS=$(echo "$@" |sed -e 's:-[a-Z] :\n&:g' | sed -e 's: ::g')

for i in $ARGS; do
        if echo "${i}" | grep -q "^\-C"; then CATALOGUE=$(echo "${i}" | cut -c 3-); if [ -z "${CATALOGUE}" ]; then usage;fi;fi
        if echo "${i}" | grep -q "^\-E"; then EVENT=$(echo "${i}" | cut -c 3-); if [ -z "${EVENT}" ]; then usage;fi;fi
        if echo "${i}" | grep -q "^\-P"; then PROCEDURE=$(echo "${i}" | cut -c 3-); if [ -z "${PROCEDURE}" ]; then usage;fi;fi
        if echo "${i}" | grep -q "^\-T"; then TRIGGERS=$(echo "${i}" | cut -c 3-); if [ -z "${TRIGGERS}" ]; then usage;fi;fi
        if echo "${i}" | grep -q "^\-TB"; then TABLE=$(echo "${i}" | cut -c 3-); if [ -z "${TABLE}" ]; then usage;fi;fi
        if echo "${i}" | grep -q "^\-V"; then VIEW=$(echo "${i}" | cut -c 3-); if [ -z "${VIEW}" ]; then usage;fi;fi
done