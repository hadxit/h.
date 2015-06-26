WHENEVER SQLERROR CONTINUE;

CREATE OR REPLACE TYPE hsysvalue_t1 AS OBJECT (
   dbschema          VARCHAR2 (4000),
   total_sql_cnt     VARCHAR2 (4000),
   unique_sql_cnt    VARCHAR2 (4000),
   physical_io       VARCHAR2 (4000),
   disk_io           VARCHAR2 (4000),
   exec_time_avg     VARCHAR2 (4000),
   exec_time_max     VARCHAR2 (4000),
   worst_sql_10sec   VARCHAR2 (4000),
   waiting_time      VARCHAR2 (4000),
   used_memory       VARCHAR2 (4000),
   cpu_time          VARCHAR2 (4000)
);
/


CREATE OR REPLACE TYPE hsysvalueset_t1 IS TABLE OF hsysvalue_t1;
/

CREATE OR REPLACE TYPE hsysvalue_t2 AS OBJECT (
   dbschema      VARCHAR2 (4000),
   loadtime      VARCHAR2 (4000),
   service       VARCHAR2 (4000),
   physical_io   VARCHAR2 (4000),
   disk_io       VARCHAR2 (4000),
   exec_time     VARCHAR2 (4000),
   execution     VARCHAR2 (4000),
   sql_id        VARCHAR2 (4000),
   sql_text      VARCHAR2 (4000)
);
/
CREATE OR REPLACE TYPE hsysvalueset_t2 IS TABLE OF hsysvalue_t2;
/

CREATE OR REPLACE TYPE hsysvalueset_t1 IS TABLE OF hsysvalue_t1;
/

CREATE OR REPLACE TYPE hobjvalue_t1 AS OBJECT (
   valdata   VARCHAR2 (4000)
);
/

CREATE OR REPLACE TYPE hobjvalueset_t1 IS TABLE OF hobjvalue_t1;
/

CREATE OR REPLACE TYPE hobjvalue_t2 AS OBJECT (
   keydata   VARCHAR2 (4000),
   valdata   VARCHAR2 (4000)
);
/

CREATE OR REPLACE TYPE hobjvalueset_t2 IS TABLE OF hobjvalue_t2;
/

CREATE OR REPLACE TYPE hobjvalue_t3 AS OBJECT (
   keydata1   VARCHAR2 (4000),
   valdata1   VARCHAR2 (4000),
   valdata2   VARCHAR2 (4000)
);
/

CREATE OR REPLACE TYPE hobjvalueset_t3 IS TABLE OF hobjvalue_t3;
/

CREATE OR REPLACE TYPE hobjvalue_t4 AS OBJECT (
   keydata1   VARCHAR2 (4000),
   valdata1   VARCHAR2 (4000),
   valdata2   VARCHAR2 (4000),
   valdata3   VARCHAR2 (4000)
);
/

CREATE OR REPLACE TYPE hobjvalueset_t4 IS TABLE OF hobjvalue_t4;
/

CREATE OR REPLACE TYPE hobjvalue_t10 AS OBJECT (
   keydata1   VARCHAR2 (4000),
   valdata1   VARCHAR2 (4000),
   valdata2   VARCHAR2 (4000),
   valdata3   VARCHAR2 (4000),
   valdata4   VARCHAR2 (4000),
   valdata5   VARCHAR2 (4000),
   valdata6   VARCHAR2 (4000),
   valdata7   VARCHAR2 (4000),
   valdata8   VARCHAR2 (4000),
   valdata9   VARCHAR2 (4000)
);
/

CREATE OR REPLACE TYPE hobjvalueset_t10 IS TABLE OF hobjvalue_t10;
/