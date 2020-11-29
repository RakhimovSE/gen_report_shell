counter=0
prev_year=0
prev_month=0

for cur_date in `grep "Access denied" $1 | awk '{print $1}'` ; do
  myarray=(`echo $cur_date | tr '-' ' '`)
  cur_year=${myarray[0]}
  cur_month=${myarray[1]}
  if [ $prev_year == 0 ]
  then
    prev_year=$cur_year
    prev_month=$cur_month
  fi
  if [ $prev_year == $cur_year ] && [ $prev_month == $cur_month ]
  then
    ((counter += 1))
  else
    echo "$prev_year-$prev_month\t$counter" >> report_by_month.txt
    prev_year=$cur_year
    prev_month=$cur_month
    counter=1
  fi
done
echo "$prev_year-$prev_month: $counter" >> report_by_month.txt
