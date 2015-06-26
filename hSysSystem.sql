
create or replace PACKAGE  h$system AS
-- ------------------------------------------------
--
-- PL/SQL for H Package
--
-- Copyright 2016, HAD Family all rights reserved.
--
-- Author:
--  David Justin.
--
-- This package may not be copied, installed, or used except for the
-- express purpose of supporting applications supplied by HAD Family
-- or its designated agents.
-- ------------------------------------------------

    -- --------------------------------------------------
    -- Support functions.
    -- --------------------------------------------------


    -- --------------------------------------------------
    -- Load class info from database.
    -- --------------------------------------------------
     FUNCTION SYS_SQLHIST RETURN  hsysvalueset_t1;
     FUNCTION SYS_SQLHIST(p_dbuser in varchar2 , p_sqltext in varchar2) RETURN  hsysvalueset_t2;
    
     FUNCTION SYS_DIAGNOSIS RETURN hobjvalueset_t1;
     
     FUNCTION sys_dependency(p_owner in varchar2, p_object in varchar2) RETURN hobjvalueset_t1;
     
     FUNCTION sys_which(p_stmt in varchar2) RETURN hobjvalueset_t4;
     FUNCTION sys_info RETURN hobjvalueset_t2;
     
     PROCEDURE addChildLine(p_stmt in varchar2, idset in out hobjvalueset_t1);
     FUNCTION SYS_DU(p_type in varchar2) RETURN  hobjvalueset_t3;
     FUNCTION SYS_STORAGE RETURN hobjvalueset_t1;
     
     FUNCTION SYS_LIMIT RETURN hobjvalueset_t1;

END h$system;
/

   -- grant select on V_$SQLTEXT to USERNAME;
   -- grant select on V_$SQL to USERNAME
   -- grant select on v_$resource_limit to USERNAME;
   -- grant select on v_$database to USERNAME;
   -- grant select on v_$instance to USERNAME;
   -- grant select on v_$session to USERNAME;
   -- grant select on v_$sysstat to USERNAME;
   -- grant select on v_$librarycache to USERNAME;
   -- grant select on v_$rowcache to USERNAME;
   -- grant select on v_$shared_pool_reserved to USERNAME;
   -- grant select on v_$loghist to USERNAME;
   -- grant select on v_$filestat to USERNAME;
   -- grant select on v_$datafile to USERNAME;
   -- grant select on v_$system_event to USERNAME;
   -- grant select on v_$rollstat to USERNAME;
   -- grant select on v_$rollname to USERNAME;
   -- grant select on v_$option to USERNAME;
   -- grant select on v_$sgastat to USERNAME;
   -- grant select on v_$parameter to USERNAME;
   -- grant select on dba_tablespaces to USERNAME; 
   -- grant select on dba_data_files to USERNAME;
   -- grant select on dba_segments to USERNAME;
   -- grant select on dba_free_space to USERNAME;
   -- grant select on dba_dependencies to USERNAME;
   -- grant select on dba_objects to USERAME; 
CREATE OR REPLACE PACKAGE BODY h$system AS
-- ------------------------------------------------
--
-- PL/SQL for H Package
--
-- Copyright 2016, HAD Family all rights reserved.
--
-- Author:
--  David Justin.
--
-- This package may not be copied, installed, or used except for the
-- express purpose of supporting applications supplied by HAD Family
-- or its designated agents.
-- ------------------------------------------------
/*
      create or replace type hsysvalue_t1 as object 
     (DBSCHEMA       varchar2(4000), 
      TOTAL_SQL_CNT   varchar2(4000),
      UNIQUE_SQL_CNT  varchar2(4000),
      PHYSICAL_IO     varchar2(4000),
      DISK_IO         varchar2(4000),
      EXEC_TIME_AVG   varchar2(4000),
      EXEC_TIME_MAX   varchar2(4000),
      WORST_SQL_10SEC varchar2(4000),
      WAITING_TIME    varchar2(4000),
      USED_MEMORY     varchar2(4000),
      CPU_TIME        varchar2(4000)
      );
      create or replace TYPE hsysvalueset_t1 is TABLE OF hsysvalue_t1;

      create or replace type hsysvalue_t2 as object 
     (  DBSCHEMA    VARCHAR2(4000),
    LOADTIME    VARCHAR2(4000),
    SERVICE     VARCHAR2(4000),
    PHYSICAL_IO VARCHAR2(4000),
    DISK_IO     VARCHAR2(4000),
    EXEC_TIME   VARCHAR2(4000),
    EXECUTION  VARCHAR2(4000),
    SQL_ID      VARCHAR2(4000),
    SQL_TEXT    VARCHAR2(4000) 
      );
      create or replace TYPE hsysvalueset_t2 is TABLE OF hsysvalue_t2;
  */  
  
    FUNCTION SYS_LIMIT RETURN hobjvalueset_t1
    IS
     l_stmt    h$type.var_t :='';
     l_sys     hobjvalueset_t1 := hobjvalueset_t1();
    BEGIN
    
      
       l_stmt := rpad('SECTION',30,' ')||rpad('ITEM',40,' ')||lpad('LIMIT',30,' ')||rpad(' DESCRIPTION',40,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',180),l_sys);
       
       l_stmt := rpad('Schema Object',30,' ')||rpad('Number of Column',40,' ')||lpad('1,000',30,' ');          
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Length of Column name',40,' ')||lpad('30',30,' ');          
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Length of Table name',40,' ')||lpad('30',30,' ');          
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Length of Sequence',40,' ')||lpad('38',30,' ');          
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Number of join index column',40,' ')||lpad('32',30,' ');          
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Number of pk Column',40,' ')||lpad('32',30,' ');          
       addChildLine(l_stmt,l_sys);
       
       addChildLine( h$util.add_key('','-',180),l_sys);
       
       l_stmt := rpad('Data Block',30,' ')||rpad('Size of database block',40,' ')||lpad('2K/4K/8K/16K',30,' ')||rpad(' 32K(64bit)',40,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Number of max block of single data file',40,' ')||lpad('4,194,303',30,' ')||rpad(' Block size(4K) = 16GB Data file',40,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Number of max block of BIGFILE',40,' ')||lpad('4,294,967,295',30,' ')||rpad(' Block size(4K) = 16TB',40,' ');       
       addChildLine(l_stmt,l_sys);

       addChildLine( h$util.add_key('','-',180),l_sys);
       
       l_stmt := rpad('Extent',30,' ')||rpad('Dictionary mode',40,' ')||lpad('4GB*Block Size',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Local mode',40,' ')||lpad('2GB*Block Size',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Max extent',40,' ')||lpad('Unlimited',30,' ');       
       addChildLine(l_stmt,l_sys);

       addChildLine( h$util.add_key('','-',180),l_sys);
       
       l_stmt := rpad('File',30,' ')||rpad('Size of control file',40,' ')||lpad('Block Size * 20,000',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Number of data file',40,' ')||lpad('65,535',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Size of data file',40,' ')||lpad('4,194,303*Block Size',30,' ');         
       addChildLine(l_stmt,l_sys);
      
       addChildLine( h$util.add_key('','-',180),l_sys);
       
       l_stmt := rpad('SQL restriction',30,' ')||rpad('Size of SQL statement',40,' ')||lpad('65,535 B',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Size of Dynamic SQL',40,' ')||lpad('32 KB',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Size of FROM statement',40,' ')||lpad('Unlimited',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Size of WHERE statement',40,' ')||lpad('Unlimited',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Number of IN list',40,' ')||lpad('1,000',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Number of GROUP BY',40,' ')||lpad('Unlimited',30,' ');         
       addChildLine(l_stmt,l_sys);
       l_stmt := rpad('             ',30,' ')||rpad('Number of ORDER BY',40,' ')||lpad('Unlimited',30,' ');         
       addChildLine(l_stmt,l_sys);
            
       
      RETURN l_sys;    
    
    END SYS_LIMIT;

    FUNCTION SYS_DU(p_type in varchar2) RETURN  hobjvalueset_t3
    IS
      l_stmt   h$type.var_t;
      l_col_3  h$type.col_value_t3;
      l_rtn    hobjvalueset_t3 := hobjvalueset_t3();      
    BEGIN
      
      l_stmt := 'select table_name,SEGMENT_TYPE,SUM(BYTES) s from ( ';
      l_stmt := l_stmt ||' SELECT segment_name, ';
      l_stmt := l_stmt ||' decode(SEGMENT_TYPE,''INDEX'',(select table_name from user_indexes where index_name=d.segment_name ),';
      l_stmt := l_stmt ||'                    ''LOBINDEX'',(select table_name from user_indexes where index_name=d.segment_name ),';
      l_stmt := l_stmt ||'                    ''LOBSEGMENT'',(select table_name from user_lobs where segment_name=d.segment_name ),';
      l_stmt := l_stmt ||'                    ''INDEX PARTITION'',(select table_name from user_indexes where index_name=d.segment_name ),  ';
      l_stmt := l_stmt ||'                    ''LOB PARTITION'',(select table_name from user_lob_partitions where lob_name=d.segment_name ),';                      
      l_stmt := l_stmt ||'                    segment_name) table_name,SEGMENT_TYPE,bytes';
      l_stmt := l_stmt ||' FROM USER_EXTENTS d ';
      l_stmt := l_stmt ||' where segment_type not in (''TYPE2 UNDO'',''ROLLBACK'',''CLUSTER'')';
      l_stmt := l_stmt ||' ) group by SEGMENT_TYPE,table_name';
    
      EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_3;
       
      FOR i IN l_col_3.FIRST..l_col_3.LAST LOOP      
          
          l_rtn.extend;
          
          
          IF LOWER(p_type) = h$constants.c_kb THEN
             l_rtn(l_rtn.count) := hobjvalue_t3(l_col_3(i).valdata1,l_col_3(i).valdata2,round(to_number(l_col_3(i).valdata3)/1024,1));
          ELSIF LOWER(p_type) = h$constants.c_mb THEN
             l_rtn(l_rtn.count) := hobjvalue_t3(l_col_3(i).valdata1,l_col_3(i).valdata2,round(to_number(l_col_3(i).valdata3)/1024/1024,1));
          ELSIF LOWER(p_type) = h$constants.c_gb THEN
             l_rtn(l_rtn.count) := hobjvalue_t3(l_col_3(i).valdata1,l_col_3(i).valdata2,round(to_number(l_col_3(i).valdata3)/1024/1024/1024,1));
          ELSIF LOWER(p_type) = h$constants.c_tb THEN
             l_rtn(l_rtn.count) := hobjvalue_t3(l_col_3(i).valdata1,l_col_3(i).valdata2,round(to_number(l_col_3(i).valdata3)/1024/1024/1024/1024,1));
          ELSE         
             l_rtn(l_rtn.count) := hobjvalue_t3(l_col_3(i).valdata1,l_col_3(i).valdata2,round(to_number(l_col_3(i).valdata3),1));
          END IF;
          
          
      end loop;       
    
      return l_rtn;
      
    END SYS_DU;
   

 
    FUNCTION SYS_SQLHIST RETURN  hsysvalueset_t1
    IS
      l_stmt h$type.var_t;
      l_sys  h$type.col_value_t11;
      l_rtn  hsysvalueset_t1 := hsysvalueset_t1();
      maxcnt BINARY_INTEGER := 0;
    BEGIN
    
      l_stmt := 'select parsing_schema_name , ';
      l_stmt := l_stmt ||'      count(*), ';
      l_stmt := l_stmt ||'      count(distinct substr(sql_text,1,1000)) ,';
      l_stmt := l_stmt ||'      round(avg(buffer_gets/decode(executions,0,1,executions))) ,';
      l_stmt := l_stmt ||'      round(avg(disk_reads/decode(executions,0,1,executions))) , ';
      l_stmt := l_stmt ||'      round(avg(elapsed_time/decode(executions,0,1,executions)/1000000),2) ,';
      l_stmt := l_stmt ||'      round(max(elapsed_time/decode(executions,0,1,executions)/1000000),2) ,';
      l_stmt := l_stmt ||'      count(case when elapsed_time/decode(executions,0,1,executions)/1000000 >= 10 then 1 end)  ,';
      l_stmt := l_stmt ||'      round(avg(application_wait_time))  ,';
      l_stmt := l_stmt ||'      round(avg(sharable_mem)) ,';
      l_stmt := l_stmt ||'      round(avg(cpu_time))  ';
      l_stmt := l_stmt ||' from v$sql s';
      l_stmt := l_stmt ||' where s.parsing_schema_name = s.parsing_schema_name';
      l_stmt := l_stmt ||' and parsing_schema_name not in (''SYS'',''SYSMAN'',''ORACLE_OCM'',''MDSYS'',''EXFSYS'',''APEX_030200'')';
      l_stmt := l_stmt ||' group by parsing_schema_name';


       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_sys;
       
       maxcnt := l_sys.COUNT;
        IF (maxcnt > 0) THEN
            FOR i IN l_sys.FIRST..l_sys.LAST LOOP
               l_rtn.extend;
               l_rtn(i) := hsysvalue_t1(l_sys(i).valdata1,
                                         l_sys(i).valdata2,
                                         l_sys(i).valdata3,
                                         h$util.add_key(l_sys(i).valdata4,'0','.',1,h$constants.c_left),
                                         h$util.add_key(l_sys(i).valdata5,'0','.',1,h$constants.c_left),
                                         h$util.add_key(l_sys(i).valdata6,'0','.',1,h$constants.c_left),
                                         h$util.add_key(l_sys(i).valdata7,'0','.',1,h$constants.c_left),
                                         h$util.add_key(l_sys(i).valdata8,'0','.',1,h$constants.c_left),
                                         l_sys(i).valdata9,
                                         l_sys(i).valdata10,
                                         l_sys(i).valdata11);
            END LOOP;
        END IF;
       
    return l_rtn;


    END SYS_SQLHIST;

   
    FUNCTION SYS_SQLHIST(p_dbuser in varchar2 , p_sqltext in varchar2) RETURN  hsysvalueset_t2
    IS
      l_stmt h$type.var_t;
      l_rtn  hsysvalueset_t2 := hsysvalueset_t2();
      maxcnt BINARY_INTEGER := 0;
    BEGIN
    
      l_stmt := 'SELECT   hsysvalue_t2(s.parsing_schema_name , ';
      l_stmt := l_stmt ||'    s.FIRST_LOAD_TIME ,';
      l_stmt := l_stmt ||'    s.service ,';
      l_stmt := l_stmt ||'    round(s.buffer_gets/decode(executions,0,1,executions)) ,';
      l_stmt := l_stmt ||'    round(disk_reads/decode(executions,0,1,executions)) ,';
      l_stmt := l_stmt ||'    round(s.elapsed_time/decode(s.executions,0,1,s.executions)/1000000,2) ,';
      l_stmt := l_stmt ||'    s.executions,';
      l_stmt := l_stmt ||'    s.sql_id,';
      l_stmt := l_stmt ||'    s.sql_text) ';
      l_stmt := l_stmt ||' from ( select * FROM v$sql where 1=1 ORDER BY round(elapsed_time/decode(executions,0,1,executions)/1000000,2) DESC ) s ';
      l_stmt := l_stmt ||' WHERE  1=1 ';
  
      IF p_dbuser != '*' and p_dbuser is not null then
         l_stmt := l_stmt ||' and  s.parsing_schema_name = '''||upper(p_dbuser)||'''';
      END IF;
  
      l_stmt := l_stmt ||' and s.parsing_schema_name not in (''SYS'',''SYSMAN'',''ORACLE_OCM'',''MDSYS'',''EXFSYS'',''APEX_030200'')';
  
      IF p_sqltext != '*' and p_sqltext is not null then
         l_stmt := l_stmt ||' and s.sql_text like ''%'||p_sqltext||'%''';
      END IF;

      EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_rtn;
       
      return l_rtn;

    END SYS_SQLHIST;

    PROCEDURE addChildLine(p_stmt in varchar2, idset in out hobjvalueset_t1)
    IS
    BEGIN
       idset.extend;
       idset(idset.count) := hobjvalue_t1(p_stmt);    
    END addChildLine;
    
    FUNCTION SYS_DIAGNOSIS RETURN hobjvalueset_t1
    IS     
     l_stmt   h$type.var_t :='';
     l_sys    hobjvalueset_t1 := hobjvalueset_t1();
     l_col_2  h$type.col_value_t2;
     l_col_3  h$type.col_value_t3;
     l_col_4  h$type.col_value_t4;
     l_col_5  h$type.col_value_t5;
     l_col_6  h$type.col_value_t6;
     l_col_7  h$type.col_value_t7;
     l_col_8  h$type.col_value_t8;
    BEGIN
    
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Oracle Instance Information',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Host',30,' ')||
                 rpad('Version',13,' ')||
                 rpad('DB Name',13,' ')||
                 rpad('Startup Time',14,' ')||
                 rpad('Parallel',14,' ')||
                 rpad('Parallel',14,' ')||
                 rpad('Log Mode',14,' ')||
                 rpad('Archiver',14,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
    
       l_stmt := 'select host_name, 
                         version, 
                         name, 
                         startup_time, 
                         parallel,
                         log_mode, 
                         archiver
                    from v$instance, v$database';
                     
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_7;
       

       FOR i IN l_col_7.FIRST..l_col_7.LAST LOOP                     
              
              l_stmt :=  rpad(l_col_7(i).valdata1,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_7(i).valdata2,13,' ');
              l_stmt :=  l_stmt || rpad(l_col_7(i).valdata3,13,' ');
              l_stmt :=  l_stmt || rpad(l_col_7(i).valdata4,14,' ');
              l_stmt :=  l_stmt || rpad(l_col_7(i).valdata5,14,' ');
              l_stmt :=  l_stmt || rpad(l_col_7(i).valdata6,14,' ');
              l_stmt :=  l_stmt || rpad(l_col_7(i).valdata7,14,' ');
              
              addChildLine(l_stmt,l_sys);
              
       end loop;
    
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Resource Limit',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
    
       
       l_stmt := rpad('Resource Name',30,' ')||
                 rpad('Current Util',13,' ')||
                 rpad('Max Util',13,' ')||
                 rpad('Initial Alloc',14,' ')||
                 rpad('Limit',14,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
       
       l_stmt := 'select RESOURCE_NAME ,
                         CURRENT_UTILIZATION ,
                         MAX_UTILIZATION ,
                         INITIAL_ALLOCATION ,
                         LIMIT_VALUE 
                    from v$resource_limit';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_5;
       
       FOR i IN l_col_5.FIRST..l_col_5.LAST LOOP      
                     
              l_stmt :=  rpad(l_col_5(i).valdata1,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_5(i).valdata2,13,' ');
              l_stmt :=  l_stmt || rpad(l_col_5(i).valdata3,13,' ');
              l_stmt :=  l_stmt || rpad(l_col_5(i).valdata4,14,' ');
              l_stmt :=  l_stmt || rpad(l_col_5(i).valdata5,14,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Current Session Count',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Time',30,' ')||
                 rpad('Total Sessions',15,' ')||
                 rpad('Active Sessions',15,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
       
       l_stmt := 'select to_char(sysdate,''yyyy/mm/dd hh24:mi:ss'') currenttime,
                         to_char(count(*)) totalsessions,
                         to_char(count(decode(status, ''ACTIVE'',1) )) activesessions
                    from v$session ';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_3;
       
       FOR i IN l_col_3.FIRST..l_col_3.LAST LOOP      
                     
              l_stmt :=  rpad(l_col_3(i).valdata1,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_3(i).valdata2,15,' ');
              l_stmt :=  l_stmt || rpad(l_col_3(i).valdata3,15,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Buffer Cache Hit Ratio',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Time',30,' ')||
                 rpad('Logical Reads',15,' ')||
                 rpad('Physical Reads',25,' ')||
                 rpad('Hit Ratio',15,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
       
       l_stmt := 'select to_char(sysdate,''yyyy/mm/dd HH24:MI:SS'') currenttime,
                         h$util.to_comma(a.value+b.value) logicalreads,
                         h$util.to_comma(c.value) physicalreads,
                         round((1 - (c.value/(a.value+b.value)))*100, 3) hitratio
                    from v$sysstat a, v$sysstat b, v$sysstat c
                   where a.name = ''db block gets''
                     and b.name = ''consistent gets''
                     and c.name = ''physical reads''';
       
      EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_4;
       
       FOR i IN l_col_4.FIRST..l_col_4.LAST LOOP   
                     
              l_stmt :=  rpad(l_col_4(i).valdata1,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_4(i).valdata2,15,' ');
              l_stmt :=  l_stmt || rpad(l_col_4(i).valdata3,25,' ');
              l_stmt :=  l_stmt || rpad(l_col_4(i).valdata4,15,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Library Cache Hit Ratio',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       
       l_stmt := rpad('Time',30,' ')||
                 rpad('Hit Ratio(Pins-Reloads)',35,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
       
       l_stmt := 'select to_char(sysdate,''yyyy/mm/dd hh24:mi:ss'') currenttime,
                         round((1-(sum(reloads)/sum(pins)))*100, 3) hitratio
                    from v$librarycache';
                      
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_2;
       
       FOR i IN l_col_2.FIRST..l_col_2.LAST LOOP   
                     
              l_stmt :=  rpad(l_col_2(i).valdata1,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_2(i).valdata2,35,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;
         
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Dictionary Cache Hit Ratio',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);

       
       l_stmt := rpad('Time',30,' ')||
                 rpad('Hit Ratio',15,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
       
       l_stmt := 'select to_char(sysdate,''yyyy/mm/dd hh24:mi:ss'') currenttime,
                         round((1-sum(getmisses)/sum(gets))*100, 3) hitratio
                    from v$rowcache';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_2;
       
       FOR i IN l_col_2.FIRST..l_col_2.LAST LOOP   
                     
              l_stmt :=  rpad(l_col_2(i).valdata1,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_2(i).valdata2,15,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;
     
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Shared Pool Free Space',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Shared Pool Total(MB)',30,' ')||
                 rpad('Shared Pool Free(MB)',30,' ')||
                 rpad('Shared Pool Reserved(MB)',40,' ')||
                 rpad('Shared Pool Other(MB)',30,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
       
       l_stmt := 'select h$util.to_comma(s.total) shared_pool_total,
                         h$util.to_comma(s.free - r.r_free) shared_pool_free,
                         ''Free : '' || r.r_free || '',Used : '' ||r.r_used shared_pool_reserved,
                         h$util.to_comma(s.other - r.r_used)   shared_pool_other
                    from (select round(sum(bytes/1024/1024),2) total,
                                 round(sum(decode(name, ''free memory'', bytes))/1024/1024,2) free,
                                 round(sum(decode(name, ''free memory'',null, bytes))/1024/1024,2) other
                            from v$sgastat
                           where pool = ''shared pool'' ) s,
                         (select round(nvl(sum(free_space),0)/1024/1024,2) r_free,
                                 round(nvl(sum(used_space),0)/1024/1024,2) r_used
                            from v$shared_pool_reserved) r ';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_4;
       
       FOR i IN l_col_4.FIRST..l_col_4.LAST LOOP   
       
              l_stmt :=  rpad(l_col_4(i).valdata1,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_4(i).valdata2,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_4(i).valdata3,40,' ');
              l_stmt :=  l_stmt || rpad(l_col_4(i).valdata4,30,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Redo Log Switch Time Interval',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('THREAD',10,' ')||
                 rpad('TIME',20,' ')||
                 rpad('Interval(Min)',20);
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
       
       l_stmt := 'select /*+ use_hash(a b) */ a.thread# threads, to_char(a.first_time,''YYYY/MM/DD HH24'') firsttime,
                         round(avg(trunc((a.first_time - b.first_time)*24*60,3)),2) interval_min
                    from (select thread#, sequence#, first_time  from v$loghist where first_time  > sysdate -3) a,
                         (select thread#, sequence#, first_time  from v$loghist where first_time  > sysdate -3) b
                   where a.thread# = b.thread#
                     and a.sequence# = b.sequence# + 1
                   group by a.thread#, to_char(a.first_time,''YYYY/MM/DD HH24'') ';
                     
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_3;
       
       FOR i IN l_col_3.FIRST..l_col_3.LAST LOOP  
                                         
              l_stmt :=  rpad(l_col_3(i).valdata1,10,' ');
              l_stmt :=  l_stmt || rpad(l_col_3(i).valdata2,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_3(i).valdata3,20,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('File I/O ',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Name',50,' ')||
                 rpad('Physical Read',20,' ')||
                 rpad('Physical Write',20,' ')||
                 rpad('Total IO',20,' ')||
                 rpad('Read(%%)',20,' ')||
                 rpad('Write(%%)',20,' ')||
                 rpad('Total IO(%%)',20,' ')||
                 rpad('Average IO Time',20,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);
       
       l_stmt := 'SELECT name ,
                         h$util.to_comma(phyrds) ,
                         h$util.to_comma(phywrts) ,
                         h$util.to_comma(phyrds+phywrts) totalio,
                         trunc(phyrds/read_sum*100,2) readratio,
                         trunc(phywrts/write_sum*100,2) writeratio,
                         trunc( (phyrds+phywrts) / (read_sum+write_sum) * 100 , 2) totalioratio,
                         avgiotim 
                    FROM v$filestat a, v$datafile b,
                        (select sum(phyrds) read_sum, sum(phywrts) write_sum
                           from v$filestat ) c
                   WHERE a.file# = b.file#
                   order by phyrds+phywrts desc';
            
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_8;
       
       FOR i IN l_col_8.FIRST..l_col_8.LAST LOOP  
                                         
              l_stmt :=  rpad(l_col_8(i).valdata1,50,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata2,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata3,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata4,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata5,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata6,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata7,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata8,20,' ');              
              
              addChildLine(l_stmt,l_sys);
       end loop;
              
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Memory Sort Ratio ',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Sort(memory)',20,' ')||
                 rpad('Sort(disk)',20,' ')||
                 rpad('Memory Sort Ratio',20,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);    
       
       l_stmt := 'select h$util.to_comma(a.value) sort_memory,
                         b.value sort_disk,
                         round(a.value/(a.value+b.value) * 100 ,2) mem_sort_ratio
                    from v$sysstat a, v$sysstat b
                   where a.name = ''sorts (memory)''
                     and b.name = ''sorts (disk)''';   
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_3;
       
       FOR i IN l_col_3.FIRST..l_col_3.LAST LOOP  
                                         
              l_stmt :=  rpad(l_col_3(i).valdata1,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_3(i).valdata2,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_3(i).valdata3,20,' ');
         
              
              addChildLine(l_stmt,l_sys);
       end loop;
                  
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('System Wait Event ',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Event',60,' ')||
                 lpad('Total Waits',20,' ')||
                 lpad('Time Waited(cs)',20,' ')||
                 lpad('Avg Wait Time(cs)',20,' ')||
                 lpad('Total Timeouts',20,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);       
       
       l_stmt := 'select event, 
                         h$util.to_comma(total_waits) ,
                         h$util.to_comma(time_waited) ,
                         h$util.to_comma(round(average_wait,5)) average_wait,
                         h$util.to_comma(total_timeouts) 
                    from v$system_event
                   where event not like ''%SQL*Net%''
                     and event not like ''%pipe get%''
                     and event not like ''%rdbms ipc%''
                     and event not like ''%smon timer%''
                     and event not like ''%pmon timer%''
                     and time_waited > 0
                order by time_waited desc';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_5;
       
       FOR i IN l_col_5.FIRST..l_col_5.LAST LOOP  
                                         
              l_stmt :=  rpad(l_col_5(i).valdata1,60,' ');
              l_stmt :=  l_stmt || lpad(l_col_5(i).valdata2,20,' ');
              l_stmt :=  l_stmt || lpad(l_col_5(i).valdata3,20,' ');
              l_stmt :=  l_stmt || lpad(l_col_5(i).valdata4,20,' ');
              l_stmt :=  l_stmt || lpad(l_col_5(i).valdata5,20,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;  
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Invalid Object Count ',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Object Type',20,' ')||
                 lpad('Invalid Count',20,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);       
       
       l_stmt := 'select /*+ ORDERED_PREDICATES  */
                         object_type ,
                         h$util.to_comma(count(*)) cnt
                    from user_objects
                   where status  = ''INVALID''
                   group by object_type';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_2;
       
       FOR i IN l_col_2.FIRST..l_col_2.LAST LOOP  
                                         
              l_stmt :=  rpad(l_col_2(i).valdata1,20,' ');
              l_stmt :=  l_stmt || lpad(l_col_2(i).valdata2,20,' ');
              
              addChildLine(l_stmt,l_sys);
       end loop;  
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Rollback Segment Hit Ratio ',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Rollback Segment',30,' ')||
                 lpad('Rsize',20,' ')||
                 lpad('Writes',20,' ')||
                 rpad('Xacts',20,' ')||
                 rpad('Status',20,' ')||
                 rpad('Waits',20,' ')||
                 rpad('Gets',20,' ')||
                 rpad('Hit ratio',20,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);       
       
       l_stmt := 'select name,
                         h$util.to_comma(rssize), 
                         h$util.to_comma(writes), 
                         h$util.to_comma(xacts), 
                         status,
                         h$util.to_comma(waits), 
                         h$util.to_comma(gets),
                         decode(gets,0,-1, trunc((1-(waits/gets))*100, 5)) hitratio
                    from v$rollstat, v$rollname
                   where v$rollstat.usn = v$rollname.usn
                   order by waits/gets desc';
                
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_8;
       
       FOR i IN l_col_8.FIRST..l_col_8.LAST LOOP  
                                         
              l_stmt :=  rpad(l_col_8(i).valdata1,30,' ');
              l_stmt :=  l_stmt || lpad(l_col_8(i).valdata2,20,' ');
              l_stmt :=  l_stmt || lpad(l_col_8(i).valdata3,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata4,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata5,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata6,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata7,20,' ');
              l_stmt :=  l_stmt || rpad(l_col_8(i).valdata8,20,' ');          
              
              
              addChildLine(l_stmt,l_sys);
       end loop;  
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Tablespace Usage and Fragmentation ',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Tablespace',30,' ')||
                 lpad('Total(MB)',15,' ')||
                 lpad('Used(MB)',15,' ')||
                 lpad('Free(MB)',15,' ')||
                 lpad('Free(%%)',10,' ')||
                 lpad('Pieces',10,' ')||
                 lpad('MaxFree(MB)',15,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);       
       
       l_stmt := 'select df.tablespace_name,
                         h$util.to_comma(round(df.TBS_byte /1048576,2)) total_mb ,
                         h$util.to_comma(round((df.TBS_byte - fs.Free_byte)/1048576,2)) used_mb,
                         h$util.to_comma(round(fs.Free_byte /1048576,2)) free_mb ,
                         round((fs.Free_byte/df.TBS_byte) *100,0) free ,
                         h$util.to_comma(fs.pieces) ,
                         h$util.to_comma(round(fs.Max_free /1048576,2)) maxfree
                    from ( select tablespace_name, sum(bytes) TBS_byte
                             from dba_data_files group by tablespace_name ) df,
                         ( select tablespace_name, max(bytes) Max_free, sum(bytes) Free_byte, count(*) pieces
                             from dba_free_space group by tablespace_name ) fs,
                         ( select tablespace_name, initial_extent, next_extent
                             from dba_tablespaces ) db
                    where df.tablespace_name = db.tablespace_name
                    and   df.tablespace_name = fs.tablespace_name(+)
                    order by 5';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_7;
       
       FOR i IN l_col_7.FIRST..l_col_7.LAST LOOP  
                                        
                  l_stmt :=  rpad(l_col_7(i).valdata1,30,' ');
                  l_stmt :=  l_stmt || lpad(l_col_7(i).valdata2,15,' ');
                  l_stmt :=  l_stmt || lpad(l_col_7(i).valdata3,15,' ');
                  l_stmt :=  l_stmt || lpad(l_col_7(i).valdata4,15,' ');
                  l_stmt :=  l_stmt || lpad(l_col_7(i).valdata5,10,' ');
                  l_stmt :=  l_stmt || lpad(l_col_7(i).valdata6,10,' ');
                  l_stmt :=  l_stmt || lpad(l_col_7(i).valdata7,15,' ');
                                           
                  addChildLine(l_stmt,l_sys);
       end loop;  
       
       ------------------------------------------------------------------------------
       addChildLine( h$util.add_key('','=',140),l_sys);
       addChildLine('Chained Row Ratio',l_sys);
       addChildLine( h$util.add_key('','=',140),l_sys);
       
       l_stmt := rpad('Chained row Access',20,' ')||
                 rpad('Index Access',20,' ')||
                 rpad('Table Scan Access',20,' ')||
                 rpad('Ratio',20,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',140),l_sys);       
       
       l_stmt := 'SELECT h$util.to_comma(sum(decode(name,''table fetch continued row'',value,0))) chained_row,
                         h$util.to_comma(sum(decode(name,''table fetch by rowid'',value,0))) index_access,
                         h$util.to_comma(sum(decode(name,''table scan rows gotten'',value,0))) table_access,
                         round(sum(decode(name,''table fetch continued row'',value,0)) /
                         (sum(decode(name,''table fetch by rowid'',value,0)) + sum(decode(name,''table scan rows gotten'',value,0))) * 100,5) ratio 
                    FROM v$sysstat';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_4;
       
       FOR i IN l_col_4.FIRST..l_col_4.LAST LOOP  
                                        
                  l_stmt :=   rpad(l_col_4(i).valdata1,20,' ');
                  l_stmt :=  l_stmt || rpad(l_col_4(i).valdata2,20,' ');
                  l_stmt :=  l_stmt || rpad(l_col_4(i).valdata3,20,' ');
                  l_stmt :=  l_stmt || rpad(l_col_4(i).valdata4,20,' ');
                                           
                  addChildLine(l_stmt,l_sys);
       end loop;  
       
       return l_sys;    
    
    END SYS_DIAGNOSIS;
      
    
    function sys_dependency(p_owner in varchar2, p_object in varchar2) return hobjvalueset_t1
    is
      l_rtn  hobjvalueset_t1 := hobjvalueset_t1();
      l_sys  h$type.col_value_t1;
      maxcnt BINARY_INTEGER := 0;
      l_stmt h$type.var_t;
    BEGIN    
       
       
       l_stmt := 'select rpad(decode(s.hlevel,1,''  '',h.add_space('''',3*(s.hlevel-1))||''+-'')||s.parent,s.lenparent+10,'' '')||';
       l_stmt := l_stmt ||' rpad(s.child ,s.lenchild+5,'' '')|| s.last_ddl_time  from (';
       l_stmt := l_stmt ||' select d.parent,';
       l_stmt := l_stmt ||'        d.child,';
       l_stmt := l_stmt ||'        d.hlevel,';
       l_stmt := l_stmt ||'        o.last_ddl_time,';
       l_stmt := l_stmt ||'        max(length(d.parent)) over (partition by rn ) lenparent ,';
       l_stmt := l_stmt ||'        max(length(d.child)) over (partition by rn ) lenchild ';
       l_stmt := l_stmt ||'  from (';
       l_stmt := l_stmt ||'        select /*+ no_merge */';
       l_stmt := l_stmt ||'               referenced_type || '' "'' || referenced_owner || ''"."'' ||';
       l_stmt := l_stmt ||'               referenced_name || ''"'' as parent,owner,';
       l_stmt := l_stmt ||'               type || '' "'' || owner || ''"."'' || name || ''"'' as child,';
       l_stmt := l_stmt ||'               level hlevel,';
       l_stmt := l_stmt ||'               referenced_owner, referenced_name, referenced_type,';
       l_stmt := l_stmt ||'                name, type, ''1'' rn';
       l_stmt := l_stmt ||'          from dba_dependencies';
       l_stmt := l_stmt ||'    start with referenced_owner = '''||upper(p_owner)||'''';
       l_stmt := l_stmt ||'    and referenced_name = '''||upper(p_object)||'''';
       l_stmt := l_stmt ||'    connect by referenced_owner = prior owner';
       l_stmt := l_stmt ||'     and referenced_name = prior name';
       l_stmt := l_stmt ||'     and referenced_type = prior type';
       l_stmt := l_stmt ||' union';
       l_stmt := l_stmt ||'        select /*+ no_merge */';
       l_stmt := l_stmt ||'               referenced_type || '' "'' || referenced_owner || ''"."'' ||';
       l_stmt := l_stmt ||'               referenced_name || ''"'' as parent,owner,';
       l_stmt := l_stmt ||'               type || '' "'' || owner || ''"."'' || name || ''"'' as child,';
       l_stmt := l_stmt ||'               level hlevel,';
       l_stmt := l_stmt ||'               referenced_owner, referenced_name, referenced_type,';
       l_stmt := l_stmt ||'                name, type, ''1'' rn';
       l_stmt := l_stmt ||'         from dba_dependencies';
       l_stmt := l_stmt ||'    start with owner = '''||upper(p_owner)||'''';
       l_stmt := l_stmt ||'      and name = '''||upper(p_object)||'''';
       l_stmt := l_stmt ||'      connect by owner = prior referenced_owner';
       l_stmt := l_stmt ||'          and name = prior referenced_name';
       l_stmt := l_stmt ||'          and type = prior referenced_type';
       l_stmt := l_stmt ||'      order by 1, 2)  d, dba_objects o';
       l_stmt := l_stmt ||' where o.owner = d.owner';
       l_stmt := l_stmt ||'   and o.object_type = d.type';
       l_stmt := l_stmt ||'   and d.name = o.object_name';
       l_stmt := l_stmt ||' order by parent, child ) s';
       
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_sys;
       
       maxcnt := l_sys.COUNT;
       IF (maxcnt > 0) THEN
           FOR i IN l_sys.FIRST..l_sys.LAST LOOP
               l_rtn.extend;
               l_rtn(l_rtn.count) := hobjvalue_t1(substrb(l_sys(i),1,4000));
           END LOOP;
       END IF;
       
       RETURN l_rtn;
         
    END sys_dependency;
    
    FUNCTION sys_info RETURN hobjvalueset_t2
    IS
     l_stmt h$type.var_t := '';
     l_rtn  hobjvalueset_t2 := hobjvalueset_t2();
     l_sys  h$type.col_value_t2;
     maxcnt BINARY_INTEGER := 0;
    BEGIN
   
 
        l_stmt:=l_stmt||'select  ''terminal'' valdata1,SYS_CONTEXT(''USERENV'',''TERMINAL'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''language'' valdata1,SYS_CONTEXT(''USERENV'',''LANGUAGE'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''sessionid'' valdata1,SYS_CONTEXT(''USERENV'',''SESSIONID'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''instance'' valdata1,SYS_CONTEXT(''USERENV'',''INSTANCE'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''entryid'' valdata1,SYS_CONTEXT(''USERENV'',''ENTRYID'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''isdba'' valdata1,SYS_CONTEXT(''USERENV'',''ISDBA'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''nls_territory'' valdata1,SYS_CONTEXT(''USERENV'',''NLS_TERRITORY'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''nls_currency'' valdata1,SYS_CONTEXT(''USERENV'',''NLS_CURRENCY'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''nls_calendar'' valdata1,SYS_CONTEXT(''USERENV'',''NLS_CALENDAR'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''nls_date_format'' valdata1,SYS_CONTEXT(''USERENV'',''NLS_DATE_FORMAT'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''nls_date_language'' valdata1,SYS_CONTEXT(''USERENV'',''NLS_DATE_LANGUAGE'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''nls_sort'' valdata1,SYS_CONTEXT(''USERENV'',''NLS_SORT'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''current_user'' valdata1,SYS_CONTEXT(''USERENV'',''CURRENT_USER'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''current_userid'' valdata1,SYS_CONTEXT(''USERENV'',''CURRENT_USERID'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''session_user'' valdata1,SYS_CONTEXT(''USERENV'',''SESSION_USER'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''session_userid'' valdata1,SYS_CONTEXT(''USERENV'',''SESSION_USERID'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''proxy_user'' valdata1,SYS_CONTEXT(''USERENV'',''PROXY_USER'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''proxy_userid'' valdata1,SYS_CONTEXT(''USERENV'',''PROXY_USERID'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''db_domain'' valdata1,SYS_CONTEXT(''USERENV'',''DB_DOMAIN'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''db_name'' valdata1,SYS_CONTEXT(''USERENV'',''DB_NAME'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''host'' valdata1,SYS_CONTEXT(''USERENV'',''HOST'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''os_user'' valdata1,SYS_CONTEXT(''USERENV'',''OS_USER'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''external_name'' valdata1,SYS_CONTEXT(''USERENV'',''EXTERNAL_NAME'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''ip_address'' valdata1,SYS_CONTEXT(''USERENV'',''IP_ADDRESS'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''network_protocol'' valdata1,SYS_CONTEXT(''USERENV'',''NETWORK_PROTOCOL'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''bg_job_id'' valdata1,SYS_CONTEXT(''USERENV'',''BG_JOB_ID'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''fg_job_id'' valdata1,SYS_CONTEXT(''USERENV'',''FG_JOB_ID'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''authentication_type'' valdata1,SYS_CONTEXT(''USERENV'',''AUTHENTICATION_TYPE'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''authentication_data'' valdata1,SYS_CONTEXT(''USERENV'',''AUTHENTICATION_DATA'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''current_sql'' valdata1,SYS_CONTEXT(''USERENV'',''CURRENT_SQL'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''client_identifier'' valdata1,SYS_CONTEXT(''USERENV'',''CLIENT_IDENTIFIER'') valdata2  from dual';
        l_stmt:=l_stmt||' union all ';
        l_stmt:=l_stmt||'select  ''global_context_memory'' valdata1,SYS_CONTEXT(''USERENV'',''GLOBAL_CONTEXT_MEMORY'') valdata2 from dual';
       
    
    
        EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_sys;
    
        maxcnt := l_sys.COUNT;
        IF (maxcnt > 0) THEN
           FOR i IN l_sys.FIRST..l_sys.LAST LOOP
               l_rtn.extend;
               l_rtn(l_rtn.count) := hobjvalue_t2(l_sys(i).valdata1,l_sys(i).valdata2);
           END LOOP;
        END IF;
    
        return l_rtn;
    
    
    END sys_info;
    
    
    FUNCTION sys_which(p_stmt in varchar2) RETURN hobjvalueset_t4
    IS
     l_rtn  hobjvalueset_t4 := hobjvalueset_t4();
     l_stmt h$type.var_t;
     ccrsr  h$type.idcrsr_t;
     v_keydata1 h$type.var_t;
     v_valdata1 h$type.var_t;
     v_valdata2 h$type.var_t;
     v_valdata3 h$type.var_t;     
    BEGIN
      
       -- Get package,package body,procedure,functon,type
       l_stmt := 'select text, type, line, name from user_source where upper(text) like ''%''||'''||upper(p_stmt)||'''||''%''';
       OPEN ccrsr FOR l_stmt;
       LOOP
        FETCH ccrsr INTO v_keydata1,v_valdata1,v_valdata2,v_valdata3;
        EXIT WHEN ccrsr%NOTFOUND;
         -- process the data
           l_rtn.extend;
           l_rtn(l_rtn.count) := hobjvalue_t4(v_keydata1,v_valdata1,v_valdata2,v_valdata3);

       END LOOP;

       -- Get table , view, index Name
       l_stmt :='select object_name,object_type,to_char(last_ddl_time,''yyyy/mm/dd hh24:mi:ss'') last_ddl_time,';
       l_stmt := l_stmt ||' status from user_objects where object_type not in (''FUNCTION'',''PACKAGE'',''PACKAGE BODY'',''PROCEDURE'')';
       l_stmt := l_stmt ||' and upper(object_name) like ''%''||'''||upper(p_stmt)||'''||''%''';
      
       OPEN ccrsr FOR l_stmt;
       LOOP
        FETCH ccrsr INTO v_keydata1,v_valdata1,v_valdata2,v_valdata3;
        EXIT WHEN ccrsr%NOTFOUND;
         -- process the data
           l_rtn.extend;
           l_rtn(l_rtn.count) := hobjvalue_t4(v_keydata1,v_valdata1,v_valdata2,v_valdata3);

       END LOOP;
       
       
       -- Get table,View,Column name
       l_stmt :='select column_name,''COLUMN'', data_type, table_name from user_tab_columns ';
       l_stmt := l_stmt ||' where upper(column_name) like ''%''||'''||upper(p_stmt)||'''||''%''';
       
       
       OPEN ccrsr FOR l_stmt;
       LOOP
        FETCH ccrsr INTO v_keydata1,v_valdata1,v_valdata2,v_valdata3;
        EXIT WHEN ccrsr%NOTFOUND;
         -- process the data
           l_rtn.extend;
           l_rtn(l_rtn.count) := hobjvalue_t4(v_keydata1,v_valdata1,v_valdata2,v_valdata3);

       END LOOP;
       

       
       -- Get synonyms
       l_stmt :='select synonym_name,table_owner,db_link,table_name from user_synonyms ';
       l_stmt := l_stmt ||' where upper(table_name) like ''%''||'''||upper(p_stmt)||'''||''%''';
       

       OPEN ccrsr FOR l_stmt;
       LOOP
        FETCH ccrsr INTO v_keydata1,v_valdata1,v_valdata2,v_valdata3;
        EXIT WHEN ccrsr%NOTFOUND;
         -- process the data
           l_rtn.extend;
           l_rtn(l_rtn.count) := hobjvalue_t4(v_keydata1,v_valdata1,v_valdata2,v_valdata3);

       END LOOP;



       CLOSE ccrsr;
              
       return l_rtn;
    
    END sys_which;
    
    
    FUNCTION SYS_STORAGE RETURN hobjvalueset_t1
    IS
     l_stmt    h$type.var_t :='';
     l_sys     hobjvalueset_t1 := hobjvalueset_t1();
     l_col_9   h$type.col_value_t9;
    BEGIN
    
       addChildLine( h$util.add_key('','=',40),l_sys);
       addChildLine('Storage Status',l_sys);
       addChildLine( h$util.add_key('','=',40),l_sys);
       
      
       l_stmt := rpad('TABLESPACE_NAME',30,' ')||
                 rpad('FILE_ID',10,' ')||
                 lpad('FILE_NAME',50,' ')||
                 lpad('SIZE(MB)',10,' ')||
                 lpad('FREE(MB)',10,' ')||
                 lpad('AUTO EXTENSIBLE',30,' ')||
                 lpad('NEXT INCREMENT',20,' ')||
                 lpad('MAX',14,' ')||
                 lpad('NEXT EXTEND',14,' ');
                 
       addChildLine(l_stmt,l_sys);
       addChildLine( h$util.add_key('','-',180),l_sys);
    
       l_stmt := 'SELECT SUBSTR(a.tablespace_name,1,15) tablespace_name, 
                         a.file_id, 
                         SUBSTR(a.file_name,1,50) file_name, 
                         h$util.to_comma(round(a.bytes/1024/1024,1)) b,
                         h$util.to_comma(round(SUM(b.bytes)/1024/1024,1)) freeb,
                         a.autoextensible, 
                         h$util.to_comma(DECODE (a.autoextensible, ''YES'', round((a.increment_by*8192)/1024/1024,1), null)) NEXTB,
                         h$util.to_comma(DECODE (a.autoextensible, ''YES'', round((a.maxbytes)/1024/1024,1), null)) MAXB,
                         h$util.to_comma(DECODE (a.autoextensible, ''YES'', round((a.maxbytes - ((a.increment_by*c.value)+a.bytes))/1024/1024,1), null)) next_extend
                    FROM dba_data_files a, dba_free_space b, v$parameter c
                   WHERE a.file_id = b.file_id(+)
                     AND c.name = ''db_block_size''
                    GROUP BY 
                        SUBSTR(a.tablespace_name,1,15), 
                        a.file_id, 
                        SUBSTR(a.file_name,1,50), 
                        a.bytes,
                        a.autoextensible, 
                        a.increment_by,
                        a.maxbytes, 
                        a.maxbytes - ((a.increment_by*c.value)+a.bytes)
                    ORDER BY 1,2';

                    
       EXECUTE IMMEDIATE l_stmt BULK COLLECT INTO l_col_9;


       FOR i IN l_col_9.FIRST..l_col_9.LAST LOOP                     
              
              l_stmt :=  rpad(l_col_9(i).valdata1,30,' ');
              l_stmt :=  l_stmt || rpad(l_col_9(i).valdata2,10,' ');
              l_stmt :=  l_stmt || rpad(l_col_9(i).valdata3,50,' ');
              l_stmt :=  l_stmt || lpad(l_col_9(i).valdata4,10,' ');
              l_stmt :=  l_stmt || lpad(l_col_9(i).valdata5,10,' ');
              l_stmt :=  l_stmt || lpad(l_col_9(i).valdata6,30,' ');
              l_stmt :=  l_stmt || lpad(l_col_9(i).valdata7,20,' ');
              l_stmt :=  l_stmt || lpad(l_col_9(i).valdata8,14,' ');
              l_stmt :=  l_stmt || lpad(l_col_9(i).valdata9,14,' ');
              addChildLine(l_stmt,l_sys);
              
       end loop;
       
       return l_sys;
       
    END SYS_STORAGE;   
       
 
END h$system;
/
