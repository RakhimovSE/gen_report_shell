if [ -z "$1" ]
  then
    echo "No log file supplied"
    exit
fi

CUR_DATE=`date +"%Y%m%d%H%M%S"`

[ ! -d reports ] && mkdir reports
[ ! -d reports/by_month ] && mkdir reports/by_month
grep "Access denied" $1 | awk '{a[substr($0,0,7)]+=1}END{for(b in a){print b,a[b]}}' | sort >> reports/by_month/report_$CUR_DATE.txt