#!/bin/bash

# parse file by saxon
# via common.xslt
# required parameters are MODE and VALUES

echo `$SAXON -s:$FILE -xsl:${COMMON_SCRIPTS}common.xslt -versionmsg:off -im:"$1" value="$2"`
