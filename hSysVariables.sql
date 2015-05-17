create or replace PACKAGE h$variables AS
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
    -- System global variables
    -- --------------------------------------------------
    c_all_sys_classes    h$type.col_system_t;
    c_all_custom_classes h$type.col_custom_t;
    
   -- g_collection h$type.col_t;
    
    -- --------------------------------------------------
    -- Other global variables
    -- --------------------------------------------------
    /*
    g_all_error_logs     m_types.colSystemErrorLog;
    
    c_location           m_types.pgmloc_t;    -- The last recorded program location.
    c_last_error         m_types.error_t;   -- last error to occur.
    c_selected_errors    NUMBER := 0;
    g_trace_sequence     NUMBER := 0;
    g_start_time         VARCHAR2(45) := '';
    
    g_currentTime	     m_types.lastReportTime_t;
   -- g_prevTimeForApp     m_types.lastReportTime_t;
  --  g_prevTimeForUser    m_types.lastSalesReportTime_t;

    g_autoWeight         BOOLEAN := FALSE;
    g_autoSalesPoint     BOOLEAN := FALSE;
    g_autoSearchingStore BOOLEAN := FALSE;
    g_autoUserType       BOOLEAN := FALSE;
    g_userHistory        BOOLEAN := FALSE;
    g_tagSummary         BOOLEAN := FALSE;

    g_all_categorySysIdLists    m_types.colDirtyCategoryLists;
    g_all_userIdLists           m_types.colDirtyUserIds;
    

    g_loglevel                  m_types.valdata_t;
    */
    
    
END h$variables;