spool health.txt
doc
  Oracle health check script

  Modified by JUNG SUNG IL

~~~ GENERAL ~~~

Oracle Instance Information

     Purpose - ��� �����ͺ��̽� �ν��Ͻ��� �⺻������ Ȯ���Ѵ�.
#
set pages 40
set line 150
col host format a20

select host_name "Host", version "Version", name "DB Name", startup_time "Startup Time", parallel "Parallel",
				log_mode "Log Mode", archiver "Archiver"
from v$instance, v$database
/


doc

��ī�̺� ��� ����

			Purpose - ���� ��ī�̺� ��� ���¿� ��ġ�� �����ش�.

#

archive log list
/


doc
Resource Limit

     Purpose - ����Ÿ���̽��� �ý��۸��ҽ��� �Ҵ系���� �Ҹ���Ȳ�� Ȯ���Ѵ�. 

     Description - �ν��Ͻ� ���۽� �Ҵ�Ǵ� �ý����ڿ��� ���Ͽ� �Ҵ簪�� �Ҹ���Ȳ�� 
      ����͸��Ͽ� �Ҵ��ڿ��� ������ ��� ������ ��ġ�� �����־�� �Ѵ�. ��κ��� ��� �����Ǵ�
      �ʱ�ȭ �Ķ���͸� ���� �������� ������ �� �ִ�. �� ������ �������� Database Information 
      ������ ���÷� Ȯ���� �� �ִ�. 

     Guide - Resource Name���� Max util ���� Limit ���� �����ϰų� ���� ���� ��쿡�� 
             init.ora ���Ͽ��� �ش� ���ҽ��� �����ϴ� �ʱ�ȭ �Ķ������ ���� �÷��־�� �Ѵ�.  
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
     Purpose - ��� ����Ÿ���̽��� ���ӵǾ� �ִ� ��� Session�� ���� �۾����� Session�� ���� Ȯ���Ѵ�.
#

select to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') "Time",
count(*) "Total Sessions",
count(decode(status, 'ACTIVE',1) ) "Active Sessions"
from v$session
/


doc 
~~~ SGA ~~~

Buffer Cache Hit Ratio

     Purpose - �����ͺ��̽� ����ĳ���� ���߷��� �����Ѵ�. 

     Description - Buffer Cache�� �⺻���� ����� ���� ���μ����� ���� �������� ���� �׼��� 
           �Ǵ� �����ͺ��̽� ����� �޸𸮿� ĳ���Ͽ� �������� ��ũ IO�� �ּ�ȭ�����ν� �� 
           ���� �׼��� �ӵ��� �����ϱ� ���� ���̴�. ����ĳ���� ���߷��̶� ���ø�ĳ�̼��� 
           �׼����� �޸� �� ��� �̹� ĳ���� �Ǿ��־� ������ IO���� �׼��� �� �� �־��� 
           ���� ������ ��Ÿ����. ���� �����ͺ��̽� ������ ���߷��� ���尪 �̸��� ��쿡�� 
           �Ҵ�� ���� ĳ���� ũ�Ⱑ �ʹ� ���ų�, �Ǵ� ����ġ�� ���� I/O�� �����ϴ� ���ø����̼���
            �����Ѵٴ� ���� �ǹ��Ѵ�. 
       
     Criteria - 90.0 % Minimum 

     Guide - �����ͺ��̽� ����ĳ���� ���߷��� OLTP, DSS, DW�� �����ͺ��̽��� ����ϴ� ���ø����̼���
          Ư���� ���� ���尪�� �ٸ���. �Ϲ�������, OLTP�ý����� 90%�̻��� �Ǿ�� �ϰ� DSS, DW 
          �ý����� 80~85%�̻��̸� ���ٰ� �� �� ������, �����ϰ� ��ġ(Batch) ó������ ������ 
          �ý����� ���� 50%�� �ص����� �� ��ü�� ������ �ȴٰ� ������ �� ����.
          �����ͺ��̽� ����ĳ���� ���߷��� ���ذ����� ���� ��쿡�� �ʱ�ȭ �Ķ���� db_block_buffers��
          ���� �÷� ����ĳ���� ũ�⸦ ������ų �� �ִ�. �̶� O/S�� �޸𸮰� ���� �ִ��� Ȯ�� �Ͽ���
           �ϸ� �޸� �������� Paging, Swapping�� �߻����� �ʴ� �ѵ������� �������� �־�� �Ѵ�. 
          �׷��� ��ũ���� ��� �����ͺ��� ĳ����Ű�� ���� ���������� �Ұ����ϹǷ� �Ϲ������� 
          ����ĳ���� ������ �ּ��� �ذ�å�� �� ���� ����. Ư��, �ٷ��� ��ũ ����� ����� 
          Full Scan�ϴ� ���ø����̼��� �����Ѵٸ� ���߷��� ���� �������� �����ϴ� ���� �Ұ����ϹǷ�
           �׼��������� ��ȿ������ ���ø����̼��� �����Ͽ� �������� Ʃ���� ������ �־�� �Ѵ�. 
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

     Purpose ���̺귯�� ĳ�� ��ü�� ���߷��� �����Ѵ�. 

     Description - ����Ŭ�� SQL �Ľ� �۾��� ���� CPU�� ����� �ڿ������ �ּ�ȭ�ϰ�, 
      SQL�� ����ð��� ����� �޸� ���� ���� ������ ���Ͽ� SGA ��� �Ϻ��� 
      Shared Pool���� SQL�� �����ϰ� �ִµ�, �� ������ ���̺귯�� ĳ����� �Ѵ�. 
      ���⼭ ���̺귯�� ĳ���� ���߷��� PinsȽ�� ��� ReloadsȽ���� ������ ������ 
      ���Ǹ�, �̶� Pins�� ĳ������ SQL Ŀ���� ����Ƚ��, Reloads�� ĳ���� �����ϴ� 
      SQLĿ�� ������ �޸� ������ ageout�ǰų� invalidate�Ǿ��ٰ� �ٽ� Load�� Ƚ����
       �ǹ��Ѵ�. ����ϸ�, ���̺귯�� ĳ���� ���߷��̶� �����Ϸ��� SQL Ŀ�� ������ 
       (ageout���� �ʰ�) ���̺귯�� ĳ������ ������ Ȯ���� �ǹ��Ѵ�. 
       
     Criteria - 99.0 % Minimum 

     Guide - ���̺귯�� ĳ���� ���߷��� 99% �̻��� ������ ���� �����Ѵ�. �� ���� ���尪���� 
             ���� ��쿡�� �ʱ�ȭ �Ķ���� shared_pool_size�� ����Ͽ� Shared Pool�� ũ�⸦
             �������� ������ų �� �ִ�. ���� ȿ������ ����, ���Ǵ� SQL�� ���� ������ ���̱� 
             ���� Literal SQL(�������� ������� ����ϴ� SQL)�� ���ε� ������ ����ϵ��� ������ 
             �ִ� ���̴�. 
# 

select   to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') "Time",
round((1-(sum(reloads)/sum(pins)))*100, 3) "Hit Ratio(Pins-Reloads)"
from     v$librarycache
/


doc
Dictionary Cache Hit Ratio (summary)

     Purpose - ��ųʸ� ĳ�� ��ü�� ���߷��� �����Ѵ�. 

     Description - ��ųʸ� ĳ���� ������ ��ųʸ� ������ ĳ�����ѵδ� �������� Shared Pool���� 
         �Ҵ��Ѵ�. ��ųʸ� ĳ���� ũ�⸦ ����ڰ� ���� ������ ���� ������, ����Ŭ�� Shared Pool
         ��� ��ųʸ� ĳ���� �켱������ �Ҵ��ϹǷ� ���̺귯�� ĳ���� ���߷��� ��ȣ�ϴٸ� 
         �翬�� ��ųʸ� ĳ���� ���߷� ���� ��ȣ�� ���̴�. �Ѱ��� ����� ����, �ν��Ͻ��� �⵿�� 
         �� �󸶰��� �ð��� ���� �Ŀ��� �� ���� �ǹ̰� �ִٴ� ���̴�. 
         
     Criteria - 90.0 % Minimum 
          
     Guide - Dictionary Cache�� ���߷��� 90%�̻��� ������ ���� �����Ѵ�. ���߷��� ���ذ� ������ 
        ��쿡�� �ʱ�ȭ �Ķ���� shared_pool_size�� �����Ͽ� Shared Pool�� ũ�⸦ �������� 
        ���߷��� ���� �� �ִ�.  
#

select   to_char(sysdate,'yyyy/mm/dd hh24:mi:ss') "Time",
round((1-sum(getmisses)/sum(gets))*100, 3) "Hit Ratio"
from     v$rowcache
/


doc
Total SGA
		Purpose - �� SGA�� ũ�⸦ Ȯ�� �Ѵ�.

#

show sga
/


doc
Shared Pool Free Space

     Purpose - Shared Pool���� Free Memory ũ�⸦ Ȯ���Ѵ� 

     Description - Shared Pool�� ���̺귯Ű ĳ��, ��ųʸ� ĳ��, Large Pool ������ �����ȴ�. ���⿡��
          �� �� �ֵ��� Shared Pool�� �⺻������ ĳ���� ���� �����̹Ƿ� ���������� �����ִ� �� ���� 
          ������Ʈ�� ageout ���� ��� �Ҹ��Ϸ��� �Ӽ��� �ִ�. ���� ���̺귯�� ĳ���� ��ųʸ� 
          ĳ���� ���߷��� ��ȣ�ϴٸ� �Ϲ����� ��ð��뿡 free memory ũ�Ⱑ ���� ���¸� �����ϴ�
          ���� �����̴�. ������, �׻� ū free memory�� ���� �ִٸ� Shared Pool�� ���ʿ��ϰ� ũ�� 
          �����Ǿ� �ִٴ� ���� �ǹ��ϸ�, �Ͻ������� ���ڱ� free memory ũ�Ⱑ �����ϴ� ���� 
          Fragmentation�� ���� �߻��Ͽ� ���� ������Ʈ�� �Ѳ����� flush�� ���� �ǹ��ϹǷ� ������ 
          �ް� �ִٴ� ������ �� �ִ�.
          �Ϲ������� Shared pool���� ������ �Ǵ� ���� �ð��� ������ ���� �޸� ������ ���� 
          �������� ����(Fragmentation)�Ǿ� ����� ū ������Ʈ�� �ε带 ���� memory�Ҵ翡 �������
          �ްų� ���ϰԴ� �ʿ��� ���ӵ� �޸� ������ Ȯ���� �����Ͽ� ora-4031������ ���� ����̴�. 
          Ư��, MTS�� ��Ǵ� ��� UGA ������ Shared Pool�� �Ҵ�ǹǷ� Fragmentatio�� �߻��� 
          ���ɼ��� �� ����. ����Ŭ�� ũ�Ⱑ ū ������Ʈ(5000 bytes �̻�)���� ���ؼ� �⺻������ 
          shared pool�� 5% ������ ���� Ȯ���ؼ� �����ϴµ�, �� ũ��� shared_pool_reserved_size 
          �Ķ���ͷ� ������ �� �ִ�. 

     Guide - Shared Pool �޸��� ����ȭ�� �����ϱ� ���� ��ġ�δ� ������ ���� ����� �ִ�.
         - ����� ū PL/SQL ���� ����� �����Ѵ�.
         - �Ұ����ϰ� ����� ū PL/SQL ������Ʈ�� DBMS_SHARED_POOL.KEEP�� ����Ͽ� KEEP�Ѵ�.
         -  Literal SQL�� ���ε� ������ ����ϵ��� ������ �ش�.
         - shared_pool_reserved_size�� ������ ����Ѵ�.
         - MTS�� ��� ���Ǻ��� ����ġ�� ���� UGA������ �Ҵ����� �ʵ��� �����Ͽ� ���ø����̼��� �ۼ��Ѵ�.

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

     Purpose - Redo Log Switch�� Time Interval�� Ȯ���Ѵ�.  

     Description - �ֱ� 3�ϰ��� ���Ͽ� Log Switch�� �߻��� ������ �ð��� ��ռ�ġ�� �����ش�. 

     Criteria - 10.0 min Minimum 

     Guide - Redo Log Switch�� Time Interval�� 10�����Ϸ� ��ӵȴٸ�, redo log file�� size�� �������Ѽ� 
             redo log switch�� �ʹ� ���� �߻����� �ʵ��� �Ͽ� checkpoint�� ���� I/O�� ������ �� �ִ�, 
             ���� ������ �� �ִ� �����ͺ��̽����� Trasaction�� ���ִ� ������� �۾��� �Ͽ� ������ 
             ����ȿ���� ���� �ִ�
     ��: CREATE TABLE AS SELECT �� NOLOGGING, CREATE INDEX ..... NOLOGGING��. 
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

     Purpose - ������ ������ I/O ���� �� �ð��� Ȯ���Ѵ�. 

     Description - Read(%), Write(%), Total IO(%)�� �����ͺ��̽����� ��� ���Ͽ� ���� Read, Write, 
             Read+Write ��� �ش� ������ �����ϴ� ������ �ǹ��Ѵ�. 
     Guide - ��� I/O �ð��� �� ������ ���Ͽ� ���ؼ��� �ش� ������ ������ ��ġ�� Disk�� ������ ����� 
           ���� �ϸ�, ���� ������ ������ ���� ��ġ�� �����Ƿ� �ؼ� �߻��ϴ� I/O ���������� �߻��ϴ����� 
           Ȯ���ؾ� �Ѵ�. ����, I/O�� ���� �߻��ϴ� ������ ������ �ϳ��� Device�� ������ �ʵ��� �л��Ų��. 
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

     Purpose - �����۾��� �޸𸮿��� ����� ������ Ȯ���Ѵ�. 

     Description - Order by, Group by ����ó��, Join����, Index ���� ���� ó���ϱ� ���ؼ��� �����۾��� 
           �ʿ���Ѵ�. �̷��� �����۾��� ������ �޸�(Sort Area)������ ����Ǵ� ���� �ٶ����ϳ�, 
          ó������ ���� �޸𸮿��� ����� �� ���� ��� ����Ŭ�� Temporary Segment�� ����Ѵ�. 
         
     Criteria - 99.0 % Minimum 

     Guide - �޸𸮿��� �����۾��� ������ ������ 99%�� ���� ���� ��쿡�� init.ora�� sort_area_size�� �����Ѵ�. 
             ������ ��� OLTP �ý��ۿ����� 500K ~ 10M ���� �����ϰ� DW �ý��ۿ����� 1M ~ 50M ���� �����Ѵ�. 
             ���� sort_area_retained_size�� sort_area_size�� 1/2�̳� 1/4�� �����Ѵ�.
     ���� : �� �޸� ������ SGA���� �����ϴ� ���� �ƴ϶� ������ ���μ������� �Ҵ�Ǳ� ������ O/S�� ��ü 
              �޸��� ������ ���� ��쿡 ������Ų��. 
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

     Purpose - ����Ÿ���̽� ��ü�� Wait Event�� ������ Ȯ���Ѵ�. 

     Description - �����ͺ��̽� ��ü�� ���� �߻��� Event������ Ȯ���Ѵ�. �� ���� v$system_event�� ��ȸ�� 
           ���̸� �ν��Ͻ� ���� �� ������ ���̴�.�Ϻ� �÷��������� timed_statistics �Ķ���Ͱ� FALSE�� 
           �����Ǿ������� time���� �׸��� 0�� ǥ�õȴ�.  
      
     Guide - �� Wait Event�� ������ ���� Waiting�� ���� �߻��ϴ� Event ���� ������ �ذ���ġ�� ���ؾ� �Ѵ�. 
           �̷��� Waiting�� ���� ����Ǵ� �۾��� ������ ���� ��Ű�Ƿ� ���� ���� �߻��ϴ� Wait Event�� 
           ���������� �ؼ� ��Ų��. �� ������ Orange�� Database Information �������� Ȯ�� �����ϴ�. 

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

     Purpose - ������Ʈ�� �������� Invalid������ ������Ʈ�� ���� �����Ѵ�. 

     Description - Invalid Object�� ����� ������ �پ��ѵ�, �Ϲ������� �����̳� Synonym�� 
            ������ ���� �߻��ϰų�, �� �Ǵ� ���ν���, Ʈ���� ���� �����ϰ� �ִ� ���� ������Ʈ�� 
            ���� �� ���� � ���� �߻��Ѵ�. 

     Guide - Invalid Object�� �������Ͽ� �ִ� ���� PC���� Scandisk�� �����ϴ� �Ͱ� 
      ���������� �����ͺ��̽��� ������ �־� ���� �⺻���� �۾��� �ش��ϹǷ� �̸� 
      �ֱ������� �����ϰ� �ذ��Ͽ� �ִ� ���� ����. Ư��, Export/Import �۾����� ��, 
      �Ǵ� ����Ŭ ���� upgrade�� patch���� �Ŀ� �ټ��� ������Ʈ���� Invalid���·� 
      ���������� ��찡 ���� �߻��ϹǷ� �̷��� �۾� �Ŀ��� �ݵ�� Invalid Object�� 
      ���翩�θ� �����Ͽ� �������� �����Ͽ� �־�� �Ѵ�.  
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

     Purpose - Rollback Segment�� Hit Ratio�� Ȯ���Ѵ� 

     Description - Rollback Segment�� �������� ���� Transaction�� ���� ���� ��� Rollback segment�� �Ҵ�� 
             Waiting�� �߻��ϹǷ� Online Rollback Segment�� ������ �÷��־�� �Ѵ�. 
        
     Criteria - 99.0 % Minimum 

     Guide  - Rollback Segment�� ������ �Ϲ������� �Ʒ��� ���Ŀ� ���� �����ϵ� �ִ� 50���� ���� �ʴ� ���� ����.
  N < 16 --> 4 rbs
  16 <= N <= 32 --> 8 rbs
  32 < N --> N/4 rbs 
  ( N: ���� Ʈ������� �� )
            ����, �ѹ� ���׸�Ʈ�� Online Ʈ����� ��� ��ġ �۾������� �����ؼ� �����ϴ� ���� ����. Online 
            Ʈ����� �����δ� ��κ� initial 1M, next 1M �̸� ����ϸ� ��ġ �۾����� �۾��� �翡 ���� ũ�⸦ 
            ũ�� �����Ѵ�. ���� ��ġ�۾��� ���� �� ���� ��ġ �۾��� �ѹ鼼�׸�Ʈ�� ������ Ʈ������� ����
             �κп��� 'set transaction use rollback segment big_rbs01;'�� ���� �����ϰ� ��ġ�۾��� �����Ѵ� 


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

     Purpose - ���̺� �����̽��� �����Ȳ�� Fragmentation�� �����Ѵ� 

     Description - ���̺� �����̽��� �� �Ҵ緮�� ��뷮�� �����ϰ�, Free Space�� �� ũ��� Max Free Extent�� ũ��, 
              Free Extent ���� �� Fragmentation ������ Ȯ���Ѵ�. ���̺� �����̽��� Fragmentation�� ���� �߻����� 
              ��쿡�� ���ο� Extent�� ������ �� ���� ������ �������� �������� ũ���� Free ������ ��� Error�� 
              �߻��� �� �ִ�.  
         
     Guide - ���� Free space���� ���� ���ӵǾ� ���� �ʾ� ������ �Ұ����� ������ ��쿡�� Object�� Export�� �� 
              Coalesce�ϰ� �ٽ� import�Ͽ� Fragmentation�� �ؼ� �� �� �ִ�. �ٶ����� ���� Fragmentation�� ������ 
              �����ϴ� ���̸�, �̸� �����ϱ� ���ؼ� ���̺� �����̽� ������ �����Ǵ� ������Ʈ�� extent�� ũ�⸦
              �ܰ躰�� 1M, 10M, 50M, 100M������ ���Ͽ� �����ϴ� ����� �ִ�. ���̺����̽��� ���׸�Ʈ�� ������ 
              ������´� �������� Space Manager�� ����Ͽ� ���� Ȯ���� �� �ִ�. 
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

     Purpose - next extents�� �߻��� ��쿡 ������ �������� Error�� �߻��� ������ �ִ� Object�� Ȯ���Ѵ� 

     Description - next extents�� �߻��� ��쿡 ������ �������� Error�� �߻��� ������ �ִ� Object�� Ȯ���Ѵ�. 
             �����ִ� Free Extent ��� ���� ū �������� ū Next Extent�� �����Ǿ��ִ� ���̺��� ������ ��� 
             ���� Extent�Ҵ�� Error�� �� �� �����Ƿ� ������ ��ġ�� �����־�� �Ѵ�. 
        
     Guide - ���� �������� ������ ũ�� ���� ������ ����Ǵ� Table�� ��쿡�� Next Extent�� ���� ������� 
             �����ϰ�, ���� �ش� Table�� ���� Ŀ�� �� �ִ� ����� ���̺����̽� ��ü�� ũ�⸦ ��������
             �־�� �Ѵ�. 

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

     Purpose - System Tablespace���� �Ϲ� User�� Object�� Ȯ���Ѵ� 

     Description - System Tablespace�� ����Ÿ���̽� ��� ���� ����Ŭ�� ���� ����ϰ� ���Ǵ� �����̹Ƿ� �Ϲ� 
             ������ Object�� �ٸ� Tablespace�� �Űܾ� �Ѵ�. 
        
     Guide - SYSTEM ���̺����̽��� ����� ������Ʈ���� Export�� ���� ���ο� Tablespace�� Create�ϰ� �����͸� 
             Import�ϰų� 'Alter table move ��' ���� ��ɾ �̿��Ͽ� �ű��. 
#

select owner "Owner", segment_name "Segment Name", segment_type "Segment Type"
from dba_segments
where tablespace_name = 'SYSTEM'
and owner not in ('SYSTEM', 'SYS', 'OUTLN', 'DBSNMP', 'MDSYS', 'ORDSYS','OLAPDBA', 'ORDPLUGINS', 
'OLAPSVR', 'OSE$HTTP$ADMIN', 'AURORA$ORB$UNAUTHENTICATED', 'AURORA$JIS$UTILITY$')
/


doc
Chained Row Ratio     

     Purpose - Chained Row�� Access�� ������ Ȯ���Ѵ�. 

     Description - Table Full Scan �Ǵ� Index Scan�� ���� �׼����� ��� �ο찡� Row Chaining�� ���ؼ� �߰��� 
               �׼����� �߻��� ������ Ȯ���Ѵ�. 
           
     Criteria - 1.0 % Maximum 

     Guide - Chained Row�� Access�� ������ 1% �̻��� ���� ���� ��쿡�� ���� ���Ǵ� Object�� Chaining�� ���� 
             �߻��Ͽ����� �ǹ��ϹǷ� �̸� Reorg�Ͽ��� Chaining�� �����ִ� ���� ����. 

#
SELECT sum(decode(name,'table fetch continued row',value,0)) "Chained row Access",
  sum(decode(name,'table fetch by rowid',value,0)) "Index Access",
  sum(decode(name,'table scan rows gotten',value,0)) "Table Scan Access",
  round(sum(decode(name,'table fetch continued row',value,0)) /
  (sum(decode(name,'table fetch by rowid',value,0)) + sum(decode(name,'table scan rows gotten',value,0))) * 100,5) "Ratio"
FROM v$sysstat
/

spool off
