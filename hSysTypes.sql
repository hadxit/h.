create or replace PACKAGE h$type AS
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

    -- --------------------------------------------------------------------
    -- Basic data types
    -- --------------------------------------------------------------------

    SUBTYPE valdata_t           IS VARCHAR2(45);
    --SUBTYPE rtn_num_t           IS NUMBER;
    --SUBTYPE rtn_var_t           IS VARCHAR2(4000);
    --SUBTYPE rtn_date_t          IS DATE;
    SUBTYPE obj_key_t           IS VARCHAR2(4000);
    SUBTYPE obj_value_t         IS VARCHAR2(4000);
    SUBTYPE class_name_t        IS VARCHAR2(4000);
    SUBTYPE int_t               IS INTEGER;
    SUBTYPE var_t               IS VARCHAR2(4000);
    SUBTYPE num_t               IS NUMBER;
    SUBTYPE date_t              IS DATE;
    SUBTYPE chr_t               IS CHAR(10);
    SUBTYPE clob_t              IS CLOB;
   
    TYPE clsSplit IS RECORD
    (
      varid var_t
    );

    TYPE idcrsr_t IS REF CURSOR;

    TYPE col_value_t1 IS TABLE OF VARCHAR2(4000) INDEX BY BINARY_INTEGER;
    
    
/*    
    
    TYPE clsCategorySysId is RECORD
    (
        categorySysId    categorySysId_t
    );
    TYPE colCategorySysId IS TABLE OF clsCategorySysId  INDEX BY categorySysId_t;
  */  
    -- --------------------------------------------------------------------
    -- pgmloc_t - a structure to capture the location in code where an
    -- error may have occurred.
    -- --------------------------------------------------------------------
    TYPE pgmloc_t IS RECORD
    (
        module VARCHAR2(40) := 'm_module',
        fname  VARCHAR2(40) := '',
        ftype  CHAR(1) := 'U'            -- U=Unknown, F=Function, P=Procedure, M=Method, J=Java
    );
    
    -- --------------------------------------------------------------------
    -- collection type defined
    -- --------------------------------------------------------------------
    --TYPE idset_t IS TABLE OF var_t INDEX BY BINARY_INTEGER;
    --TYPE idset_t IS TABLE OF clsSplit INDEX BY BINARY_INTEGER;
    /*
    TYPE sys_sql_t1 IS RECORD
    (
        DBSCHEMA    obj_value_t := '',
        LOADTIME    obj_value_t := '',
        SERVICE     obj_value_t := '',
        PHYSICAL_IO obj_value_t := '',
        DISK_IO     obj_value_t := '',
        EXEC_TIME   obj_value_t := '',
        executions  obj_value_t := '',
        sql_text    obj_value_t := ''  
    );
    */
     TYPE col_value_rec_t IS RECORD
    (
        valdata1 obj_value_t := NULL,
        valdata2 obj_value_t := NULL
    );
    TYPE col_value_t IS TABLE OF col_value_rec_t INDEX BY obj_key_t;
    
     TYPE col_value_rec_t2 IS RECORD
    (
        valdata1 obj_value_t := '',
        valdata2 obj_value_t := ''
    );
    TYPE col_value_t2 IS TABLE OF col_value_rec_t2 INDEX BY BINARY_INTEGER;


    TYPE col_value_rec_t3 IS RECORD
    (
        valdata1 obj_value_t := '',
        valdata2 obj_value_t := '',
        valdata3 obj_value_t := ''
    );
    TYPE col_value_t3 IS TABLE OF col_value_rec_t3 INDEX BY BINARY_INTEGER;
    
    TYPE col_value_rec_t4 IS RECORD
    (
        valdata1 obj_value_t := '',
        valdata2 obj_value_t := '',
        valdata3 obj_value_t := '',
        valdata4 obj_value_t := ''
    );
    TYPE col_value_t4 IS TABLE OF col_value_rec_t4 INDEX BY BINARY_INTEGER;
    
    TYPE col_value_rec_t5 IS RECORD
    (
        valdata1 obj_value_t := '',
        valdata2 obj_value_t := '',
        valdata3 obj_value_t := '',
        valdata4 obj_value_t := '',
        valdata5 obj_value_t := ''
    );
    TYPE col_value_t5 IS TABLE OF col_value_rec_t5 INDEX BY BINARY_INTEGER;
  
    TYPE col_value_rec_t6 IS RECORD
    (
        valdata1 obj_value_t := '',
        valdata2 obj_value_t := '',
        valdata3 obj_value_t := '',
        valdata4 obj_value_t := '',
        valdata5 obj_value_t := '',
        valdata6 obj_value_t := ''
    );
    TYPE col_value_t6 IS TABLE OF col_value_rec_t6 INDEX BY BINARY_INTEGER;
      
    TYPE col_value_rec_t7 IS RECORD
    (
        valdata1 obj_value_t := '',
        valdata2 obj_value_t := '',
        valdata3 obj_value_t := '',
        valdata4 obj_value_t := '',
        valdata5 obj_value_t := '',
        valdata6 obj_value_t := '',
        valdata7 obj_value_t := ''
    );
    TYPE col_value_t7 IS TABLE OF col_value_rec_t7 INDEX BY BINARY_INTEGER;

    TYPE col_value_rec_t8 IS RECORD
    (
        valdata1 obj_value_t := '',
        valdata2 obj_value_t := '',
        valdata3 obj_value_t := '',
        valdata4 obj_value_t := '',
        valdata5 obj_value_t := '',
        valdata6 obj_value_t := '',
        valdata7 obj_value_t := '',
        valdata8 obj_value_t := ''
    );
    TYPE col_value_t8 IS TABLE OF col_value_rec_t8 INDEX BY BINARY_INTEGER;
        
    TYPE col_value_rec_t9 IS RECORD
    (
        valdata1 obj_value_t := '',
        valdata2 obj_value_t := '',
        valdata3 obj_value_t := '',
        valdata4 obj_value_t := '',
        valdata5 obj_value_t := '',
        valdata6 obj_value_t := '',
        valdata7 obj_value_t := '',
        valdata8 obj_value_t := '',
        valdata9 obj_value_t := ''
    );
    TYPE col_value_t9 IS TABLE OF col_value_rec_t9 INDEX BY BINARY_INTEGER;
    
    TYPE col_value_rec_t10 IS RECORD
    (
        valdata1 obj_value_t := NULL,
        valdata2 obj_value_t := NULL,
        valdata3 obj_value_t := NULL,
        valdata4 obj_value_t := NULL,
        valdata5 obj_value_t := NULL,
        valdata6 obj_value_t := NULL,
        valdata7 obj_value_t := NULL,
        valdata8 obj_value_t := NULL,
        valdata9 obj_value_t := NULL,
        valdata10 obj_value_t := NULL   
    );
    
    TYPE col_value_t10 IS TABLE OF col_value_rec_t10 INDEX BY obj_key_t;
     
    TYPE col_value_rec_t11 IS RECORD
    (
        valdata1 obj_value_t := NULL,
        valdata2 obj_value_t := NULL,
        valdata3 obj_value_t := NULL,
        valdata4 obj_value_t := NULL,
        valdata5 obj_value_t := NULL,
        valdata6 obj_value_t := NULL,
        valdata7 obj_value_t := NULL,
        valdata8 obj_value_t := NULL,
        valdata9 obj_value_t := NULL,
        valdata10 obj_value_t := NULL,
        valdata11 obj_value_t := NULL   
    );
    
    TYPE col_value_t11 IS TABLE OF col_value_rec_t11 INDEX BY BINARY_INTEGER;
      
    TYPE col_systme_rec_t IS RECORD
    (
        init      BOOLEAN      := FALSE,
        depths    NUMBER       := 1,
        className class_name_t :='',
        children  col_value_t10
    );
    
    TYPE col_system_t IS TABLE OF col_systme_rec_t INDEX BY class_name_t;    
    

    TYPE col_key_t IS TABLE OF obj_key_t INDEX BY BINARY_INTEGER;
    
    TYPE col_custom_rec_t IS RECORD
    (
        init      BOOLEAN      := FALSE,
        depths    NUMBER       := 1,
        className class_name_t :='',
        keyset    col_key_t,
        children  col_value_t10
    );
    
    TYPE col_custom_t IS TABLE OF col_custom_rec_t INDEX BY class_name_t;    
    

    -- --------------------------------------------------------------------

    
END h$type;