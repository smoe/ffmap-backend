#!/bin/bash

set -e

here=$(dirname $0)

DEST=$1
[ "$DEST" ] || exit 1

if [ -x /usr/bin/realpath ]; then
        #echo -n "I: changed path '$DEST' to "
        DEST=$(realpath $DEST)
        #echo "'$DEST'"
fi

cd "$(dirname "$0")"/

./ffhlwiki.py http://freifunk.metameute.de/wiki/Knoten > aliases_hl.json
./ffhlwiki.py http://freifunk.metameute.de/wiki/Moelln:Knoten > aliases_moelln.json

EXTRABIN=$HOME

PATH=$EXTRABIN:$PATH ./bat2nodes.py -A -d $DEST

#./bat2nodes.py -A -a aliases.json -a aliases_hl.json -a aliases_moelln.json -d $DEST
