#!/bin/bash
# As a last resort, check if page is live. This only works if the requested page is not in plain text ('cause users will read it).
# Wayback machine may automatically grab online files, making this useless

wget -O - "$HTTP_URI" > $PROXY_TEMP
rtn=$?
test $rtn -eq 0 ||
	exit $rtn

if ! ( file $PROXY_TEMP | grep -qe 'HTML' - ) ; then
	cat $PROXY_TEMP
	( wget -O /dev/null "https://web.archive.org/save/$HTTP_URI" ) &	# If we got this far, then it is historically significant
else
	exit 1
fi

exit 0


