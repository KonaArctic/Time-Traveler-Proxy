#!/bin/bash

# General exceptions to try arquivo.pt first

echo $HTTP_URI | grep -qEe 'http://microsoft\.com/|jump\.altavista\.com/' ||
	exit 1

source archive.sh

arquivo ||
archive ||
exit $?

exit 0


