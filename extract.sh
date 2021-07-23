lcode=$1
dump_date=20210719
baseurl=https://dumps.wikimedia.org/other/cirrussearch
dumpurl=$baseurl/$dump_date/${lcode}wiki-${dump_date}-cirrussearch-content.json.gz
dumpfile=$(basename $dumpurl)

if [ $# -eq 0 ]
then
    echo "No language code supplied"
else
    echo "Downloading dump file..."
    wget $dumpurl
    echo "extracting text from dump file..."
    python extract_doc.py $dumpfile > $lcode.tsv
    echo "extracted wiki documents to : ${lcode}.tsv"
    rm $dumpfile
fi
