
create or replace PACKAGE h$initial AS
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
    PROCEDURE load;
   -- PROCEDURE initialize;
  --  PROCEDURE mPrintTraceInfo;
   -- PROCEDURE mInitialize(prevStartTime IN VARCHAR2);
     


END h$initial;


CREATE OR REPLACE PACKAGE BODY h$initial AS
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
    PROCEDURE load IS
      nothing BOOLEAN := FALSE;
    BEGIN
      if h$variables.c_all_sys_classes.count > 0 then
         nothing := nothing;
      else
         h$data.loadSystemCache;   
      end if;   
    END load;

     
END h$initial;
/
