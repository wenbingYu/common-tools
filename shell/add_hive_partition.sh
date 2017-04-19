#!/bin/bash
# function: 给year/month/day的目录结构添加pday＝xxxx/phour=xx的分区脚本
# time:2017/04/11
# ./addpartition.sh -t rpt_effect_base -tb 20170406 te 20170411
# note: 若tb和te两个参数同时指定，就是添加tb到te范围之内的分区，若只指定其中一个，则添加指定参数对应的时间的分区，若两个参数都不指定，则退出
function usage(){

    echo "usage"
    echo "./add_hive_partition"
    echo "-t table"
    echo "-tb begin_date=yyyymmdd"
    echo "-te end_date=yyyymmdd"
    echo ""
    exit
}



function exe_hive_sql(){

    str_date=$1

    year=${str_date:0:4}
    month=${str_date:4:2}
    day=${str_date:6:2}
    hive  -f add_hive_partition.hql  -hiveconf current_year=$year -hiveconf current_month=$month -hiveconf current_day=$day -hiveconf pday=$str_date 
    echo "add partition $year , $month, $day,$str_date"
}

function get_str_data(){

    begin_date=$1
    end_date=$2
    v_date=$begin_date
    str_date=$begin_date

    while [[ $v_date < $end_date ]]

    do 
        v_date=`date "-d +1 day $v_date" +%Y%m%d`
        str_date=$str_date" "$v_date
        
    done


    for str_day in $str_date 
    do
        exe_hive_sql  $str_day
    done


}



if [[ $# -lt 1 ]] ;then
    usage
fi

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -t|--table)
    table="$2"
    shift # past argument
    ;;
    -tb|--begin_date)
    begin_date="$2"
    shift # past argument
    ;;
    -te|--end_date)
    end_date="$2"
    shift # past argument
    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
    ;;
esac
shift 
done




if [[ "${table}" = "" ]]; then
    usage
fi
if [ "${begin_date}" = "" ]  &&  [ "${end_date}" = "" ]; then
    usage
elif [ "${begin_date}" !=  "" ] &&  [ "${end_date}" != "" ]; then
    get_str_data  $begin_date $end_date
elif [ "${begin_date}" !=  "" ]; then
    exe_hive_sql ${begin_date}
elif [[ "${end_date}" !=  "" ]]; then
    exe_hive_sql ${end_date}
fi



