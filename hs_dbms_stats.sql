create or replace procedure 
hs_dbms_stats (p_schemaname       in varchar2 default 'ALL',
               p_estimate_percent in number default 1,
               p_degree           in number default 4,
               p_except_row_count in number default 10000000000 ) 
IS

v_owner               varchar2(50);
v_table_name          varchar2(50);
v_segsize             number;

v_parallel_degree     number;
v_parallel_degree_max number := 16;
v_cpu_cnt             number;
v_percent             number;

cursor cGetTables is
   select a.owner,a.table_name,sum(b.seg_size) segsize
      from dba_tables a,
             (select * from (select owner,
                                    segment_type,
                                    segment_name,
                                    tablespace_name,
                                    sum(trunc(bytes/(1024*1024),2)) as seg_size 
                               from dba_segments
                              where owner in ('HADSTORE')
                              group by owner, segment_type,segment_name, tablespace_name ) ds
        where seg_size >= 1) b
   where b.owner =a.owner
     and b.segment_name=a.table_name
     and a.temporary='N'
     and (a.num_rows <= p_except_row_count or a.num_rows is null)
   group by a.owner, a.table_name;

begin

  sys.dbms_application_info.set_module('hs_dbms_stats',null);

  select min(to_number(value)) into v_cpu_cnt
    from v$parameter
   where name='parallel_max_servers' or name ='cpu_count';


  if p_degree is null then
     v_parallel_degree := 4;
  elsif ( p_degree < 0  or p_degree > v_cpu_cnt) then
     v_parallel_degree := v_parallel_degree_max;
  else
     v_parallel_degree := p_degree;
  end if;

  for c1 in cGetTables loop

      v_owner      := c1.owner;
      v_table_name := c1.table_name;
      v_segsize    := c1.segsize;

     begin
       v_percent := p_estimate_percent;

       if v_segsize <= 50 then
          sys.dbms_stats.gather_table_stats(ownname=>v_owner, tabname=>v_table_name, estimate_percent=>100,degree=>v_parallel_degree,granularity=>'ALL',method_opt=> 'for all indexed columns size auto' ,cascade=>true);
       else
          sys.dbms_stats.gather_table_stats(ownname=>v_owner, tabname=>v_table_name, estimate_percent=>v_percent,degree=>v_parallel_degree,granularity=>'ALL',method_opt=> 'for all indexed columns size 1' ,cascade=>true,block_sample=>true);
       end if;
     end;
     
  end loop;
  
end hs_dbms_stats;
/