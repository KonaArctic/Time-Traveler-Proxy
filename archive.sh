#!/bin/bash
# Runs wget. Will add fuzziness processing in future

source wecache.sh

function archive {	# Internet Archive has since removed altavista.digital.com from their library when I started writing... 
	chkdate "https://web.archive.org/web/${PROXY_STAMP}id_/$HTTP_URI" ||
	chkdate "http://wayback.vefsafn.is/wayback/${PROXY_STAMP}id_/$HTTP_URI" ||	# Since the Icelandic web archive runs the same software as the Internet Archive, I'll just bind them together.
	chkdate "http://wayback.archive-it.org/all/${PROXY_STAMP}id_/$HTTP_URI"	|| # And here's Archive-It
	chkdate "http://webarchive.loc.gov/all/${PROXY_STAMP}id_/$HTTP_URI" # Library of congress
	return $?
}

# Arquivo replaces missing links with ``dium.htm'' which isn't helpful.

function arquivo {
	chkdate "https://arquivo.pt/noFrame/replay/${PROXY_STAMP}id_/$HTTP_URI"
	rtn=$?

	test -f $WE_FILE && file $WE_FILE | grep -qe 'HTML' - && grep -qe 'dium\.htm"' $WE_FILE &&
		echo "${FontRed}Warning: dium.html links detected on ${HTTP_URI} ${FontDefault}" 1>&2

	return $rtn
}

function chkdate {	# Wecaches, while also checking date
			# Greps raw wget output and examines "fuzzy"-ness. Only considers HTML data. 
			# Note that some implementations of `wget` do not report document type. *Looks at busybox*

	wecache $@ 1> /dev/null
	rtn=$?

	echo $PROXY_FUZZ | grep -qe '..............' - &&	# PROXY_FUZZ variable provided ...
	test -f $WE_FILE &&	# Wecache output file exists ...
	file $WE_FILE | grep -qe 'HTML' - && 	# Is HTML ...
	test 0`echo $WE_INFO | grep -oEe '/[0-9]+id_/' - | tail -n 1 - | grep -oEe '[0-9]+' - ` -gt $PROXY_FUZZ &&	# Grep'd timestamp greater than fuzzy-ness time stamp 
		return 1

	test -f $WE_FILE &&
		cat $WE_FILE	# Otherwise, cat the file 
	return $?
}


