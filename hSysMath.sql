
create or replace PACKAGE h$math AS
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

    --PROCEDURE mPrintTraceInfo;
    --PROCEDURE mInitialize(prevStartTime IN VARCHAR2);
    FUNCTION zero_mod(sourcevalue IN NUMBER) return h$type.num_t;


END h$math;


CREATE OR REPLACE PACKAGE BODY h$math AS
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
   FUNCTION zero_mod(sourcevalue IN NUMBER) return h$type.num_t
   IS
    rtn_num h$type.num_t := 1;
    idx     h$type.num_t := 1;
   BEGIN
      
      for i in 2..sourcevalue loop
      
           if mod(sourcevalue,i) = 0 then
              rtn_num := i;
              return rtn_num;
           end if;
      
      end loop;
      
      return rtn_num;
       
   END zero_mod;

    
      
END h$math;
/
