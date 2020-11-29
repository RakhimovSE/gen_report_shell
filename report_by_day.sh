if [ -z "$1" ]
  then
    echo "No log file supplied"
    exit
fi

CUR_DATE=`date +"%Y%m%d%H%M%S"`

[ ! -d reports ] && mkdir reports
[ ! -d reports/by_day ] && mkdir reports/by_day
grep "Access denied" $1 | awk '{a[substr($0,0,10)]+=1}END{for(b in a){print b,a[b]}}' | sort >> reports/by_day/report_$CUR_DATE.txt