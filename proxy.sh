#!/bin/bash
source error.sh
source fonts.sh

# Enviorment variables
export PROXY_TEMP=`mktemp`
test "a$PROXY_TEMP" == 'a' &&
	PROXY_TEMP="/tmp/tuorantravelproxy.$$.tmp"
export TEMPFILE=$PROXY_TEMP

export PROXY_ROOT="`pwd`/web"
export PROXY_HOST="`hostname`"
export PROXY_STAMP="19981013055006"
export PROXY_FUZZ=''

source configure.sh

export stamp="$PROXY_STAMP"
find='false'
echo "${FontBlue}DEBUG: TRYING $HTTP_URI ${FontDefault}" 1>&2
#echo 'FORCING RAW DATA DISPLAY ...'

IFS='
'

# Process files
for i in `ls | grep -e '^[0-9]' - | sort -n - ` ; do	# For each numbered item
	echo "Trying routine $i" 1>&2
	./$i	# Try it
	rtn=$?
	echo "" 1>&2

	echo "Routine $i returned $rtn" 1>&2
	if test "a$rtn" == 'a0'; then	# If it works, exit
		find='true'
		break
	fi
	if test $rtn -gt 128 || test $rtn -eq 4 ; then	# If something really bad happens 
		find='true'
		errorsimple '500 Internal Server Error'
		break
	fi
done

test $find == 'false' &&
	errorsimple '500 Internal Server Error' # error '404 Not Found'	# Looks better

rm $PROXY_TEMP


