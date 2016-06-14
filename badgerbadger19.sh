#!/bin/bash


# input is the star-separated-value file with all info for participants
input=$1

# Set "*" as the field separator using $IFS
# and read line by line using while read combo
while IFS='*' read -r NAME1 NAME2 INSTITUTE REGDATE ORDERID REGFEE BANQUETPRICE TOURPRICE TOURTYPE BUSPRICE NATIONPRICE ADMINPRICE EXVATPRICE DELTAVAT VATPRICE TRANSACTIONPRICE BALANCE PAYMENTTYPE \
INVOICEREF COMPANY ADDRESS CITY POSTALCODE COUNTRY DIET TAG1 TAG2 TAG3 TAG4 TAG5
do
  #NT is a string with all the first and last names concatenated with the spaces removed
  # ex: "Jean Louis Carpentier" becomes "JeanLouis_Carpentier", used to create the filename
  NT=$(echo $NAME2'_'$NAME1|tr -d ' ');
  FILENAME='pdf/badgecs19_'$NT'.pdf'
  #PNG files are created for quick-glance inspection of the badges. More convenient than PDF
  PNGFILENAME='png/badgecs19_'$NT'.png'
  SVGFILENAME='svg/badgecs19_'$NT'.svg'

  echo $FILENAME
  # replaces placeholder in the badge SVG file by a SVG snippet with
  # the logos of the research tag in the good position
  #perl -ne 's/^logo1/`cat '"$TAG1"'1.svg`/e;print' template.svg > test1.svg
  #perl -ne 's/^logo2/`cat '"$TAG2"'2.svg`/e;print' test1.svg > test2.svg
  #perl -ne 's/^logo3/`cat '"$TAG3"'3.svg`/e;print' test2.svg > test3.svg
  #perl -ne 's/^logo4/`cat '"$TAG4"'4.svg`/e;print' test3.svg > test4.svg
  #perl -ne 's/^logo5/`cat '"$TAG5"'5.svg`/e;print' test4.svg > test5.svg
  # replacing now name and institute. sed replaces all occurences in the file
  cp template.svg $SVGFILENAME
  sed -i 's*name1*'"$NAME1"'*' $SVGFILENAME
  sed -i 's*name2*'"$NAME2"'*' $SVGFILENAME
  sed -i 's*institute*'"$INSTITUTE"'*' $SVGFILENAME
  sed -i 's*diet-constraint*'"$DIET"'*' $SVGFILENAME
  # if there is diet constraint. the ticket is red. if none, ticket is gray
  if [ "$DIET" = "no restrictions" ]; then
    sed -i 's*61ba73*'"888888"'*' $SVGFILENAME
  else
    sed -i 's*61ba73*'"bb3e3e"'*' $SVGFILENAME
  fi
  # replacing all registration data
  sed -i 's*regdate*'"$REGDATE"'*' $SVGFILENAME
  sed -i 's*orderid*'"$ORDERID"'*' $SVGFILENAME
  sed -i 's*regfee*'"$REGFEE"'*' $SVGFILENAME
  sed -i 's*banquetprice*'"$BANQUETPRICE"'*' $SVGFILENAME
  sed -i 's*tourtype*'"$TOURTYPE"'*' $SVGFILENAME
  sed -i 's*tourprice*'"$TOURPRICE"'*' $SVGFILENAME
  sed -i 's*nationprice*'"$NATIONPRICE"'*' $SVGFILENAME
  sed -i 's*busprice*'"$BUSPRICE"'*' $SVGFILENAME
  sed -i 's*adminprice*'"$ADMINPRICE"'*' $SVGFILENAME
  sed -i 's*exvatprice*'"$EXVATPRICE"'*' $SVGFILENAME
  sed -i 's*deltavat*'"$DELTAVAT"'*' $SVGFILENAME
  sed -i 's*vatfee*'"$VATPRICE"'*' $SVGFILENAME
  sed -i 's*transactionprice*'"$TRANSACTIONPRICE"'*' $SVGFILENAME
  sed -i 's*paymenttype*'"$PAYMENTTYPE"'*' $SVGFILENAME
   sed -i 's*invoiceref*'"$INVOICEREF"'*' $SVGFILENAME
  sed -i 's*billingadress1*'"$COMPANY"'*' $SVGFILENAME
  sed -i 's*billingadress2*'"$ADDRESS"'*' $SVGFILENAME
  sed -i 's*billingadress3*'"$POSTALCODE $CITY"'*' $SVGFILENAME
    sed -i 's*billingadress4*'"$COUNTRY"'*' $SVGFILENAME

  #sed -i 's**'"$"'*' $SVGFILENAME
  #pdf export
  inkscape $SVGFILENAME --export-pdf=$FILENAME
  inkscape $SVGFILENAME --export-png=$PNGFILENAME --export-dpi=90
  #inkscape $SVGFILENAME --export-pdf='test.pdf'
done < $input
