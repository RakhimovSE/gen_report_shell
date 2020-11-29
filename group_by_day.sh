counter=0
prev_date=""

for cur_date in `grep "Access denied" $1 | awk '{print $1}'` ; do
  if [ "$prev_date" == "" ]
  then
    prev_date=$cur_date
  fi
  if [ "$cur_date" == "$prev_date" ]
  then
    ((counter += 1))
  else
    echo "$prev_date\t$counter" >> report_by_day.txt
    prev_date=$cur_date
    counter=1
  fi
done
echo "$prev_date\t$counter" >> report_by_day.txt