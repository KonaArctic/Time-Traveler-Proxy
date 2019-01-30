#!/bin/bash
# TODO: Allow spaces in function arguments

test "a$FontDefault" == 'a' &&
	source fonts.sh

export WE_DIR='/tmp/wecache'
mkdir -p $WE_DIR
test -d $WE_DIR ||
	echo "${FontRed}Warning: caching directory not found ${FontDefault}" 1>&2

#alias wget=wecache

function wecache {
	WE_TEMP=`mktemp`
	test "a$WE_TEMP" == 'a' &&
		WE_TEMP="/tmp/wecache.$$.tmp"

	export WE_URL=$1
	export WE_FILE="$WE_DIR/`echo $WE_URL | md5sum - | grep -oEe '^[^ ]+' - `"
	export WE_INFO="$WE_FILE.info"

	if test -f $WE_FILE ; then
		cat $WE_FILE
		rtn=$?

	else
		env wget -O $WE_TEMP $@ 2> $WE_INFO
		rtn=$?

		if test $rtn -eq 0 ; then
			cat $WE_TEMP
			mv $WE_TEMP $WE_FILE
		fi

	fi

	test -f $WE_TEMP &&
		rm $WE_TEMP
	WE_INFO="`cat $WE_INFO`"
	return $rtn		
}

function wepurge {	# purges all cache
	rm $WE_DIR/*
	return $?
}


