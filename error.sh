#!/bin/bash

# Two error page generation functions. Use at will 

# Generates friendly error page

function errorfancy {
	echo "
<html>
	<head>
		<meta name=\"viewport\" content=\"width=device-width;\">
		<title>
			$2
		</title>
	</head>
	<body bgcolor=\"white\" background=\"http://www.furry.com/img/tracks.gif\">
		<center>
			<h1>
				<i>
					Sorry to ruin your magic ...
				</i>
			</h1>
			<p>
				... but $1
			</p>
		</center>
		<hr>
		<i>
			Time Travelers' Proxy 0.0.2 pre-release
		</i>
	</body>
<html>
"
	return 0
}

alias error=errorfancy

function errorsimple {
	HTTP_RESPONSE="$1"
	echo "
<HTML>
	<HEAD>
		<TITLE>
			$1
		</TITLE>
	</HEAD>

	<BODY>
		<H1>
			$1
		</H1>

		<HR>

		<I>
			Squid 1.0.beta9 at `echo $PROXY_HOST | grep -oe '[^|]*' - `
		</I>
	</BODY>
</HTML>
"
	return 0
}


