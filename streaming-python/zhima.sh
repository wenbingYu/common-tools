#! /bin/sh

export LANG="en_US.UTF-8"
#-------------------------------------------------------------------
# initialize globle variable
#-------------------------------------------------------------------
inputDate=${1}
str_date=$inputDate
if [ -z "${inputDate}" ];then
	inputDate=`date -d "0 day" +%Y/%m/%d`
	
	str_date=`date -d "-1 day" +%Y%m%d`
fi

echo "str_date=$str_date"
hdstreaming="/usr/lib/hadoop-mapreduce/hadoop-streaming.jar"
ROOTDIR="/data/users/console-report/zhima"

HDFS_ROOT="/tmp/zhima"
HDFS_TABLE="/tmp/table"

CONFDIR="${ROOTDIR}/conf"
LOGDIR="${ROOTDIR}/runlog"

FILENAME=$(basename $0)
RUNLOG="${LOGDIR}/${FILENAME}.runlog"

for ADIR in ${CONFDIR} ${LOGDIR}
do      
        if [ ! -d "${ADIR}" ];then
                mkdir -p ${ADIR}
        fi
done


function getLib(){
mysql -h 192.168.154.54 --user='test_dmp_rwud'  --password="duwrpmdtset\$#1" -e " select id,company_id,category from dmp.dmp_library_create where type=6 and removed != 1" -N dmp  > $ROOTDIR/dmp_library_create

}


getLib

#取曝光pyid 及 商品
function zhiMaUv(){

	#input="/user/root/flume/cookie_mapping/idm/2014/12/30/10"
        #input="/user/root/flume/express/2014/12/30/10/{adv*,cvt*}"
	input="/data/production/zmtech/rpt_zmtech_user/pday={$str_date}/0*"
        outputdir=$HDFS_ROOT/$str_date/
        hadoop fs -rmr $outputdir

        hadoop jar ${hdstreaming} \
                -D mapred.job.queue.name=mapreduce.normal \
		#-D mapred.min.split.size=1073741824 \
                -D mapred.job.name='product::zmtech' \
                -D stream.num.map.output.key.fields=2 \
                -D mapred.reduce.tasks=10 \
                -mapper "zhima_map.py" \
                -reducer "zhima_reduce.py" \
		-file zhima_map.py \
		-file zhima_reduce.py \
		-file dmp_library_create \
                -input "$input" \
                -output "${outputdir}" 

}


zhiMaUv
