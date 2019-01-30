#!/bin/bash

# The Wayback machine's early archive of home.microsoft.com can be broken.

test `echo $stamp | cut -c 1-4 - ` -le 1998 && echo $HTTP_URI | grep -qEe 'http://home.microsoft.com/' ||
	exit 1


stamp=19970327143617	# The only complete copy I can find 

source archive.sh
archive | sed 's/March 27//' -
exit $? 

exit 0


