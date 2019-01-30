#!/bin/bash
# IN PROGRESS
# This script should generate 1996 altavista search resualt format. HTML sourced from arquivo.pt
# Actual searching can be provided by arquivo.pt API

IFS='
'

SEARCH_QUERY="`echo $SEARCH_QUERY | tr '+' ' ' `"

echo "
<html><head>
<title> AltaVista: Simple Query $SEARCH_QUERY</title>"

echo '</head><body bgcolor="#ffffff"  text="#000000"  link="#0000ee" vlink="551a8b" alink="ff0000">
<CENTER><A HREF="http://www.altavista.digital.com/" > <IMG SRC="http://www.altavista.digital.com:80/cgi-bin/90/8/53.gif"  alt="[ AltaVista] "  BORDER=0 ALIGN=middle  HEIGHT=73 WIDTH=204></a>
<A HREF="http://www.altavista.digital.com/cgi-bin/query?pg=aq" > <IMG SRC="http://www.altavista.digital.com:80/cgi-bin/90/8/54.gif"  alt="[ Advanced Query]  "  BORDER=0 ALIGN=middle  HEIGHT=73 WIDTH=59></a>
<A HREF="http://www.altavista.digital.com/cgi-bin/query?pg=q" > <IMG SRC="http://www.altavista.digital.com:80/cgi-bin/90/8/55.gif"  alt="[ Simple Query] "  BORDER=0 ALIGN=middle  HEIGHT=73 WIDTH=42></a>
<A HREF="http://altavista.software.digital.com/products/search/choice.htm">
 <IMG SRC="http://www.altavista.digital.com:80/cgi-bin/90/8/56.gif"  alt="[ Private eXtension Products] "  BORDER=0 ALIGN=middle  HEIGHT=73 WIDTH=65></a>
<A HREF="http://www.altavista.digital.com/cgi-bin/query?pg=h" > <IMG SRC="http://www.altavista.digital.com:80/cgi-bin/90/8/57.gif"  alt="[ Help with Query]  "  BORDER=0 ALIGN=middle  HEIGHT=73 WIDTH=35></a>
</CENTER><CENTER><FORM method=GET ACTION="http://www.altavista.digital.com/cgi-bin/query" >
<INPUT TYPE=hidden NAME=pg VALUE=q>
<B> Search <SELECT NAME=what><OPTION VALUE=web SELECTED> the Web</OPTION><OPTION VALUE=news > Usenet</OPTION></SELECT>
  and Display the Results <SELECT NAME=fmt><OPTION VALUE="." SELECTED> in Standard Form</OPTION><OPTION VALUE=c > in Compact Form</OPTION><OPTION VALUE=d > in Detailed Form</OPTION></SELECT></B><BR>'

echo "<INPUT NAME=q size=55 maxlength=200 VALUE=\"$SEARCH_QUERY\">"

echo '<INPUT TYPE=submit VALUE=" Submit">
<br><FONT size=-1> Tip: 

To get an exact match count, go to Advanced Search and select
<b>Display the Results as a Count only</b>
</FONT>
</FORM></CENTER><!--
<FONT size=-1><PRE> Word count: encryption:155333<BR> Ignored :    data: 10108998<BR></PRE></FONT><P>-->'

test $1 -eq 0 &&
	echo '<b> Documents 1-10  of about 3000  matching the query,  best matches first.</b><br></P><dl>' ||
	echo '<b> Documents 1-10  of about 0  matching the query,  best matches first.</b><br></P><dl>'

#<dt><A HREF="dium.htm"><strong>Ciphers, Codes, and Encryption</strong></a></dt><dd>Ciphers, Codes, and Encryption. Encryption. provides a method to protect information. computers can create codes that are not worth breaking. RSA, DES,...<br><cite><A HREF="dium.htm">http://www.cs.uidaho.edu:80/~karenv/cs101/security.html</a><font size=-1> - size 4K - 3 May 96</font></cite><br><p></p></dd>

for i in `head -n 10 -` ; do
	SEARCH_URL="`echo $i | cut -f 2 - `"
	SEARCH_TITLE="`echo $i | cut -f 1 - `"
	SEARCH_SNIPPET="`echo $i | cut -f 5 - | sed 's|<em>|<b>|g' - | sed 's|</em>|</b>|g' -`"
	SEARCH_DATE="`echo $i | cut -f 3 - | sed -e 's|\(....\)\(..\)\(..\)......|\1/\2/\3|' - `"
	SEARCH_SIZE="`echo $i | cut -f 4 - `"
	SEARCH_SIZE="`expr $SEARCH_SIZE / 1024`"

	echo "<dt><A HREF=\"${SEARCH_URL}\"><strong>${SEARCH_TITLE}</strong></a></dt><dd>${SEARCH_SNIPPET}<br><cite><A HREF=\"${SEARCH_URL}\">${SEARCH_URL}</a><font size=-1> - size ${SEARCH_SIZE}K - ${SEARCH_DATE}</font></cite><br><p></p></dd>"

done

echo "<CENTER>          p. <b>1</b>"

test $1 -eq 0 &&
	echo "<A HREF=\"${HTTP_URI}&num=2\" > 2</a><A HREF=\"${HTTP_URI}&num=3\" > 3</a><A HREF=\"${HTTP_URI}&num=4\" > 4</a><A HREF=\"${HTTP_URI}&num=5\" > 5</a><A HREF=\"${HTTP_URI}&num=6\" > 6</a><A HREF=\"${HTTP_URI}&num=7\" > 7</a><A HREF=\"${HTTP_URI}&num=8\" > 8</a><A HREF=\"${HTTP_URI}&num=9\" > 9</a><A HREF=\"${HTTP_URI}&num=10\" > 10</a><A HREF=\"${HTTP_URI}&num=11\" > 11</a><A HREF=\"${HTTP_URI}&num=12\" > 12</a><A HREF=\"${HTTP_URI}&num=13\" > 13</a><A HREF=\"${HTTP_URI}&num=14\" > 14</a><A HREF=\"${HTTP_URI}&num=15\" > 15</a><A HREF=\"${HTTP_URI}&num=16\" > 16</a><A HREF=\"${HTTP_URI}&num=17\" > 17</a><A HREF=\"${HTTP_URI}&num=18\" > 18</a><A HREF=\"${HTTP_URI}&num=19\" > 19</a><A HREF=\"${HTTP_URI}&num=20\" > 20</a><A HREF=\"${HTTP_URI}&num=2\" >  [ Next]</a>"

echo "</CENTER>"

# TODO: Fix the above links

echo '<CENTER><HR><FONT size=-1><B>
<a href="/cgi-bin/query?pg=s">Surprise</a> . 
<a href="/cgi-bin/query?pg=tmpl&amp;v=legal.html">Legal</a> . 
<a href="/cgi-bin/query?pg=tmpl&amp;v=faq.html">FAQ</a> . 
<a href="/cgi-bin/query?pg=tmpl&amp;v=addurl.html">Add URL</a> . 
<a href="/cgi-bin/query?pg=tmpl&amp;v=feedback.html">Feedback</a> . '

echo "<A HREF=\"${HTTP_URI}\" >  Text-Only</a></B><HR></CENTER>"

echo '<CENTER><FONT size=-1>

<A href="http://www.digital.com:80/">
<IMG SRC="http://www.altavista.digital.com:80/cgi-bin/57/8/58.gif"  ALT="DIGITAL" BORDER=0 ALIGN=middle
	HEIGHT=17 width=50>
</a>
Copyright &#169; 1996
<A href="http://www.digital.com:80/">Digital Equipment Corporation.</a>
All rights reserved.

</FONT></CENTER>
</dl></BODY></HTML>
<hr>
<h6>Internet URL-'
echo " <a href=\"${HTTP_URI}\">${HTTP_URI} </a> </h6>
"

exit 0


