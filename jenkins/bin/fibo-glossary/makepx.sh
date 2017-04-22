#!/usr/bin/env bash
#
# This finds the base URI, then looks up its prefix.  This will fail
# for a file that doesn't have a base URI, or doesn't have a prefix
# for it.
#
grep "xmlns.*=\"$(grep "xml:base=" $1  | sed -e "s/^.*xml:base=\"//" | sed -e "s/\".*$//")" $1  | sed -e "s/^[ 	]*xmlns[^=]*-/@prefix fibo-v-/;s/=\"/: </;s!fibo/.*/\\([^/]*/\\)!fibo/vocabulary/\\1!;s/\\/\">*[ 	
]*$/#> . /"
