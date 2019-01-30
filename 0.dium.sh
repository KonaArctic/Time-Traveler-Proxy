#!/bin/bash

if echo "$HTTP_URI" | grep -qEe "/dium.htm$" - ; then
	source error.sh
	errorfancy 'your requested link has been lost in the tides of history.' 'Lost!'
	exit 0
fi

exit 1


