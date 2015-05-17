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

CREATE OR REPLACE PACKAGE h$execeptions AS

    -- --------------------------------------------------------------------
    -- Runtime exceptions
    -- --------------------------------------------------------------------
    x_init      EXCEPTION;  -- Initializing the packages
    x_other     EXCEPTION;  -- Anything else.
    x_case      EXCEPTION;  -- Break out of case statement.
    x_java      EXCEPTION;  -- Java errors
    x_duplicate EXCEPTION;  -- Duplicated value exists.
    x_system    EXCEPTION;
    x_undefined EXCEPTION;
END h$execeptions;
/

