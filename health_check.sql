spool health.txt
doc
  Oracle health check script

  Modified by JUNG SUNG IL

~~~ GENERAL ~~~

Oracle Instance Information

     Purpose - 대상 데이터베이스 인스턴스의 기본정보를 확인한다.
#
set pages 40
set line 150
col host format a20

select host_name "Host", version "Version", name "DB Name", startup_time "Startup Time", parallel "Parallel",
				log_mode "Log Mode", archiver "Archiver"
from v$instance, v$database
/


doc

아카이브 모드 상태

			Purpose - 현재 아카이브 모드 상태와 위치를 보여준다.

#

archive log list
/


doc
Resource Limit

     Purpose - 데이타베이스의 시스템리소스의 할당내역과 소모현황을 확인한다. 

     Description - 인스턴스 시작시 할당되는 시스템자원에 대하여 할당값과 소모현황을 
      모니터링하여 할당자원이 부족할 경우 적절한 조치를 취해주어야 한다. 대부분의 경우 대응되는
      초기화 파라미터를 통해 설정값을 변경할 수 있다. 이 정보는 오렌지의 Database Information 
      툴에서 수시로 확인할 수 있다. 

     Guide - Resource Name별로 Max util 값이 Limit 값에 근접하거나 같은 값일 경우에는 
             init.ora 파일에서 해당 리소스를 설정하는 초기화 파라미터의 값을 늘려주어야 한다.  
#
select RESOURCE_NAME "Resource Name",
       CURRENT_UTILIZATION "Current Util",
       MAX_UTILIZATION "Max Util",
       INITIAL_ALLOCATION "Initial Alloc",
       LIMIT_VALUE "Limit"
from v$resource_limit
/


doc
Current Session Count
     Purpose - 대상 데이타베이스에 접속되어 있는 모든 Session과 현재 작업중인 Session의 수를 확인한다.
#

select to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') "Time",
count(*) "Total Sessions",
count(decode(status, 'ACTIVE',1) ) "Active Sessions"
from v$session
/


doc 
~~~ SGA ~~~

Buffer Cache Hit Ratio

     Purpose - 데이터베이스 버퍼캐쉬의 적중률을 점검한다. 

     Description - Buffer Cache의 기본적인 기능은 여러 프로세스에 의해 공통으로 자주 액세스 
           되는 데이터베이스 블록을 메모리에 캐쉬하여 물리적인 디스크 IO를 최소화함으로써 더 
           빠른 액세스 속도를 제공하기 위한 것이다. 버퍼캐쉬의 적중률이란 애플리캐이션이 
           액세스한 메모리 블럭 가운데 이미 캐쉬가 되어있어 물리적 IO없이 액세스 할 수 있었던 
           블럭의 비율을 나타낸다. 만약 데이터베이스 버퍼의 적중률이 권장값 미만일 경우에는 
           할당된 버퍼 캐쉬의 크기가 너무 적거나, 또는 지나치게 많은 I/O를 유발하는 애플리케이션이
            존재한다는 것을 의미한다. 
       
     Criteria - 90.0 % Minimum 

     Guide - 데이터베이스 버퍼캐쉬의 적중률은 OLTP, DSS, DW등 데이터베이스를 사용하는 애플리케이션의
          특성에 따라 권장값이 다르다. 일반적으로, OLTP시스템은 90%이상은 되어야 하고 DSS, DW 
          시스템은 80~85%이상이면 좋다고 할 수 있으나, 순수하게 배치(Batch) 처리업무 위주의 
          시스템인 경우는 50%를 밑돌더라도 그 자체로 문제가 된다고 단정할 순 없다.
          데이터베이스 버퍼캐쉬의 적중률이 기준값보다 낮은 경우에는 초기화 파라미터 db_block_buffers의
          값을 늘려 버퍼캐쉬의 크기를 증가시킬 수 있다. 이때 O/S상에 메모리가 여유 있는지 확인 하여야
           하며 메모리 부족으로 Paging, Swapping이 발생하지 않는 한도내에서 증가시켜 주어야 한다. 
          그러나 디스크상의 모든 데이터블럭을 캐쉬시키는 것은 현실적으로 불가능하므로 일반적으로 
          버퍼캐쉬의 증가가 최선의 해결책이 될 수는 없다. 특히, 다량의 디스크 블록을 빈번히 
          Full Scan하는 애플리케이션이 존재한다면 적중률을 높은 수준으로 유지하는 것은 불가능하므로
           액세스패턴이 비효율적인 애플리케이션을 추출하여 지속적인 튜닝을 수행해 주어야 한다. 
#

select   to_char(sysdate,'yyyy/mm/dd HH24:MI:SS') "Time",
          a.value+b.value "Logical Reads",
          c.value "Physical Reads",
          round((1 - (c.value/(a.value+b.value)))*100, 3) "Hit Ratio"
from     v$sysstat a, v$sysstat b, v$sysstat c
where  a.name = 'db block gets'
      and      b.name = 'consistent gets'
      and      c.name = 'physical reads'
/


doc
Library Cache Hit Ratio (summary)

     Purpose 라이브러리 캐쉬 전체의 적중률을 점검한다. 

     Description - 오라클은 SQL 파싱 작업에 따른 CPU를 비롯한 자원사용을 최소화하고, 
      SQL의 실행시간의 단축과 메모리 절약 등의 목적을 위하여 SGA 가운데 일부인 
      Shared Pool내에 SQL을 공유하고 있는데, 이 영역을 라이브러리 캐쉬라고 한다. 
      여기서 라이브러리 캐쉬의 적중률은 Pins횟수 가운데 Reloads횟수를 제외한 비율로 
      계산되며, 이때 Pins는 캐쉬내의 SQL 커서의 실행횟수, Reloads는 캐쉬에 존재하던 
      SQL커서 정보가 메모리 밖으로 ageout되거나 invalidate되었다가 다시 Load된 횟수를
       의미한다. 요약하면, 라이브러리 캐쉬의 적중률이란 수행하려는 SQL 커서 정보가 
       (ageout되지 않고) 라이브러리 캐쉬내에 존재할 확률을 의미한다. 
       
     Criteria - 99.0 % Minimum 

     Guide - 라이브러리 캐쉬의 적중률은 99% 이상을 유지할 것을 권장한다. 이 값이 권장값보다 
             낮을 경우에는 초기화 파라미터 shared_pool_size를 사용하여 Shared Pool의 크기를
             증가시켜 개선시킬 수 있다. 더욱 효과적인 것은, 사용되는 SQL의 공유 정도를 높이기 
             위해 Literal SQL(조건절에 상수값을 사용하는 SQL)을 바인드 변수를 사용하도록 수정해 
             주는 것이다. 
# 

select   to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') "Time",
round((1-(sum(reloads)/sum(pins)))*100, 3) "Hit Ratio(Pins-Reloads)"
from     v$librarycache
/


doc
Dictionary Cache Hit Ratio (summary)

     Purpose - 딕셔너리 캐쉬 전체의 적중률을 점검한다. 

     Description - 딕셔너리 캐쉬는 데이터 딕셔너리 정보를 캐쉬시켜두는 영역으로 Shared Pool에서 
         할당한다. 딕셔너리 캐쉬의 크기를 사용자가 따로 지정할 수는 없으며, 오라클은 Shared Pool
         가운데 딕셔너리 캐쉬를 우선적으로 할당하므로 라이브러리 캐쉬의 적중률이 양호하다면 
         당연히 딕셔너리 캐쉬의 적중률 또한 양호할 것이다. 한가지 고려할 점은, 인스턴스가 기동된 
         지 얼마간의 시간이 지난 후에야 이 값이 의미가 있다는 점이다. 
         
     Criteria - 90.0 % Minimum 
          
     Guide - Dictionary Cache의 적중률은 90%이상을 유지할 것을 권장한다. 적중률이 기준값 이하일 
        경우에는 초기화 파라미터 shared_pool_size를 변경하여 Shared Pool의 크기를 증가시켜 
        적중률을 높일 수 있다.  
#

select   to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') "Time",
round((1-sum(getmisses)/sum(gets))*100, 3) "Hit Ratio"
from     v$rowcache
/


doc
Total SGA
		Purpose - 총 SGA의 크기를 확인 한다.

#

show sga
/


doc
Shared Pool Free Space

     Purpose - Shared Pool내의 Free Memory 크기를 확인한다 

     Description - Shared Pool은 라이브러키 캐쉬, 딕셔너리 캐쉬, Large Pool 등으로 구성된다. 여기에서
          알 수 있듯이 Shared Pool은 기본적으로 캐쉬를 위한 영역이므로 여유공간이 남아있는 한 기존 
          오브젝트의 ageout 없이 계속 소모하려는 속성이 있다. 따라서 라이브러리 캐쉬나 딕셔너리 
          캐쉬의 적중률이 양호하다면 일반적인 운영시간대에 free memory 크기가 낮은 상태를 유지하는
          것은 정상이다. 오히려, 항상 큰 free memory가 남아 있다면 Shared Pool이 불필요하게 크게 
          설정되어 있다는 것을 의미하며, 일시적으로 갑자기 free memory 크기가 증가하는 경우는 
          Fragmentation이 많이 발생하여 많은 오브젝트가 한꺼번에 flush된 것을 의미하므로 문제를 
          겪고 있다는 증상일 수 있다.
          일반적으로 Shared pool에서 문제가 되는 것은 시간이 지남에 따라 메모리 영역이 작은 
          조각으로 분할(Fragmentation)되어 사이즈가 큰 오브젝트의 로드를 위한 memory할당에 어려움을
          겪거나 심하게는 필요한 연속된 메모리 공간의 확보에 실패하여 ora-4031에러가 나는 경우이다. 
          특히, MTS로 운영되는 경우 UGA 영역이 Shared Pool에 할당되므로 Fragmentatio이 발생할 
          가능성이 더 높다. 오라클은 크기가 큰 오브젝트(5000 bytes 이상)들을 위해서 기본적으로 
          shared pool의 5% 정도를 따로 확보해서 관리하는데, 이 크기는 shared_pool_reserved_size 
          파라미터로 조정할 수 있다. 

     Guide - Shared Pool 메모리의 조각화를 예방하기 위한 조치로는 다음과 같은 방법이 있다.
         - 사이즈가 큰 PL/SQL 블럭의 사용을 자제한다.
         - 불가피하게 사이즈가 큰 PL/SQL 오브젝트는 DBMS_SHARED_POOL.KEEP을 사용하여 KEEP한다.
         -  Literal SQL을 바인드 변수를 사용하도록 수정해 준다.
         - shared_pool_reserved_size의 증가를 고려한다.
         - MTS의 경우 세션별로 지나치게 많은 UGA영역을 할당하지 않도록 주의하여 애플리케이션을 작성한다.

#

col "Shared Pool Reserved(MB)" format a40

select   s.total "Shared Pool Total(MB)",
         s.free - r.r_free "Shared Pool Free(MB)",
         'Free : ' || r.r_free || ',      Used : ' ||r.r_used "Shared Pool Reserved(MB)",
         s.other - r.r_used   "Shared Pool Other(MB)"
         from (select round(sum(bytes/1024/1024),2) total,
         round(sum(decode(name, 'free memory', bytes))/1024/1024,2) free,
         round(sum(decode(name, 'free memory',null, bytes))/1024/1024,2) other
         from   v$sgastat
         where  pool = 'shared pool' ) s,
         (select round(nvl(sum(free_space),0)/1024/1024,2) r_free,
         round(nvl(sum(used_space),0)/1024/1024,2) r_used
from v$shared_pool_reserved ) r
/


doc
Redo Log Switch Time Interval

     Purpose - Redo Log Switch의 Time Interval을 확인한다.  

     Description - 최근 3일간에 대하여 Log Switch가 발생한 간격을 시간당 평균수치로 보여준다. 

     Criteria - 10.0 min Minimum 

     Guide - Redo Log Switch의 Time Interval이 10분이하로 계속된다면, redo log file의 size를 증가시켜서 
             redo log switch가 너무 자주 발생하지 않도록 하여 checkpoint에 의한 I/O를 예방할 수 있다, 
             또한 생략할 수 있는 데이터베이스내의 Trasaction을 없애는 방식으로 작업을 하여 성능의 
             개선효과를 볼수 있다
     예: CREATE TABLE AS SELECT … NOLOGGING, CREATE INDEX ..... NOLOGGING등. 
#


select /*+ use_hash(a b) */ a.thread#, to_char(a.first_time,'YYYY/MM/DD HH24') "Time",
        round(avg(trunc((a.first_time - b.first_time)*24*60,3)),2) "Interval(Min)"
from
       (select thread#, sequence#, first_time  from v$loghist where first_time  > sysdate -3) a,
       (select thread#, sequence#, first_time  from v$loghist where first_time  > sysdate -3) b
where a.thread# = b.thread#
        and a.sequence# = b.sequence# + 1
group by a.thread#, to_char(a.first_time,'YYYY/MM/DD HH24')
/


doc
~~~~ I/O ~~~~

File I/O 

     Purpose - 데이터 파일의 I/O 정도 및 시간을 확인한다. 

     Description - Read(%), Write(%), Total IO(%)는 데이터베이스내의 모든 파일에 대한 Read, Write, 
             Read+Write 가운데 해당 파일이 차지하는 비율의 의미한다. 
     Guide - 평균 I/O 시간이 긴 데이터 파일에 대해서는 해당 데이터 파일이 위치한 Disk의 성능을 고려해 
           봐야 하며, 많은 데이터 파일이 같은 위치에 있으므로 해서 발생하는 I/O 병목현상이 발생하는지를 
           확인해야 한다. 또한, I/O가 많이 발생하는 데이터 파일은 하나의 Device에 몰리지 않도록 분산시킨다. 
#

col "Name" format a50
SELECT name "Name",
       phyrds "Phy Rds",
       phywrts "Phy Wrts",
       phyrds+phywrts "Total IO",
       trunc(phyrds/read_sum*100,2) "Read(%%)",
       trunc(phywrts/write_sum*100,2) "Write(%%)",
       trunc( (phyrds+phywrts) / (read_sum+write_sum) * 100 , 2) "Total IO(%%)",
       avgiotim "Avg IO Time"
FROM v$filestat a, v$datafile b,
        (select sum(phyrds) read_sum, sum(phywrts) write_sum
         from v$filestat ) c
WHERE a.file# = b.file#
order by phyrds+phywrts desc
/


doc
Memory Sort Ratio

     Purpose - 정렬작업이 메모리에서 수행된 비율을 확인한다. 

     Description - Order by, Group by 구문처리, Join수행, Index 생성 등을 처리하기 위해서는 정렬작업을 
           필요로한다. 이러한 정렬작업은 가능한 메모리(Sort Area)내에서 수행되는 것이 바람직하나, 
          처리량이 많아 메모리에서 수행될 수 없는 경우 오라클은 Temporary Segment를 사용한다. 
         
     Criteria - 99.0 % Minimum 

     Guide - 메모리에서 정렬작업을 수행한 비율이 99%가 넘지 않을 경우에는 init.ora의 sort_area_size를 증가한다. 
             보통의 경우 OLTP 시스템에서는 500K ~ 10M 까지 지정하고 DW 시스템에서는 1M ~ 50M 까지 지정한다. 
             또한 sort_area_retained_size는 sort_area_size의 1/2이나 1/4로 지정한다.
     주의 : 이 메모리 공간은 SGA내에 존재하는 것이 아니라 각각의 프로세스별로 할당되기 때문에 O/S의 전체 
              메모리의 여유가 있을 경우에 증가시킨다. 
#

select a.value "Sort(memory)",
       b.value "Sort(disk)",
       round(a.value/(a.value+b.value) * 100 ,2) "Memory Sort Ratio"
from v$sysstat a, v$sysstat b
       where a.name = 'sorts (memory)'
       and b.name = 'sorts (disk)'
/


doc
System Wait Event

     Purpose - 데이타베이스 전체의 Wait Event의 정보를 확인한다. 

     Description - 데이터베이스 전체에 대해 발생한 Event내역을 확인한다. 이 값은 v$system_event를 조회한 
           것이며 인스턴스 시작 후 누적된 값이다.일부 플랫폼에서는 timed_statistics 파라미터가 FALSE로 
           설정되어있으면 time관련 항목이 0로 표시된다.  
      
     Guide - 각 Wait Event의 종류에 따라서 Waiting이 많이 발생하는 Event 대한 적절한 해결조치를 취해야 한다. 
           이러한 Waiting은 실제 수행되는 작업의 성능을 저하 시키므로 가장 많이 발생하는 Wait Event를 
           중점적으로 해소 시킨다. 이 정보는 Orange의 Database Information 툴에서도 확인 가능하다. 

#
col event format a35
select event, total_waits "Total Waits",
     time_waited "Time Waited(cs)",
     round(average_wait,5) "Avg Wait Time(cs)",
     total_timeouts "Total Timeouts"
from v$system_event
where event not like '%SQL*Net%'
       and event not like '%pipe get%'
       and event not like '%rdbms ipc%'
       and event not like '%smon timer%'
       and event not like '%pmon timer%'
       and time_waited > 0
order by time_waited desc
/


doc
Invalid Object Count

     Purpose - 오브젝트의 유형별로 Invalid상태인 오브젝트의 수를 점검한다. 

     Description - Invalid Object가 생기는 원인은 다양한데, 일반적으로 권한이나 Synonym의 
            누락에 의해 발생하거나, 뷰 또는 프로시져, 트리거 등이 참조하고 있는 상위 오브젝트의 
            변경 및 삭제 등에 의해 발생한다. 

     Guide - Invalid Object를 컴파일하여 주는 것은 PC에서 Scandisk를 수행하는 것과 
      마찬가지로 데이터베이스의 관리에 있어 가장 기본적인 작업에 해당하므로 이를 
      주기적으로 점검하고 해결하여 주는 것이 좋다. 특히, Export/Import 작업수행 후, 
      또는 오라클 버전 upgrade나 patch적용 후에 다수의 오브젝트들이 Invalid상태로 
      빠져버리는 경우가 많이 발생하므로 이러한 작업 후에는 반드시 Invalid Object의 
      존재여부를 점검하여 컴파일을 수행하여 주어야 한다.  
#
select /*+ ORDERED_PREDICATES  */
object_type "Object Type",
count(*) "Invalid Count"
from dba_objects
where status  = 'INVALID'
group by object_type
/


doc
Rollback Segment Hit Ratio

     Purpose - Rollback Segment의 Hit Ratio를 확인한다 

     Description - Rollback Segment의 갯수보다 동시 Transaction의 수가 많은 경우 Rollback segment의 할당시 
             Waiting이 발생하므로 Online Rollback Segment의 개수를 늘려주어야 한다. 
        
     Criteria - 99.0 % Minimum 

     Guide  - Rollback Segment의 개수는 일반적으로 아래의 공식에 따라 설정하되 최대 50개를 넘지 않는 것이 좋다.
  N < 16 --> 4 rbs
  16 <= N <= 32 --> 8 rbs
  32 < N --> N/4 rbs 
  ( N: 동시 트랜잭션의 수 )
            또한, 롤백 세그먼트는 Online 트랜잭션 용과 배치 작업용으로 구분해서 생성하는 것이 좋다. Online 
            트랜잭션 용으로는 대부분 initial 1M, next 1M 이면 충분하며 배치 작업용은 작업의 양에 따라 크기를 
            크게 생성한다. 물론 배치작업을 수행 할 때는 배치 작업용 롤백세그먼트를 사용토록 트랜잭션의 시작
             부분에서 'set transaction use rollback segment big_rbs01;'를 먼저 수행하고 배치작업을 수행한다 


#

select name "Rollback Segment",
     rssize "Rsize", writes "Writes", xacts "Xacts", status "Status",
     waits "Waits", gets "Gets",
     decode(gets,0,-1, trunc((1-(waits/gets))*100, 5)) "Hit ratio"
from v$rollstat, v$rollname
where v$rollstat.usn = v$rollname.usn
order by waits/gets desc
/


doc
Tablespace Usage and Fragmentation

     Purpose - 테이블 스페이스의 사용현황과 Fragmentation을 점검한다 

     Description - 테이블 스페이스의 총 할당량과 사용량을 점검하고, Free Space의 총 크기와 Max Free Extent의 크기, 
              Free Extent 갯수 등 Fragmentation 내역을 확인한다. 테이블 스페이스가 Fragmentation이 많이 발생했을 
              경우에는 새로운 Extent를 생성할 때 남은 공간이 있음에도 연속적인 크기의 Free 공간이 없어서 Error가 
              발생할 수 있다.  
         
     Guide - 만약 Free space들이 서로 연속되어 있지 않아 병합이 불가능한 상태일 경우에는 Object를 Export한 후 
              Coalesce하고 다시 import하여 Fragmentation을 해소 할 수 있다. 바람직한 것은 Fragmentation을 사전에 
              예방하는 것이며, 이를 예방하기 위해서 테이블 스페이스 단위로 생성되는 오브젝트의 extent의 크기를
              단계별로 1M, 10M, 50M, 100M등으로 정하여 생성하는 방법도 있다. 테이블스페이스와 세그먼트의 물리적 
              저장상태는 오렌지의 Space Manager를 사용하여 쉽게 확인할 수 있다. 
#

select df.tablespace_name "Tablespace",
        round(df.TBS_byte /1048576,2) "Total(MB)",
        round((df.TBS_byte - fs.Free_byte)/1048576,2) "Used(MB)",
        round(fs.Free_byte /1048576,2) "Free(MB)",
        round((fs.Free_byte/df.TBS_byte) *100,0) "Free(%%)",
        fs.pieces "Pieces",
        round(fs.Max_free /1048576,2) "MaxFree(MB)"
from   ( select tablespace_name, sum(bytes) TBS_byte
         from dba_data_files group by tablespace_name ) df,
        ( select tablespace_name, max(bytes) Max_free, sum(bytes) Free_byte, count(*) pieces
         from dba_free_space group by tablespace_name ) fs,
        ( select tablespace_name, initial_extent, next_extent
         from dba_tablespaces ) db
where df.tablespace_name = db.tablespace_name
and   df.tablespace_name = fs.tablespace_name(+)
order by 5
/


doc
Objects with Possible Extent Problem

     Purpose - next extents가 발생할 경우에 공간의 부족으로 Error가 발생할 여지가 있는 Object를 확인한다 

     Description - next extents가 발생할 경우에 공간의 부족으로 Error가 발생할 여지가 있는 Object를 확인한다. 
             남아있는 Free Extent 가운데 가장 큰 조각보다 큰 Next Extent가 설정되어있는 테이블이 존재할 경우 
             다음 Extent할당시 Error가 날 수 있으므로 사전에 조치를 취해주어야 한다. 
        
     Guide - 향후 사이즈의 증가가 크지 않을 것으로 예상되는 Table일 경우에는 Next Extent를 작은 사이즈로 
             변경하고, 만약 해당 Table이 점점 커질 수 있는 경우라면 테이블스페이스 자체의 크기를 증가시켜
             주어야 한다. 

#

select u.name owner,
        o.name segment_name,
        so.object_type segment_type,
        f.name tablespace_name,
        round(f.avail/1024/1024, 1) "Max Free(MB)",
        round(s.extsize * f.blocksize/1024/1024, 1) "Next(MB)",
        round(s.blocks*f.blocksize/1024/1024, 1) "Total Size(MB)",
        s.extents "Exts"
from sys.obj$ o,
        sys.sys_objects so,
        sys.seg$ s,
        sys.user$ u,
        (
             select ts.ts#, ts.name, ts.blocksize,
                    max(f.length * ts.blocksize) avail
             from sys.ts$ ts,
              sys.fet$ f
             where ts.ts# = f.ts#
             and ts.bitmapped = 0
             group by ts.ts#, ts.name, ts.blocksize ) f
where s.file# = so.header_file
       and s.block# = so.header_block
       and f.ts# = so.ts_number
       and s.ts# = f.ts#
       and o.obj# = so.object_id
       and o.owner# = u.user#
       and s.type# = so.segment_type_id
       and o.type# = so.object_type_id
       and so.object_type in ('TABLE', 'INDEX', 'CLUSTER')
       and sign(f.avail-s.extsize * f.blocksize) = -1
/


doc
OPS/RAC Status
#

select value 
from
v$option where parameter IN ('Parallel Server', 'Real Application Clusters')
/


doc

User Objects in SYSTEM Tablespace

     Purpose - System Tablespace내의 일반 User의 Object를 확인한다 

     Description - System Tablespace는 데이타베이스 운영을 위해 오라클에 의해 빈번하게 사용되는 영역이므로 일반 
             유저의 Object는 다른 Tablespace로 옮겨야 한다. 
        
     Guide - SYSTEM 테이블스페이스에 저장된 오브젝트들은 Export를 한후 새로운 Tablespace에 Create하고 데이터를 
             Import하거나 'Alter table move …' 등의 명령어를 이용하여 옮긴다. 
#

select owner "Owner", segment_name "Segment Name", segment_type "Segment Type"
from dba_segments
where tablespace_name = 'SYSTEM'
and owner not in ('SYSTEM', 'SYS', 'OUTLN', 'DBSNMP', 'MDSYS', 'ORDSYS','OLAPDBA', 'ORDPLUGINS', 
'OLAPSVR', 'OSE$HTTP$ADMIN', 'AURORA$ORB$UNAUTHENTICATED', 'AURORA$JIS$UTILITY$')
/


doc
Chained Row Ratio     

     Purpose - Chained Row를 Access한 비율을 확인한다. 

     Description - Table Full Scan 또는 Index Scan에 의해 액세스된 모든 로우가운데 Row Chaining에 의해서 추가로 
               액세스가 발생한 비율을 확인한다. 
           
     Criteria - 1.0 % Maximum 

     Guide - Chained Row를 Access한 비율이 1% 이상의 값이 나올 경우에는 자주 사용되는 Object에 Chaining이 많이 
             발생하였음을 의미하므로 이를 Reorg하여서 Chaining을 없애주는 것이 좋다. 

#
SELECT sum(decode(name,'table fetch continued row',value,0)) "Chained row Access",
  sum(decode(name,'table fetch by rowid',value,0)) "Index Access",
  sum(decode(name,'table scan rows gotten',value,0)) "Table Scan Access",
  round(sum(decode(name,'table fetch continued row',value,0)) /
  (sum(decode(name,'table fetch by rowid',value,0)) + sum(decode(name,'table scan rows gotten',value,0))) * 100,5) "Ratio"
FROM v$sysstat
/

spool off
