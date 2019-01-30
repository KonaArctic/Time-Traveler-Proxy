#!/bin/bash

# Maybe the user is trying to access local files ...

test "a$PROXY_ROOT" == 'a' &&
	exit 1

echo "$HTTP_URI" | grep -qEe "($PROXY_HOST|^)/" - ||
	exit 1

echo "Trying to display file $PROXY_ROOT$HTTP_URI." 1>&2

function index {	# Directory index generation 
	if test "a$1" != '' ; then
		if ! cd "$1"; then
			exit; fi; fi
	echo '<HTML>
		<HEAD>
			<TITLE>Directory listing</TITLE>
		</HEAD>
		<BODY>
			<H1>Directory listing</H1>
			<hr/>
			<UL>'
	IFS='
	'
	for i in $( ls | sort - ); do
		echo "			<LI><A HREF=\"$HTTP_URI$i\">$i</A>"
	done
	echo '		</UL>
		</BODY>
	</HTML>'
}

if test -f "$PROXY_ROOT$HTTP_URI" ; then
	cat "$PROXY_ROOT$HTTP_URI"
	exit 0
fi

if test -d "$PROXY_ROOT$HTTP_URI" ; then
	index "$PROXY_ROOT$HTTP_URI"
	exit 0
fi

source error.sh
error 'the requested file was not found on your host machine.' 'File non-existent'
exit 0


