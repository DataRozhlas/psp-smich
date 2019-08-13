#!/bin/sh

# 2010-13
wget -nd -r -l 1 -A "*schuz.zip" -P 2010/ http://www.psp.cz/eknih/2010ps/stenprot/zip/index.htm 
find -name '*.zip' -exec sh -c 'unzip -o -d "${1%.*}" "$1"' _ {} \;
rm 2010/*.zip

# 2013-17
wget -nd -r -l 1 -A "*schuz.zip" -P 2013/ http://www.psp.cz/eknih/2013ps/stenprot/zip/index.htm 
find -name '*.zip' -exec sh -c 'unzip -o -d "${1%.*}" "$1"' _ {} \;
rm 2013/*.zip
for i in `seq -w 273`
do
	wget -P 2013/059schuz http://www.psp.cz/eknih/2013ps/stenprot/059schuz/s059$i.htm
done

for i in `seq -w 184`
do
	wget -P 2013/060schuz http://www.psp.cz/eknih/2013ps/stenprot/060schuz/s060$i.htm
done

for i in `seq -w 57`
do
	wget -P 2013/061schuz http://www.psp.cz/eknih/2013ps/stenprot/061schuz/s0610$i.htm
done

# 2017-
wget -nd -r -l 1 -A "*schuz.zip" -P 2017/ http://www.psp.cz/eknih/2017ps/stenprot/zip/index.htm 
find -name '*.zip' -exec sh -c 'unzip -o -d "${1%.*}" "$1"' _ {} \;
rm 2017/*.zip

find -name '*.htm' -exec sh -c 'iconv -f cp1250 -t utf8 "$1" -o "$1.new" && mv "$1.new" "$1"' _ {} \;
