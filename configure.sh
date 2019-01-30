#!/bin/bash
# This is the configuration file for the Time Travelers' proxy
# Defaults specified. Remove to use default. Leave empty to disable.

PROXY_ROOT="`pwd`/web"	# Root directory to serve local web data from (optional). Leave empty to disable 
PROXY_HOST="`hostname`"	# Proxy hostname. Separate multiple with "|" separator. Regrexs accepted
PROXY_STAMP="19960101000000"	# Target time to pull data from. Mandatory. Must be 14 digit format
PROXY_FUZZ="19980101000000"	# Specify the oldest date for which a document can still be considered usable. Must be 14 digits


