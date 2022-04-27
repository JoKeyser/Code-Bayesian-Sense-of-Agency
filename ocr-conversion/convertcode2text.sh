#!/usr/bin/env bash
#
# PURPOSE
#   Convert the supplementary code from PDF to text with optical
#   character recognition (OCR).
#   The text can then be converted into Matlab functions/scripts.
#   Note that the OCR isn't perfect and requires manual adjustments.
#
# REQUIREMENTS
#   This is a Bash script relying on the tools Convert and Tesseract.
#   On Debian and derivatives, you can install these packages:
#   $ sudo apt search imagemagick tesseract-ocr
#
# AUTHOR
#   Johannes Keyser <johannes.keyser@sport.uni-giessen.de>
#
# LICENSE
#   This script is dedicated to the public domain under the
#   CC0 Public Domain Dedication. For details, please visit
#   https://creativecommons.org/share-your-work/public-domain/cc0/


STARTPAGE=2  # set to page number of first page of source pdf
ENDPAGE=22  # set to page number of last page of source pdf
SOURCE=supplementary_code.pdf
OUTPUT=raw-ocr-code.txt  # choose name of the output text file
RESOLUTION=300  # you can tweak the resolution

touch $OUTPUT
for pp in $(seq $STARTPAGE $ENDPAGE); do
    echo "converting page $pp"
    convert -rotate 270 -bordercolor White -border 10x10 -alpha off -density $RESOLUTION $SOURCE\[$((pp - 1 ))\] page.tif
    echo "ocr-processing page $pp"
    tesseract --psm 6 -c preserve_interword_spaces=1 page.tif tempoutput
    cat tempoutput.txt >> $OUTPUT
done
