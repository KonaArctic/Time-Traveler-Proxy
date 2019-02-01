#!/bin/bash
# Searches on arquivo.pt, and formats nicely.
# Note that this script drops all .pt domains, which isn't the most graceful solution
# TODO: Recursive queries


function searchengine {	# This script should select the shell script to format returning HTML
			# Currently, only one such script is aviliable
	echo '1996.altavista.sh'
	exit 0
}

function search {
	test "a${FontDefault}" == 'a' &&
		source fonts.sh
	source wecache.sh
	echo "${FontRed}Warning: search capabilities are VERY experimental${FontDefault}" 1>&2

	# Grabs data and strips non-printables
	# Don't you just love it when a website acutally offers an easy-to-use API

	export SEARCH_TIME=`expr $PROXY_STAMP \- 00030000000000`
	export SEARCH_FUZZ="`test a$PROXY_FUZZ != a && echo $PROXY_FUZZ || echo $PROXY_TIME`"

	dat="`wecache "https://arquivo.pt/textsearch?q=$SEARCH_QUERY&from=$PROXY_TIME&to=$PROXY_FUZZ&offset=$SEARCH_OFFSET&maxItems=50&itemsPerSite=1&fields=originalURL,title,snippet,contentLength,tstamp&prettyPrint=false" | tr -dc '[[:print:]]' `"
	rtn=$?
	test $rtn -eq 0 ||
		return 129

	export SEARCH_QUERY="`echo "$dat" | grep -oEe 'request_parameters":{"q":"[^"]+' - | cut -c 27- - | tr '+' ' ' `"
	export SEARCH_ITEMS="`echo "$dat" | grep -oEe 'total_items":"[0-9]+' - | grep -oEe '[0-9]+' - `"

	dat="`echo "$dat" | \
		# Strips irrelevent data 
                sed 's|\t| |' - | \
                grep -oEe '"response_items":.+' - | \
                cut -c 19- - | \
                tr '{' '\n' | \

		# Strips .pt domains
                grep -oEe '^[^}]+' - | \
                cat - | \
		grep -vEe 'https?://[^/]+\.pt/' - | \

		# Gets values from key-value pairs 
                sed 's|"[^"]*":"|\t|g' - | \
                sed 's|",\t|\t|g' - | \
                cut -c 2- - | \
		sed 's|\\"|"|' - | \

		sed 's|.$||' - \
`"

	echo "$dat"
	test "a$dat" == 'a' &&
		return 1 ||
		return 0
}

