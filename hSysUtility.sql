create or replace PACKAGE h$util AS
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


   ------------------------------------------
   -- IS Function
   ------------------------------------------
   FUNCTION isNumber(p_val  IN NUMBER) RETURN H$TYPE.num_t;
   FUNCTION isNumber(p_val  IN DATE) RETURN H$TYPE.num_t;
   FUNCTION isNumber(p_val  IN VARCHAR2) RETURN H$TYPE.num_t;
   FUNCTION isNumber(p_val  IN CLOB) RETURN H$TYPE.num_t;
   FUNCTION isNumber2(p_val IN NUMBER,p_rtn_val IN NUMBER) RETURN H$TYPE.num_t;
   FUNCTION isNumber2(p_val IN DATE,p_rtn_val IN NUMBER) RETURN H$TYPE.num_t;
   FUNCTION isNumber2(p_val IN VARCHAR2,p_rtn_val IN NUMBER) RETURN H$TYPE.num_t;
   FUNCTION isNumber2(p_val IN CLOB,p_rtn_val IN NUMBER) RETURN H$TYPE.num_t;
   
   FUNCTION isString(p_val  IN VARCHAR2) RETURN H$TYPE.var_t;
   FUNCTION isString(p_val  IN DATE) RETURN H$TYPE.var_t;
   FUNCTION isString(p_val  IN NUMBER) RETURN H$TYPE.var_t;
   FUNCTION isString2(p_val IN VARCHAR2,p_rtn_val IN VARCHAR2) RETURN H$TYPE.var_t;
   FUNCTION isString2(p_val IN DATE,p_rtn_val IN VARCHAR2) RETURN H$TYPE.var_t;
   FUNCTION isString2(p_val IN NUMBER,p_rtn_val IN VARCHAR2) RETURN H$TYPE.var_t;

   FUNCTION isDate(p_val  IN NUMBER) RETURN H$TYPE.date_t;
   FUNCTION isDate(p_val  IN DATE) RETURN H$TYPE.date_t;
   FUNCTION isDate(p_val  IN VARCHAR2) RETURN H$TYPE.date_t;
   FUNCTION isDate(p_val  IN CLOB) RETURN H$TYPE.date_t;
   FUNCTION isDate2(p_val IN NUMBER,p_rtn_val IN DATE) RETURN H$TYPE.date_t;
   FUNCTION isDate2(p_val IN DATE,p_rtn_val IN DATE) RETURN H$TYPE.date_t;
   FUNCTION isDate2(p_val IN VARCHAR2,p_rtn_val IN DATE) RETURN H$TYPE.date_t;
   FUNCTION isDate2(p_val IN CLOB,p_rtn_val IN DATE) RETURN H$TYPE.date_t;

   FUNCTION isChar(p_str IN VARCHAR2,p_key IN VARCHAR2) RETURN H$TYPE.var_t;
   FUNCTION isChar(p_str IN VARCHAR2) RETURN hobjvalueset_t2;
 
    
   FUNCTION to_length  (p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;
   FUNCTION to_width   (p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;
   FUNCTION to_volume  (p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;
   FUNCTION to_heat    (p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;
   FUNCTION to_pressure(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;
   FUNCTION to_speed   (p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;
   FUNCTION to_data    (p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;   
   FUNCTION to_weight  (p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;
   FUNCTION to_time    (p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;
   
   FUNCTION to_xxx(clsName IN VARCHAR2,p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t;

   FUNCTION to_base ( p_dec in NUMBER, p_base in NUMBER )  RETURN H$TYPE.var_t;
   FUNCTION to_bin  ( p_dec in NUMBER )                    RETURN H$TYPE.var_t;
   FUNCTION to_dec  ( p_dec in NUMBER)                     RETURN H$TYPE.var_t;
   FUNCTION to_hex  ( p_dec in NUMBER )                    RETURN H$TYPE.var_t;
   FUNCTION to_ascii( p_str in varchar2 )                  RETURN H$TYPE.num_t ;
   FUNCTION to_ascii( p_str in varchar2, p_base in NUMBER )  RETURN H$TYPE.num_t;

   FUNCTION to_comma (p_dec in NUMBER ) return H$TYPE.var_t;
   FUNCTION to_substr(p_str in varchar2,p_delimeter in varchar2,p_direction in varchar2) RETURN H$TYPE.var_t;

   FUNCTION to_percent(p_dec in NUMBER) return H$TYPE.var_t;
   FUNCTION to_percent(p_val1 in NUMBER, p_val2 in NUMBER ) return H$TYPE.var_t;
   
   FUNCTION add_pattern( p_str in varchar2, p_key in varchar2 , p_pattern h$type.int_t, p_direction in varchar2)  RETURN H$TYPE.var_t;
   FUNCTION add_pattern( p_str in NUMBER,   p_key in NUMBER ,   p_pattern h$type.int_t, p_direction in varchar2)  RETURN H$TYPE.var_t;
   FUNCTION add_pattern (p_str IN VARCHAR2,p_key IN VARCHAR2,p_pattern NUMBER ) RETURN h$type.var_t;
   FUNCTION add_pattern (p_str IN NUMBER,  p_key IN NUMBER,  p_pattern NUMBER ) RETURN h$type.var_t;
  -- FUNCTION add_enter(p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;
 --  FUNCTION add_tab(p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;
 --  FUNCTION add_space(p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_key in varchar2,p_count in h$type.int_t,p_direction in varchar2) RETURN H$TYPE.var_t;
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_key in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_key in varchar2,p_direction in varchar2) RETURN H$TYPE.var_t;
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_count in h$type.int_t,p_direction in varchar2) RETURN H$TYPE.var_t;
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;  
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_key_or_direction in varchar2) RETURN H$TYPE.var_t;
   
   FUNCTION add_tag(p_str in varchar2, p_start in varchar2, p_end in varchar2, p_prefix in varchar2, p_postfix in varchar2) RETURN H$TYPE.var_t;
   
   
   FUNCTION chr_list(p_start in h$type.num_t,p_end in h$type.num_t) RETURN hobjvalueset_t2;
   
   FUNCTION to_split(p_str in varchar2,p_pattern in h$type.int_t) RETURN hobjvalueset_t1;
   FUNCTION to_split(p_str in varchar2,p_pattern in varchar2) RETURN hobjvalueset_t1;
   FUNCTION to_split(p_str in varchar2,p_pattern in varchar2,p_pattern2 in varchar2) RETURN hobjvalueset_t1;
   FUNCTION to_split(p_str in varchar2,p_pattern in varchar2,p_pattern2 in varchar2,p_pattern3 in varchar2) RETURN hobjvalueset_t1;
    
   FUNCTION to_col(tablename in varchar2,
                   columnname in varchar2,
                   ordercolumn in varchar2, 
                   keycolumnname in varchar2,
                   keycolumnvalue in varchar2) RETURN H$TYPE.var_t;
   FUNCTION to_col(tablename in varchar2,
                   columnname in varchar2,
                   ordercolumn in varchar2, 
                   keycolumnname in varchar2,                   
                   keycolumnvalue in varchar2,
                   p_delimeter in varchar2) RETURN H$TYPE.var_t;
   FUNCTION to_row(tablename in varchar2,
                   columnname in varchar2,
                   keycolumnname in varchar2) RETURN hobjvalueset_t1;
                   
                   --> 하다 말음
                   
   FUNCTION to_stmt(p_str in varchar2,prefix in varchar2) return h$type.var_t;
   FUNCTION to_stmt2(p_str in varchar2,prefix in varchar2) return h$type.var_t;
   FUNCTION to_trans(p_num in number) return h$type.var_t;
   FUNCTION to_trans(p_base in date,p_posting in date) return h$type.var_t;
   
   FUNCTION counta(p_str in varchar2, p_delimeter in varchar2) return h$type.num_t;
END h$util;

create or replace PACKAGE BODY h$util AS
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
    -- create or replace type hsysvalue_t1 as object 
    (
        DBSCHEMA    varchar2(4000) := '',
        LOADTIME    varchar2(4000) := '',
        SERVICE     varchar2(4000) := '',
        PHYSICAL_IO varchar2(4000) := '',
        DISK_IO     varchar2(4000) := '',
        EXEC_TIME   varchar2(4000) := '',
        EXECUTIONS  varchar2(4000) := '',
        SQL_TEXT    varchar2(4000) := ''  
    );
    */
    -- create or replace TYPE hsysvalueset_t1 is TABLE OF hsysvalue_t1;
    
    -- create or replace type hobjvalue_t1 as object (valdata varchar2(4000));
    -- create or replace TYPE hobjvalueset_t1 is TABLE OF hobjvalue_t1;
    
    -- create or replace type hobjvalue_t2 as object (keydata varchar2(4000),valdata varchar2(4000));
    -- create or replace TYPE hobjvalueset_t2 is TABLE OF hobjvalue_t2;
    
    -- create or replace type hobjvalue_t3 as object (keydata1 varchar2(4000),valdata1 varchar2(4000),valdata2 varchar2(4000));
    -- create or replace TYPE hobjvalueset_t3 is TABLE OF hobjvalue_t3;
    
    -- create or replace type hobjvalue_t4 as object (keydata1 varchar2(4000),valdata1 varchar2(4000),valdata2 varchar2(4000),valdata3 varchar2(4000));
    -- create or replace TYPE hobjvalueset_t4 is TABLE OF hobjvalue_t4;
    
    -- create or replace type hobjvalue_t10 as object (keydata1 varchar2(4000),valdata1 varchar2(4000),valdata2 varchar2(4000),valdata3 varchar2(4000),valdata4 varchar2(4000),valdata5 varchar2(4000),valdata6 varchar2(4000),valdata7 varchar2(4000),valdata8 varchar2(4000),valdata9 varchar2(4000));
    -- create or replace TYPE hobjvalueset_t10 is TABLE OF hobjvalue_t10;
     
    
    FUNCTION counta(p_str in varchar2, p_delimeter in varchar2) return h$type.num_t
    IS
     l_num h$type.num_t := 0;
     l_con boolean := false;
    BEGIN
      
       IF upper(p_delimeter) = h$constants.c_korean or 
          upper(p_delimeter) = h$constants.c_english or 
          upper(p_delimeter) = h$constants.c_chinese or 
          upper(p_delimeter) = h$constants.c_japanese or 
          upper(p_delimeter) = h$constants.c_special or 
          upper(p_delimeter) = h$constants.c_number       
       THEN
          l_con := true;
       END IF;

       FOR i in 1..length(p_str) LOOP
      
           IF (l_con) THEN
           
               IF h$util.isChar(substr(p_str,i,1),upper(p_delimeter)) is not null THEN
                  l_num := l_num + 1;
               END IF;
           
           ELSE
               IF substr(p_str,i,1) = p_delimeter THEN
                  l_num := l_num + 1;
               END IF;           
           END IF;
        
       
       END LOOP;
       
       return l_num;     
          
    END counta;
    
    
    FUNCTION to_split(p_str in varchar2,p_pattern in varchar2,p_pattern2 in varchar2,p_pattern3 in varchar2) RETURN hobjvalueset_t1
    IS
     idset    hobjvalueset_t1 := hobjvalueset_t1();
     l_pos    H$TYPE.int_t    := 1;
     l_max    H$TYPE.int_t    := length(p_str);
     l_id     H$TYPE.int_t    := 1;
     l_diff   H$TYPE.int_t    := 1;
     l_diff1  H$TYPE.int_t    := length(p_pattern);
     l_diff2  H$TYPE.int_t    := length(p_pattern2);
     l_diff3  H$TYPE.int_t    := length(p_pattern3);     
     found    BOOLEAN := FALSE;
    BEGIN
    
       for i in 1..l_max loop
         DECLARE
           l_stmt h$type.var_t;
         BEGIN
              IF i >= l_pos THEN
                  IF  substr(p_str,i,l_diff1) = p_pattern THEN
                      l_diff := l_diff1;
                      l_stmt := replace(substr(p_str,l_pos,i-l_pos+1+l_diff-1),p_pattern,'');
                      found  := TRUE;
                  ELSIF substr(p_str,i,l_diff2) = p_pattern2 THEN
                      l_diff := l_diff2;
                      l_stmt := replace(substr(p_str,l_pos,i-l_pos+1+l_diff-1),p_pattern2,'');
                      found  := TRUE;
                  ELSIF substr(p_str,i,l_diff3) = p_pattern3 THEN
                      l_diff := l_diff3;
                      l_stmt := replace(substr(p_str,l_pos,i-l_pos+1+l_diff-1),p_pattern3,'');
                      found  := TRUE;
                  ELSE
                      found  := FALSE;
                      l_stmt := NULL;
                  END IF;          
                  
                  IF (found) THEN    
                     IF l_stmt is not null  THEN
                        idset.extend;
                        idset(l_id) := hobjvalue_t1(l_stmt);
                        l_id  := l_id + 1;
                     END IF;
                     l_pos := i + 1 + l_diff -1;
                  END IF;
              END IF;
         END;
          
       END LOOP; 
       
       if l_pos <=  l_max then
          DECLARE
            l_stmt h$type.var_t :=substr(p_str,l_pos);
          BEGIN
            IF l_stmt is not null THEN
               idset.extend;
               idset(l_id) := hobjvalue_t1(l_stmt);
            END IF;
          END;
       end if;
              
       return idset;    
    
    END to_split;
    
    FUNCTION to_split(p_str in varchar2,p_pattern in varchar2,p_pattern2 in varchar2) RETURN hobjvalueset_t1
    IS
     idset    hobjvalueset_t1 := hobjvalueset_t1();
     l_pos    H$TYPE.int_t    := 1;
     l_max    H$TYPE.int_t    := length(p_str);
     l_id     H$TYPE.int_t    := 1;
     l_diff   H$TYPE.int_t    := 1;
     l_diff1  H$TYPE.int_t    := length(p_pattern);
     l_diff2  H$TYPE.int_t    := length(p_pattern2);
     found    BOOLEAN := FALSE;
    BEGIN
    
       for i in 1..l_max loop
         DECLARE
           l_stmt h$type.var_t;
         BEGIN
              IF i >= l_pos THEN
                  IF  substr(p_str,i,l_diff1) = p_pattern THEN
                      l_diff := l_diff1;
                      l_stmt := replace(substr(p_str,l_pos,i-l_pos+1+l_diff-1),p_pattern,'');
                      found  := TRUE;
                  ELSIF substr(p_str,i,l_diff2) = p_pattern2 THEN
                      l_diff := l_diff2;
                      l_stmt := replace(substr(p_str,l_pos,i-l_pos+1+l_diff-1),p_pattern2,'');
                      found  := TRUE;
                  ELSE
                      found  := FALSE;
                      l_stmt := NULL;
                  END IF;          
                  
                  IF (found) THEN    
                     IF l_stmt is not null  THEN
                        idset.extend;
                        idset(l_id) := hobjvalue_t1(l_stmt);
                        l_id  := l_id + 1;
                     END IF;
                     l_pos := i + 1 + l_diff -1;
                  END IF;
              END IF;
         END;
          
       END LOOP; 
       
       if l_pos <=  l_max then
          DECLARE
            l_stmt h$type.var_t :=substr(p_str,l_pos);
          BEGIN
            IF l_stmt is not null THEN
               idset.extend;
               idset(l_id) := hobjvalue_t1(l_stmt);
            END IF;
          END;
       end if;
              
       return idset;    
    
    END to_split;
    
    FUNCTION to_split(p_str in varchar2,p_pattern in varchar2) RETURN hobjvalueset_t1
    IS
     idset    hobjvalueset_t1 := hobjvalueset_t1();
     l_pos    H$TYPE.int_t    := 1;
     l_max    H$TYPE.int_t    := length(p_str);
     l_id     H$TYPE.int_t    := 1;
     l_diff   H$TYPE.int_t    := 1;
     l_diff1  H$TYPE.int_t    := length(p_pattern);
     found    BOOLEAN := FALSE;
    BEGIN
    
       for i in 1..l_max loop
         DECLARE
           l_stmt h$type.var_t;
         BEGIN
              IF i >= l_pos THEN
                  IF  substr(p_str,i,l_diff1) = p_pattern THEN
                      l_diff := l_diff1;
                      l_stmt := replace(substr(p_str,l_pos,i-l_pos+1+l_diff-1),p_pattern,'');
                      found  := TRUE;
                  ELSE
                      found  := FALSE;
                      l_stmt := NULL;
                  END IF;          
                  
                  IF (found) THEN    
                     IF l_stmt is not null  THEN
                        idset.extend;
                        idset(l_id) := hobjvalue_t1(l_stmt);
                        l_id  := l_id + 1;
                     END IF;
                     l_pos := i + 1 + l_diff -1;
                  END IF;
              END IF;
         END;
          
       END LOOP; 
       
       if l_pos <=  l_max then
          DECLARE
            l_stmt h$type.var_t :=substr(p_str,l_pos);
          BEGIN
            IF l_stmt is not null THEN
               idset.extend;
               idset(l_id) := hobjvalue_t1(l_stmt);
            END IF;
          END;
       end if;
              
       return idset;    
    
    END to_split;

    FUNCTION to_split(p_str in varchar2,p_pattern in  h$type.int_t) RETURN hobjvalueset_t1
    IS
     idset    hobjvalueset_t1 := hobjvalueset_t1();
     l_pos    H$TYPE.int_t;
     l_max    H$TYPE.int_t; 
     l_id     H$TYPE.int_t;
     l_ptn    H$TYPE.int_t;
    BEGIN
    
       l_pos   := 1;
       l_max   := length(p_str);
       l_id    := 1;
       l_ptn   := p_pattern;
       
       IF l_ptn = 0 THEN l_ptn := 1; END IF;    
    
       for i in 1..l_max loop
          IF mod(i,l_ptn) = 0 THEN 
             idset.extend;
             idset(l_id) := hobjvalue_t1(substr(p_str,l_pos,i-l_pos+1));
             l_id := l_id + 1;
             l_pos := i + 1;
          END IF;
       end loop; 
       
       if l_pos <=  l_max then
          idset.extend;
          idset(l_id) := hobjvalue_t1(substr(p_str,l_pos));
       end if;
              
       return idset;    
    
    END to_split;
    
    FUNCTION to_col(tablename in varchar2,
                    columnname in varchar2,
                    ordercolumn in varchar2, 
                    keycolumnname in varchar2,
                    keycolumnvalue in varchar2) RETURN H$TYPE.var_t
    IS 
    BEGIN
    
       return to_col(tablename,columnname,ordercolumn,keycolumnname,keycolumnvalue,h$constants.c_comma);
    
    END to_col;    

    FUNCTION to_col(tablename in varchar2,
                    columnname in varchar2,
                    ordercolumn in varchar2,
                    keycolumnname in varchar2,
                    keycolumnvalue in varchar2,
                    p_delimeter in varchar2) RETURN H$TYPE.var_t
    IS     
      l_stmt h$type.var_t;
      l_rtn_val  h$type.var_t;
      ccrsr  h$type.idcrsr_t;
      idset  h$type.col_value_t1;
      maxcnt BINARY_INTEGER := 0;
    BEGIN    
       
       l_stmt := 'SELECT decode(h$util.isdate('||columnname||'),NULL,to_char('||columnname||'),to_char('||columnname||',''yyyymmddhh24miss'')) objvalue ';
       l_stmt := l_stmt || ' FROM '||tablename||' WHERE '||keycolumnname||'='''||keycolumnvalue||''' order by '||ordercolumn;
       
       
       OPEN ccrsr FOR l_stmt;
       
       FETCH ccrsr BULK COLLECT INTO idset;
       CLOSE ccrsr;
       
        maxcnt := idset.COUNT;
        IF (maxcnt > 0) THEN
            FOR i IN idset.FIRST..idset.LAST LOOP
                IF i = 1 THEN
                  l_rtn_val := substrb(l_rtn_val ||idset(i),1,4000);
                ELSE                 
                  l_rtn_val := substrb(l_rtn_val ||p_delimeter||idset(i),1,4000);
                END IF;
            END LOOP;
        END IF;
       
       RETURN l_rtn_val;
         
    END to_col;
    
    FUNCTION to_row(tablename in varchar2,
                    columnname in varchar2,
                    keycolumnname in varchar2) RETURN hobjvalueset_t1
    IS     
      l_rtn_val    hobjvalueset_t1 := hobjvalueset_t1();
      l_stmt h$type.var_t;
     -- l_rtn  h$type.var_t;
      ccrsr  h$type.idcrsr_t;
      idset  h$type.col_value_t2;
      maxcnt BINARY_INTEGER := 0;
      v_key  h$type.var_t := '';
      v_val  h$type.var_t := '';
    BEGIN    
      
    /*
       l_stmt := 'SELECT '||keycolumnname||' valdata1, '||;
       l_stmt := l_stmt ||'decode(h$util.isdate('||columnname||'),NULL,to_char('||columnname||'),';
       l_stmt := l_stmt ||'to_char('||columnname||',''yyyymmddhh24miss'')) valdata2 FROM '||tablename;
       l_stmt := l_stmt ||' WHERE 1=1 order by '||keycolumnname||','||columnname;
       
       OPEN ccrsr FOR l_stmt;
       FETCH ccrsr BULK COLLECT INTO idset;
       CLOSE ccrsr;
       
        maxcnt := idset.COUNT;
        IF (maxcnt > 0) THEN
            FOR i IN idset.FIRST..idset.LAST LOOP
                IF v_key = '' THEN
                   v_key := idset(i).valdata1;
                END IF;
                
                IF v_key != idset(i).valdata1 THEN
                v_key := idset(i).valdata1;
                
                END IF;                
                
                v_key := idset(i).valdata1;
                v_val := idset(i).valdata2;
              
               -- l_rtn_val := substrb(l_rtn_val ||idset(i),1,4000);
            END LOOP;
        END IF;
       */
       RETURN l_rtn_val;
         
    END to_row;
    


    FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_key in varchar2,p_count in h$type.int_t,p_direction in varchar2) RETURN H$TYPE.var_t
    IS
     l_max     h$type.int_t;
     post_fix  H$TYPE.var_t;     
     pre_fix   H$TYPE.var_t;
    BEGIN    
       
       l_max := p_count;
       IF l_max > 1000 THEN l_max := 1000; END IF;
       
       IF p_direction = H$CONSTANTS.C_LEFT THEN
       
           IF (p_key is not null and substr(p_str,1,length(p_key)) = p_key ) or p_key is null then
               for i in 1..l_max loop     
                   pre_fix := p_val || pre_fix ;
               end loop;
           end if;
       
           return substrb(pre_fix||p_str,1,4000);      

       ELSE
       
           IF (p_key is not null and substr(p_str,length(p_str)-length(p_key)) = p_key ) or p_key is null then
               for i in 1..l_max loop     
                   post_fix := post_fix ||p_val;
               end loop;
           end if;
       
           return substrb(p_str||post_fix,1,4000);       
       
       END IF;
    
    END add_key;
    
   
   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_key_or_direction in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
      IF p_key_or_direction = h$constants.c_right or p_key_or_direction = h$constants.c_left then
         return h$util.add_key(p_str,p_val,null,1,p_key_or_direction);
      ELSE
         return h$util.add_key(p_str,p_val,p_key_or_direction,1,h$constants.c_right);
      END IF;
   END add_key;
   
   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,p_val,null,p_count,h$constants.c_right);
   END add_key;
   
   
   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_key in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,p_val,p_key,p_count,h$constants.c_right);
   END add_key;
   

   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_key in varchar2,p_direction in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,p_val,p_key,1,p_direction);
   END add_key;
   

   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_count in h$type.int_t,p_direction in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,p_val,null,p_count,p_direction);
   END add_key;
   
   
   
   
   


 
    FUNCTION to_substr(p_str in varchar2,p_delimeter in varchar2,p_direction in varchar2) RETURN H$TYPE.var_t
    IS
     l_rtn_val H$TYPE.var_t;
    BEGIN
    
       IF upper(p_direction) = h$constants.c_left THEN
       
          l_rtn_val := substr(p_str,1,instrb(p_str,p_delimeter)-1);
       
       ELSE
          
          l_rtn_val := substr(p_str,instrb(p_str,p_delimeter)+1);          
       
       END IF;
       
       return l_rtn_val;
    
    END to_substr;
    
    
    FUNCTION chr_list(p_start in h$type.num_t,p_end in h$type.num_t) RETURN hobjvalueset_t2
    IS
     idset    hobjvalueset_t2 := hobjvalueset_t2();
     l_chr    H$TYPE.CHR_T;
     l_max    number;
     l_id     H$TYPE.int_t    := 1;
    BEGIN
       
    
       if p_end - p_start > 3000 then
          l_max := p_start + 3000;
       else
          l_max := p_end;
       end if;
       
       for i in p_start..l_max loop
              
           IF i = 9 THEN l_chr := 'Tab';
           ELSIF i = 10 THEN l_chr := 'Enter';
           ELSIF i = 13 THEN l_chr := 'Enter';
           ELSIF i = 32 THEN l_chr := 'Space';
           ELSE l_chr := chr(i); END IF;
              
           idset.extend;
           idset(l_id) := hobjvalue_t2(to_char(i),trim(l_chr));
           l_id  := l_id + 1;

       end loop;    
       return idset;
    END chr_list;
    

    FUNCTION to_percent (p_dec in NUMBER ) return H$TYPE.var_t
    IS
    BEGIN        
      return to_char(p_dec*100)||'%';
    END to_percent;
    
    
    FUNCTION to_percent (p_val1 in NUMBER, p_val2 in NUMBER ) return H$TYPE.var_t
    IS
      l_rtn_val H$TYPE.var_t;
    BEGIN 
    
       IF p_val1 > p_val2 THEN
          l_rtn_val := to_char(round(((p_val1-p_val2)/p_val1)*100,2))||h$constants.c_percent;       
       ELSIF p_val1 < p_val2 THEN
          l_rtn_val := to_char(round(((p_val2-p_val1)/p_val1)*100,2))||h$constants.c_percent;  
       ELSE
          l_rtn_val := '0'||h$constants.c_percent;
       END IF;
           
      return l_rtn_val;
    END to_percent;
    
    FUNCTION to_comma (p_dec in NUMBER ) return H$TYPE.var_t
    IS
      l_first  h$type.var_t;
      l_second h$type.var_t;
      l_middle h$type.var_t := '.';
      l_stmt   h$type.var_t;
    BEGIN
      IF instr(to_char(p_dec),'.') > 0 then
      
         l_first  := to_substr(to_char(p_dec),'.',h$constants.c_left);
         l_second := to_substr(to_char(p_dec),'.',h$constants.c_right);
         l_stmt   := add_pattern(l_first,',',3, h$constants.c_right)||l_middle||l_second;
         
      ELSE
         l_stmt:=  add_pattern( to_char(p_dec),',',3, h$constants.c_right);
      END IF;
      
      IF substr(l_stmt,1,1) = ',' THEN
         l_stmt := substr(l_stmt,2);      
      END IF;
      
      return l_stmt;
      
    END to_comma;
    
 
    FUNCTION add_pattern( p_str in varchar2, p_key in varchar2 , p_pattern H$TYPE.int_t , p_direction in varchar2)  RETURN H$TYPE.var_t
    IS
     l_str  H$TYPE.var_t := '';
     l_cnt  H$TYPE.int_t := 1;
     l_num  H$TYPE.int_t := 1;
     l_max  H$TYPE.int_t;
     l_ptn  H$TYPE.int_t;
    BEGIN
    
        IF p_str is null THEN return null; END IF;
                
        l_max := length(p_str);
        l_ptn := p_pattern;
       
        IF l_ptn = 0 THEN l_ptn := 1; END IF;    
        
        
        IF upper(p_direction) = h$constants.c_right THEN
       
        l_cnt := l_max ;
        
           loop
  
                IF mod(l_num,l_ptn) = 0 THEN 
                   l_str := p_key || substr( p_str, l_cnt, 1 ) || l_str;
                ELSE
                   l_str :=  substr( p_str, l_cnt, 1 ) ||l_str ;
                END IF;
                l_num := l_num + 1;
                l_cnt := l_cnt - 1;
                exit when ( l_cnt < 1 );
           end loop;
        
        ELSE
           l_cnt := 1 ;
        
           loop
                IF mod(l_num,l_ptn) = 0 THEN 
                   l_str := l_str ||  substr( p_str, l_cnt, 1 ) || p_key;
                ELSE
                   l_str := l_str ||  substr( p_str, l_cnt, 1 ) ;
                END IF;
                l_num := l_num + 1;
                l_cnt := l_cnt + 1;
                exit when ( l_cnt > l_max );
           end loop;
        
        END IF;
        
        return l_str;
    
    END add_pattern;
    

    FUNCTION add_pattern( p_str in NUMBER, p_key in NUMBER , p_pattern h$type.int_T, p_direction in varchar2)  RETURN H$TYPE.var_t
    IS
     l_str  H$TYPE.var_t := '';
     l_cnt  H$TYPE.int_t := 1;
     l_num  H$TYPE.int_t := 1;
     l_max  H$TYPE.int_t;
     l_ptn  H$TYPE.int_t;
    BEGIN
    
        IF p_str is null THEN return null; END IF;
            
        l_max := length(p_str);
        l_ptn := p_pattern;
       
        IF l_ptn = 0 THEN l_ptn := 1; END IF;  
        
        IF upper(p_direction) = h$constants.c_right THEN
           l_cnt := l_max ;
        
           loop
                IF mod(l_num,l_ptn) = 0 THEN 
                   l_str := p_key || substr( p_str, l_cnt, 1 ) || l_str;
                ELSE
                   l_str :=  substr( p_str, l_cnt, 1 ) ||l_str ;
                END IF;
                l_num := l_num + 1;
                l_cnt := l_cnt - 1;
                exit when ( l_cnt < 1 );
           end loop;
        
        ELSE
           l_cnt := 1 ;
        
           loop
                IF mod(l_num,l_ptn) = 0 THEN 
                   l_str := l_str ||  substr( p_str, l_cnt, 1 ) || p_key;
                ELSE
                   l_str := l_str ||  substr( p_str, l_cnt, 1 ) ;
                END IF;
                l_num := l_num + 1;
                l_cnt := l_cnt + 1;
                exit when ( l_cnt > l_max );
           end loop;
        
        END IF;
        
        return l_str;
    
    END add_pattern;
    
    
    FUNCTION add_pattern (p_str IN VARCHAR2,p_key IN VARCHAR2,p_pattern NUMBER) RETURN h$type.var_t
    IS
    BEGIN 
      RETURN add_pattern (p_str, p_key, p_pattern, h$constants.c_left );
    END add_pattern;
    
    FUNCTION add_pattern (p_str IN NUMBER,p_key IN NUMBER,p_pattern NUMBER) RETURN h$type.var_t
    IS
    BEGIN 
      RETURN add_pattern (p_str, p_key, p_pattern, h$constants.c_left );
    END add_pattern; 
        


    FUNCTION to_base( p_dec in NUMBER, p_base in NUMBER )  RETURN H$TYPE.var_t
    IS
        l_str    varchar2(255) default NULL;
        l_num    NUMBER    default p_dec;
        l_hex    varchar2(16) default '0123456789ABCDEF';
    BEGIN
        if ( p_dec is null or p_base is null )
        then
            return null;
        end if;
        if ( trunc(p_dec) <> p_dec OR p_dec < 0 ) then
            raise PROGRAM_ERROR;
        end if;
        loop
            l_str := substr( l_hex, mod(l_num,p_base)+1, 1 ) || l_str;
            l_num := trunc( l_num/p_base );
            exit when ( l_num = 0 );
        end loop;
        return l_str;
    END to_base;
    
    FUNCTION to_bin( p_dec in NUMBER ) RETURN H$TYPE.var_t
    IS
        l_str    varchar2(255) default NULL;
    BEGIN
    
      SELECT REPLACE(MAX (SYS_CONNECT_BY_PATH(bit, ',')), ',') into l_str
        FROM
        ( 
          SELECT COUNT (*) OVER () - LEVEL + 1 level#
               , DECODE (TRUNC (deci / POWER (2, LEVEL)),ROUND (deci / POWER (2, LEVEL)), 0,1) bit
            FROM 
               ( 
                 SELECT p_dec deci
                   FROM DUAL
               )
         CONNECT BY POWER (2, LEVEL - 1) <= deci
        )
      CONNECT BY PRIOR level# = level# - 1
      START WITH level# = 1;
    
      return l_str;

    END to_bin; 
    
    
    FUNCTION to_dec(p_dec in NUMBER) RETURN H$TYPE.var_t
    IS 
      l_str    varchar2(255) default NULL;
    BEGIN
      SELECT     SUM (SUBSTR (bin, LEVEL, 1) * POWER (2, LENGTH (bin) - LEVEL)) into l_str
       FROM (SELECT p_dec bin
              FROM DUAL)
      CONNECT BY LEVEL <= LENGTH (bin);
    
      return l_str;   
    END to_dec; 
    
    FUNCTION to_hex( p_dec in NUMBER ) RETURN H$TYPE.var_t
    IS
    BEGIN
        return to_base( p_dec, 16 );
    END to_hex;
    
    FUNCTION to_ascii( p_str in varchar2 ) RETURN H$TYPE.num_t 
    IS
    BEGIN
        return ascii( p_str );
    END to_ascii;
 
    FUNCTION to_ascii( p_str in varchar2, p_base in NUMBER )  RETURN H$TYPE.num_t 
    IS
     l_hex    varchar2(16) default '0123456789ABCDEF';
     l_num    NUMBER := 1;
     r_num    NUMBER := 0;
    BEGIN
        
        if p_str is null or p_str = '' then 
           return r_num;
        end if;
        
        if length(p_str) = 1 then
           r_num := instr(l_hex,p_str)-1;
           return r_num;
        end if;
        
        for i in 1..length(p_str) loop
            
        
            if i != length(p_str) then
            
               r_num := (r_num+instr(l_hex,substr( p_str, i,1))-1)*p_base;            
            
            else
             
               r_num := r_num+instr(l_hex,substr( p_str, i,1))-1;
            
            end if;
            
            
        end loop;
        
        return r_num;
        
    END to_ascii;
 

    FUNCTION to_xxx(clsName IN VARCHAR2,p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
     l_val1      h$type.obj_value_t;
     l_val2      h$type.obj_value_t;
     diff      NUMBER;
    BEGIN

         
       l_val1 := H$CACHE.GETSYSTEMCACHE(clsName,upper(p_from_key));
       l_val2 := H$CACHE.GETSYSTEMCACHE(clsName,upper(p_to_key));
           
       diff := to_number(l_val2)/to_number(l_val1);
       l_rtn_val := p_val*diff;         
   
       return l_rtn_val;
    EXCEPTION     
     WHEN OTHERS THEN
       raise_application_error(-20001,SQLERRM);
    END to_xxx;

    FUNCTION to_width(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN
    
    
      -- 7
      IF upper(p_from_key) != upper(H$CONSTANTS.c_m2)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_a)   and
         upper(p_from_key) != upper(H$CONSTANTS.c_ha)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_km2) and
         upper(p_from_key) != upper(H$CONSTANTS.c_ft2) and
         upper(p_from_key) != upper(H$CONSTANTS.c_yd2) and
         upper(p_from_key) != upper(H$CONSTANTS.c_ac) THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF
         upper(p_to_key) != upper(H$CONSTANTS.c_m2)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_a)   and
         upper(p_to_key) != upper(H$CONSTANTS.c_ha)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_km2) and
         upper(p_to_key) != upper(H$CONSTANTS.c_ft2) and
         upper(p_to_key) != upper(H$CONSTANTS.c_yd2) and
         upper(p_to_key) != upper(H$CONSTANTS.c_ac)  THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(H$CONSTANTS.C_width,p_val,p_from_key,p_to_key);        
      
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_width;
    
    FUNCTION to_volume(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN
  
      -- 12
      IF upper(p_from_key) != upper(H$CONSTANTS.c_cc)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_ml)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_cm3) and
         upper(p_from_key) != upper(H$CONSTANTS.c_in3) and
         upper(p_from_key) != upper(H$CONSTANTS.c_oz)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_dl)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_l)   and
         upper(p_from_key) != upper(H$CONSTANTS.c_gal) and
         upper(p_from_key) != upper(H$CONSTANTS.c_ft3) and
         upper(p_from_key) != upper(H$CONSTANTS.c_l)   and
         upper(p_from_key) != upper(H$CONSTANTS.c_yd3) and
         upper(p_from_key) != upper(H$CONSTANTS.c_m3)  THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF upper(p_to_key) != upper(H$CONSTANTS.c_cc)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_ml)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_cm3) and
         upper(p_to_key) != upper(H$CONSTANTS.c_in3) and
         upper(p_to_key) != upper(H$CONSTANTS.c_oz)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_dl)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_l)   and
         upper(p_to_key) != upper(H$CONSTANTS.c_gal) and
         upper(p_to_key) != upper(H$CONSTANTS.c_ft3) and
         upper(p_to_key) != upper(H$CONSTANTS.c_l)   and
         upper(p_to_key) != upper(H$CONSTANTS.c_yd3) and
         upper(p_to_key) != upper(H$CONSTANTS.c_m3)  THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(H$CONSTANTS.C_volume,p_val,p_from_key,p_to_key);        
      
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_volume;
    
    FUNCTION to_length(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN
    
      -- 8
      IF upper(p_from_key) != upper(H$CONSTANTS.C_MM) and
         upper(p_from_key) != upper(H$CONSTANTS.C_CM) and
         upper(p_from_key) != upper(H$CONSTANTS.C_M) and
         upper(p_from_key) != upper(H$CONSTANTS.C_KM) and
         upper(p_from_key) != upper(H$CONSTANTS.C_IN) and
         upper(p_from_key) != upper(H$CONSTANTS.C_FT) and
         upper(p_from_key) != upper(H$CONSTANTS.C_YD) and
         upper(p_from_key) != upper(H$CONSTANTS.C_MILE) THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF
         upper(p_to_key) != upper(H$CONSTANTS.C_MM) and
         upper(p_to_key) != upper(H$CONSTANTS.C_CM) and
         upper(p_to_key) != upper(H$CONSTANTS.C_M) and
         upper(p_to_key) != upper(H$CONSTANTS.C_KM) and
         upper(p_to_key) != upper(H$CONSTANTS.C_IN) and
         upper(p_to_key) != upper(H$CONSTANTS.C_FT) and
         upper(p_to_key) != upper(H$CONSTANTS.C_YD) and
         upper(p_to_key) != upper(H$CONSTANTS.C_MILE) THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(H$CONSTANTS.C_LENGTH,p_val,p_from_key,p_to_key);        
      
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_length;
 
    FUNCTION to_weight(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN    
    
      IF upper(p_from_key) != upper(H$CONSTANTS.c_mg) and
         upper(p_from_key) != upper(H$CONSTANTS.c_g) and
         upper(p_from_key) != upper(H$CONSTANTS.c_kg) and
         upper(p_from_key) != upper(H$CONSTANTS.c_t) and
         upper(p_from_key) != upper(H$CONSTANTS.c_kt) and
         upper(p_from_key) != upper(H$CONSTANTS.c_gr) and
         upper(p_from_key) != upper(H$CONSTANTS.c_oz) and
         upper(p_from_key) != upper(H$CONSTANTS.c_lb) THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF
         upper(p_to_key) != upper(H$CONSTANTS.c_mg) and
         upper(p_to_key) != upper(H$CONSTANTS.c_g) and
         upper(p_to_key) != upper(H$CONSTANTS.c_kg) and
         upper(p_to_key) != upper(H$CONSTANTS.c_t) and
         upper(p_to_key) != upper(H$CONSTANTS.c_kt) and
         upper(p_to_key) != upper(H$CONSTANTS.c_gr) and
         upper(p_to_key) != upper(H$CONSTANTS.c_oz) and
         upper(p_to_key) != upper(H$CONSTANTS.c_lb) THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(h$constants.c_weight,p_val,p_from_key,p_to_key);        
      
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_weight;
    
    FUNCTION to_heat(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN    

      -- 3
      IF upper(p_from_key) != upper(H$CONSTANTS.c_C) and
         upper(p_from_key) != upper(H$CONSTANTS.c_F) and
         upper(p_from_key) != upper(H$CONSTANTS.c_K) THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF
         upper(p_to_key) != upper(H$CONSTANTS.c_C) and
         upper(p_to_key) != upper(H$CONSTANTS.c_F) and
         upper(p_to_key) != upper(H$CONSTANTS.c_K) THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(h$constants.c_heat,p_val,p_from_key,p_to_key);        
      
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_heat;
    

    FUNCTION to_pressure(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN    

      -- 14
      IF upper(p_from_key) != upper(H$CONSTANTS.c_dyne) and
         upper(p_from_key) != upper(H$CONSTANTS.c_pa) and
         upper(p_from_key) != upper(H$CONSTANTS.c_mmh2o) and
         upper(p_from_key) != upper(H$CONSTANTS.c_hpa) and
         upper(p_from_key) != upper(H$CONSTANTS.c_mb) and
         upper(p_from_key) != upper(H$CONSTANTS.c_mmhg) and
         upper(p_from_key) != upper(H$CONSTANTS.c_inchh2o) and
         upper(p_from_key) != upper(H$CONSTANTS.c_kpa) and
         upper(p_from_key) != upper(H$CONSTANTS.c_inchhg) and
         upper(p_from_key) != upper(H$CONSTANTS.c_psi) and
         upper(p_from_key) != upper(H$CONSTANTS.c_kgf) and
         upper(p_from_key) != upper(H$CONSTANTS.c_bar) and
         upper(p_from_key) != upper(H$CONSTANTS.c_atm) and
         upper(p_from_key) != upper(H$CONSTANTS.c_mpa) THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF upper(p_to_key) != upper(H$CONSTANTS.c_dyne) and
         upper(p_to_key) != upper(H$CONSTANTS.c_pa) and
         upper(p_to_key) != upper(H$CONSTANTS.c_mmh2o) and
         upper(p_to_key) != upper(H$CONSTANTS.c_hpa) and
         upper(p_to_key) != upper(H$CONSTANTS.c_mb) and
         upper(p_to_key) != upper(H$CONSTANTS.c_mmhg) and
         upper(p_to_key) != upper(H$CONSTANTS.c_inchh2o) and
         upper(p_to_key) != upper(H$CONSTANTS.c_kpa) and
         upper(p_to_key) != upper(H$CONSTANTS.c_inchhg) and
         upper(p_to_key) != upper(H$CONSTANTS.c_psi) and
         upper(p_to_key) != upper(H$CONSTANTS.c_kgf) and
         upper(p_to_key) != upper(H$CONSTANTS.c_bar) and
         upper(p_to_key) != upper(H$CONSTANTS.c_atm) and
         upper(p_to_key) != upper(H$CONSTANTS.c_mpa) THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(h$constants.c_pressure,p_val,p_from_key,p_to_key);        
      
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_pressure;
    
    FUNCTION to_speed(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN    

      -- 12
       
      IF upper(p_from_key) != upper(H$CONSTANTS.c_in_h) and
         upper(p_from_key) != upper(H$CONSTANTS.c_ft_h) and
         upper(p_from_key) != upper(H$CONSTANTS.c_m_h)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_in_s) and
         upper(p_from_key) != upper(H$CONSTANTS.c_km_h) and
         upper(p_from_key) != upper(H$CONSTANTS.c_ft_s) and
         upper(p_from_key) != upper(H$CONSTANTS.c_mi_h) and
         upper(p_from_key) != upper(H$CONSTANTS.c_kn)   and
         upper(p_from_key) != upper(H$CONSTANTS.c_m_s)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_mach) and
         upper(p_from_key) != upper(H$CONSTANTS.c_km_s) and
         upper(p_from_key) != upper(H$CONSTANTS.c_mi_s) THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF upper(p_to_key) != upper(H$CONSTANTS.c_in_h) and
         upper(p_to_key) != upper(H$CONSTANTS.c_ft_h) and
         upper(p_to_key) != upper(H$CONSTANTS.c_m_h)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_in_s) and
         upper(p_to_key) != upper(H$CONSTANTS.c_km_h) and
         upper(p_to_key) != upper(H$CONSTANTS.c_ft_s) and
         upper(p_to_key) != upper(H$CONSTANTS.c_mi_h) and
         upper(p_to_key) != upper(H$CONSTANTS.c_kn)   and
         upper(p_to_key) != upper(H$CONSTANTS.c_m_s)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_mach) and
         upper(p_to_key) != upper(H$CONSTANTS.c_km_s) and
         upper(p_to_key) != upper(H$CONSTANTS.c_mi_s) THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(h$constants.c_speed,p_val,p_from_key,p_to_key);        
      
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_speed;
    
    FUNCTION to_data(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN    

      -- 8
      IF upper(p_from_key) != upper(H$CONSTANTS.c_bit) and
         upper(p_from_key) != upper(H$CONSTANTS.c_b)   and
         upper(p_from_key) != upper(H$CONSTANTS.c_kb)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_mb)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_gb)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_tb)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_pb)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_eb) THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF upper(p_to_key) != upper(H$CONSTANTS.c_bit) and
         upper(p_to_key) != upper(H$CONSTANTS.c_b)   and
         upper(p_to_key) != upper(H$CONSTANTS.c_kb)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_mb)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_gb)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_tb)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_pb)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_eb)  THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(h$constants.c_data,p_val,p_from_key,p_to_key);        
      
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_data;
    
    FUNCTION to_time(p_val IN NUMBER,p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN H$TYPE.num_t
    IS
     l_rtn_val H$TYPE.num_t :=0;
    BEGIN    

      -- 4
      IF upper(p_from_key) != upper(H$CONSTANTS.c_SS)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_MI)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_HH)  and
         upper(p_from_key) != upper(H$CONSTANTS.c_DD)  THEN
         
         RAISE H$EXECEPTIONS.X_UNDEFINED;
         
      ELSIF upper(p_to_key) != upper(H$CONSTANTS.c_SS)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_MI)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_HH)  and
         upper(p_to_key) != upper(H$CONSTANTS.c_DD) THEN
      
         RAISE H$EXECEPTIONS.X_UNDEFINED;
      
      ELSE
      
         IF upper(p_from_key) = upper(p_to_key) THEN l_rtn_val :=1; END IF;
          
         l_rtn_val := to_xxx(h$constants.c_time,p_val,p_from_key,p_to_key);         
      
      END IF;    
      
      return l_rtn_val;
    
    
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_UNDEFINED then
       raise_application_error(-20001,'Undefined key ['||p_from_key||','||p_to_key||']');
     WHEN OTHERS THEN
        RAISE;
    END to_time;


    FUNCTION isNumber(p_val IN NUMBER) RETURN H$TYPE.num_t
    IS
       l_rtn_val H$TYPE.num_t  :=0;
    BEGIN

       RETURN p_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isNumber;
    
    FUNCTION isNumber(p_val IN DATE) RETURN H$TYPE.num_t
    IS
       l_rtn_val H$TYPE.num_t  :=0;
    BEGIN

       RETURN l_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isNumber;
    
    FUNCTION isNumber(p_val IN CLOB) RETURN H$TYPE.num_t
    IS
       l_rtn_val H$TYPE.num_t  :=0;
    BEGIN

       RETURN l_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isNumber;
    
    FUNCTION isNumber(p_val IN VARCHAR2) RETURN H$TYPE.num_t
    IS
       l_rtn_val H$TYPE.num_t  :=0;
       dummy  H$TYPE.num_t;
    BEGIN
    
       BEGIN
       
        SELECT TO_NUMBER(p_val) INTO dummy FROM DUAL;
       
       EXCEPTION     
       WHEN OTHERS THEN
         RAISE H$EXECEPTIONS.X_CASE;
       END;

       RETURN dummy;
           
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_CASE THEN
        RETURN l_rtn_val;
     WHEN OTHERS THEN
        RAISE;    
    END isNumber;
    
    FUNCTION isNumber2(p_val IN NUMBER,p_rtn_val IN NUMBER) RETURN H$TYPE.num_t
    IS
    BEGIN

       RETURN p_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isNumber2;
    
    
    FUNCTION isNumber2(p_val IN DATE,p_rtn_val IN NUMBER) RETURN H$TYPE.num_t
    IS
    BEGIN

       RETURN p_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isNumber2;
    
    FUNCTION isNumber2(p_val IN VARCHAR2,p_rtn_val IN NUMBER) RETURN H$TYPE.num_t
    IS
       dummy  H$TYPE.num_t;
    BEGIN
    
       BEGIN
       
        SELECT TO_NUMBER(p_val) INTO dummy FROM DUAL;
       
       EXCEPTION     
       WHEN OTHERS THEN
         RAISE H$EXECEPTIONS.X_CASE;
       END;

       RETURN dummy;
           
    EXCEPTION     
     WHEN H$EXECEPTIONS.X_CASE THEN
        RETURN p_rtn_val;    
     WHEN OTHERS THEN
        RAISE;    
    END isNumber2;
    
    FUNCTION isNumber2(p_val IN CLOB,p_rtn_val IN NUMBER) RETURN H$TYPE.num_t
    IS
    BEGIN

       RETURN p_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isNumber2;
    
    
    
    FUNCTION isString(p_val IN VARCHAR2) RETURN H$TYPE.var_t
    IS
       l_rtn_val H$TYPE.var_t  :='';
    BEGIN

       RETURN p_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isString;
    
    FUNCTION isString(p_val IN DATE) RETURN H$TYPE.var_t
    IS
       l_rtn_val H$TYPE.var_t  :='';
    BEGIN

       RETURN l_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isString;
    

    
    FUNCTION isString(p_val IN NUMBER) RETURN H$TYPE.var_t
    IS
       l_rtn_val H$TYPE.var_t  :='';
    BEGIN
    
     RETURN l_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isString;
    
    FUNCTION isString2(p_val IN VARCHAR2,p_rtn_val IN VARCHAR2) RETURN H$TYPE.var_t
    IS
    BEGIN

       RETURN p_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isString2;
    
    
    FUNCTION isString2(p_val IN DATE,p_rtn_val IN VARCHAR2) RETURN H$TYPE.var_t
    IS
    BEGIN

       RETURN p_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isString2;
    
    FUNCTION isString2(p_val IN NUMBER,p_rtn_val IN VARCHAR2) RETURN H$TYPE.var_t
    IS
    BEGIN
    
       RETURN p_rtn_val;
           
    EXCEPTION       
     WHEN OTHERS THEN
        RAISE;    
    END isString2;
    
    
    FUNCTION isDate(p_val IN VARCHAR2) RETURN H$TYPE.date_t
    IS
       l_rtn_val H$TYPE.date_t;
    BEGIN

       RETURN l_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isDate;
    
    FUNCTION isDate(p_val IN DATE) RETURN H$TYPE.date_t
    IS
    BEGIN

       RETURN p_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isDate;
    

    
    FUNCTION isDate(p_val IN NUMBER) RETURN H$TYPE.date_t
    IS
       l_rtn_val H$TYPE.date_t;
    BEGIN
    
     RETURN l_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isDate;
    
    
    FUNCTION isDate(p_val IN CLOB) RETURN H$TYPE.date_t
    IS
       l_rtn_val H$TYPE.date_t;
    BEGIN
    
     RETURN l_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isDate;
    
    FUNCTION isDate2(p_val IN VARCHAR2,p_rtn_val IN DATE) RETURN H$TYPE.date_t
    IS
    BEGIN

       RETURN p_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isDate2;
    
    FUNCTION isDate2(p_val IN CLOB,p_rtn_val IN DATE) RETURN H$TYPE.date_t
    IS
    BEGIN

       RETURN p_rtn_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isDate2;
    
    
    FUNCTION isDate2(p_val IN DATE,p_rtn_val IN DATE) RETURN H$TYPE.date_t
    IS
    BEGIN

       RETURN p_val;
           
    EXCEPTION     
     WHEN OTHERS THEN
        RAISE;    
    END isDate2;
    
    FUNCTION isDate2(p_val IN NUMBER,p_rtn_val IN DATE) RETURN H$TYPE.date_t
    IS
    BEGIN
    
       RETURN p_rtn_val;
           
    EXCEPTION       
     WHEN OTHERS THEN
        RAISE;    
    END isDate2;
    
    
    FUNCTION to_stmt(p_str in varchar2,prefix in varchar2) return h$type.var_t
    IS
     l_prefix    h$type.var_t;
     l_rtn_val       h$type.var_t;
     l_postfix   h$type.var_t;
    BEGIN
    
       l_prefix  := prefix||'='||prefix||'+'' ';
       l_postfix := ''';'; 
    
       l_rtn_val := prefix||'='''||replace (replace(p_str,'''',''''''), chr(10),l_postfix||chr(10)||l_prefix);
       
       l_rtn_val := l_rtn_val ||l_postfix;
       
       return l_rtn_val;
    
    END to_stmt;
    
    FUNCTION to_stmt2(p_str in varchar2,prefix in varchar2) return h$type.var_t
    IS
     l_prefix    h$type.var_t;
     l_rtn_val       h$type.var_t;
     l_postfix   h$type.var_t;
    BEGIN
    
       l_prefix  := prefix||':='||prefix||'||'' ';
       l_postfix := ''';'; 
    
       l_rtn_val := prefix||':='''||replace (replace(p_str,'''',''''''), chr(10),l_postfix||chr(10)||l_prefix);
       
       l_rtn_val := l_rtn_val ||l_postfix;
       
       return l_rtn_val;
    
    END to_stmt2;
    
    FUNCTION to_trans(p_num in number) return h$type.var_t
    IS
     l_rtn_value h$type.var_t;
    BEGIN
     -- 1K : 1000
     -- 1M : 1000*1000
     -- 1B : 1000*1000*1000
       IF p_num < 1000 THEN
          l_rtn_value := to_char(p_num);
       ELSIF p_num < 1000*1000 THEN
          l_rtn_value := trunc(p_num/1000,1)||'K';
       ELSIF p_num < 1000*1000*1000 THEN
          l_rtn_value := trunc(p_num/(1000*1000),1)||'M';
       ELSE
          l_rtn_value := trunc(p_num/(1000*1000*1000),1)||'B';
       END IF;
    
       return l_rtn_value;
       
    END to_trans;   
    
    FUNCTION to_trans(p_base in date,p_posting in date) return h$type.var_t
    IS
     l_rtn_value h$type.var_t;
     l_diff      h$type.num_t;
     l_time      h$type.var_t;
    BEGIN
    
        
       l_time := to_char(p_posting,' PM HH:MI:SS');
    
       IF p_posting > p_base THEN
         -- future
         l_rtn_value := l_rtn_value;
       
       ELSE
         -- past
         l_diff := (p_base - p_posting)*24*60;
         
         IF l_diff < 1 THEN
            l_rtn_value := 'now';         
         ELSIF l_diff < 60 THEN
            l_rtn_value := trunc(l_diff)||' minutes ago'||l_time;         
         ELSIF l_diff < 60*24 THEN
            l_rtn_value := trunc(l_diff/(60))||' hours ago'||l_time;
         ELSIF l_diff < 60*24*7 THEN
            l_rtn_value := trunc(l_diff/(60*24))||' days ago'||l_time;   
         ELSIF l_diff < 60*24*(7*4) THEN
            l_rtn_value := trunc(l_diff/(60*24*7))||' weeks ago'||l_time;   
         ELSIF l_diff < 60*24*365 THEN
            l_rtn_value := trunc(months_between(p_base,p_posting))||' months ago'||l_time;
         ELSE
            l_rtn_value := trunc((p_base - p_posting)/365)||' years ago'||l_time;                  
         END IF;
       
       
       END IF;
      
       return l_rtn_value;   
       
    END to_trans; 
    
    
    
    FUNCTION isChar(p_str IN VARCHAR2,p_key IN VARCHAR2) RETURN H$TYPE.var_t
    IS
     l_english    H$TYPE.num_t :=0;
     l_korean     H$TYPE.num_t :=0;
     l_special    H$TYPE.num_t :=0;
     l_number     H$TYPE.num_t :=0;
     l_chinese    H$TYPE.num_t :=0;
     l_japanese   H$TYPE.num_t :=0;
     l_unknown    H$TYPE.num_t :=0;
     l_idx        H$TYPE.num_t :=1;
     l_sys_col    h$type.col_systme_rec_t;
     l_sys_rec    h$type.col_value_rec_t10;
     l_rtn_value  H$TYPE.var_t := null;
     l_chr        H$TYPE.var_t := '';
     l_max        H$TYPE.num_t := 0;
     notfound     BOOLEAN := FALSE;

    BEGIN
       
       -- if not define character, it return null value
       l_sys_col := H$CACHE.findSystemCache( h$constants.c_charset );
       
       l_max := l_sys_col.children.count;
       
    
       IF l_max > 0 and p_str is not null THEN
       
       
          FOR i in 1..length(substrb(p_str,1,4000)) loop
          
              l_chr := substr(p_str,i,1);
              l_idx := 1;
              
              notfound := TRUE;
              
              LOOP
               
                l_sys_rec := l_sys_col.children(l_idx);
                
                IF h$util.to_ascii(l_chr) = 9 or 
                   h$util.to_ascii(l_chr) = 10 or
                   h$util.to_ascii(l_chr) = 13 or                   
                   h$util.to_ascii(l_chr) = 32 THEN
                   l_idx := l_max + 1;
                   notfound := FALSE;
                ELSE
                
                    IF h$util.to_ascii(l_chr) >= to_number(l_sys_rec.valdata1) and
                       h$util.to_ascii(l_chr) <= to_number(l_sys_rec.valdata2) THEN
                       
                       l_idx := l_max + 1;
         
                       notfound := FALSE;
                       
                       IF l_sys_rec.valdata3 = h$constants.c_korean THEN
                          l_korean := l_korean + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_english THEN
                          l_english := l_english + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_chinese THEN
                          l_chinese := l_chinese + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_japanese THEN
                          l_japanese := l_japanese + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_special THEN
                          l_special := l_special + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_number THEN
                          l_number := l_number + 1;
                       ELSE
                          l_unknown := l_unknown + 1;
                       END IF;
                       
                    ELSE
                       l_idx := l_idx + 1;
                    END IF;
                END IF;
               
                 EXIT WHEN l_idx > l_max;    
              END LOOP;
              
              IF (notfound) THEN
                 l_unknown := l_unknown + 1;
              END IF;
              
              
           END LOOP;
               
       END IF;
       
       
       IF upper(p_key) = h$constants.c_korean   and l_korean > 0   THEN l_rtn_value := p_str; END IF;
       IF upper(p_key) = h$constants.c_chinese  and l_chinese > 0  THEN l_rtn_value := p_str; END IF;
       IF upper(p_key) = h$constants.c_japanese and l_japanese > 0 THEN l_rtn_value := p_str; END IF;
       IF upper(p_key) = h$constants.c_english  and l_english > 0  THEN l_rtn_value := p_str; END IF;
       
       IF upper(p_key) = h$constants.c_special  and l_special > 0  THEN l_rtn_value := p_str; END IF;
       IF upper(p_key) = h$constants.c_number   and l_number > 0   THEN l_rtn_value := p_str; END IF;
  
   
       return l_rtn_value;   
       
    END isChar;
    
    FUNCTION isChar(p_str IN VARCHAR2) RETURN hobjvalueset_t2
    IS
     l_english    H$TYPE.num_t :=0;
     l_korean     H$TYPE.num_t :=0;
     l_special    H$TYPE.num_t :=0;
     l_number     H$TYPE.num_t :=0;
     l_chinese    H$TYPE.num_t :=0;
     l_japanese   H$TYPE.num_t :=0;
     l_unknown    H$TYPE.num_t :=0;
     l_idx        H$TYPE.num_t :=1;
     l_sys_col    h$type.col_systme_rec_t;
     l_sys_rec    h$type.col_value_rec_t10;
     l_rtn_value  H$TYPE.var_t := null;
     l_chr        H$TYPE.var_t := '';
     l_max        H$TYPE.num_t := 0;
     idset        hobjvalueset_t2 := hobjvalueset_t2();
     notfound     BOOLEAN := FALSE;

    BEGIN
       
       -- if not define character, it return null value
       l_sys_col := H$CACHE.findSystemCache( h$constants.c_charset );
       
       l_max := l_sys_col.children.count;
       
    
       IF l_max > 0 and p_str is not null THEN
       
          FOR i in 1..length(substrb(p_str,1,4000)) loop
          
              l_chr := substr(p_str,i,1);
              l_idx := 1;
              
              notfound := TRUE;
              LOOP
               
                l_sys_rec := l_sys_col.children(l_idx);
                
                IF h$util.to_ascii(l_chr) = 9 or 
                   h$util.to_ascii(l_chr) = 10 or
                   h$util.to_ascii(l_chr) = 13 or                   
                   h$util.to_ascii(l_chr) = 32 THEN
                   l_idx := l_max + 1;
                   notfound := FALSE;
                ELSE
                
                    IF h$util.to_ascii(l_chr) >= to_number(l_sys_rec.valdata1) and
                       h$util.to_ascii(l_chr) <= to_number(l_sys_rec.valdata2) THEN
                       
                       l_idx := l_max + 1;
         
                       notfound := FALSE;
                       
                       IF l_sys_rec.valdata3 = h$constants.c_korean THEN
                          l_korean := l_korean + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_english THEN
                          l_english := l_english + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_chinese THEN
                          l_chinese := l_chinese + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_japanese THEN
                          l_japanese := l_japanese + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_special THEN
                          l_special := l_special + 1;
                       ELSIF l_sys_rec.valdata3 = h$constants.c_number THEN
                          l_number := l_number + 1;
                       ELSE
                          l_unknown := l_unknown + 1;
                       END IF;
                       
                    ELSE
                       l_idx := l_idx + 1;
                    END IF;
                END IF;
               
                 EXIT WHEN l_idx > l_max;    
              END LOOP;
              
              IF (notfound) THEN
                 l_unknown := l_unknown + 1;
              END IF;
              
           END LOOP;
       END IF;
       
       l_idx := 1;
       
       IF l_korean > 0 THEN
          idset.extend;
          idset(l_idx) := hobjvalue_t2(h$constants.c_korean,to_char(l_korean));
          l_idx := l_idx + 1;
       END IF;
       
       IF l_english > 0 THEN
          idset.extend;
          idset(l_idx) := hobjvalue_t2(h$constants.c_english,to_char(l_english));
          l_idx := l_idx + 1;
       END IF;
       
       IF l_chinese > 0 THEN
          idset.extend;
          idset(l_idx) := hobjvalue_t2(h$constants.c_chinese,to_char(l_chinese));
          l_idx := l_idx + 1;
       END IF;
       
       IF l_japanese > 0 THEN
          idset.extend;
          idset(l_idx) := hobjvalue_t2(h$constants.c_japanese,to_char(l_japanese));
          l_idx := l_idx + 1;
       END IF;
       
       IF l_special > 0 THEN
          idset.extend;
          idset(l_idx) := hobjvalue_t2(h$constants.c_special,to_char(l_special));
          l_idx := l_idx + 1;
       END IF;
       
       IF l_number > 0 THEN
          idset.extend;
          idset(l_idx) := hobjvalue_t2(h$constants.c_number,to_char(l_number));
          l_idx := l_idx + 1;
       END IF;
       
       IF l_unknown > 0 THEN
          idset.extend;
          idset(l_idx) := hobjvalue_t2(h$constants.c_unknown,to_char(l_unknown));
          l_idx := l_idx + 1;
       END IF;
                     
       return idset;    
       
    END isChar;
    
    FUNCTION add_tag(p_str in varchar2, p_start in varchar2, p_end in varchar2, p_prefix in varchar2, p_postfix in varchar2) RETURN H$TYPE.var_t
    IS
     l_idx        H$TYPE.num_t := 1;
     l_rtn_value  H$TYPE.var_t := null;
     l_chr        H$TYPE.var_t := '';
     l_max        H$TYPE.num_t := 0;
     l_found      BOOLEAN      := FALSE;
     l_tmp        H$TYPE.var_t := null;
     notfound     BOOLEAN      := FALSE;
    BEGIN
       
       notfound := notfound;
       
   /*
      FOR i in 1..length(substrb(p_str,1,4000)) loop
          
          l_chr := substr(p_str,i,1);
          
          IF (l_found) THEN
          
              IF l_chr = p_end THEN
              
                 l_rtn_value := l_tmp || p_postfix;
              
                 l_found := FALSE;   
                 l_tmp   := NULL;
              
              END IF;
          
          ELSE
          
              IF l_chr = p_start THEN
                 l_tmp = substr(l_rtn_value,1,i-1) || p_prefix;
              END IF;
          
          END IF;
          
          
         
          l_idx := 1;
              
          notfound := TRUE;
          LOOP
               
            l_sys_rec := l_sys_col.children(l_idx);
                
            IF h$util.to_ascii(l_chr) = 9 or 
               h$util.to_ascii(l_chr) = 10 or
               h$util.to_ascii(l_chr) = 13 or                   
               h$util.to_ascii(l_chr) = 32 THEN
               l_idx := l_max + 1;
               notfound := FALSE;
            ELSE
                
                IF h$util.to_ascii(l_chr) >= to_number(l_sys_rec.valdata1) and
                   h$util.to_ascii(l_chr) <= to_number(l_sys_rec.valdata2) THEN
                       
                   l_idx := l_max + 1;
         
                   notfound := FALSE;
                       
                   IF l_sys_rec.valdata3 = h$constants.c_korean THEN
                      l_korean := l_korean + 1;
                   ELSIF l_sys_rec.valdata3 = h$constants.c_english THEN
                      l_english := l_english + 1;
                   ELSIF l_sys_rec.valdata3 = h$constants.c_chinese THEN
                      l_chinese := l_chinese + 1;
                   ELSIF l_sys_rec.valdata3 = h$constants.c_japanese THEN
                      l_japanese := l_japanese + 1;
                   ELSIF l_sys_rec.valdata3 = h$constants.c_special THEN
                      l_special := l_special + 1;
                   ELSIF l_sys_rec.valdata3 = h$constants.c_number THEN
                      l_number := l_number + 1;
                   ELSE
                      l_unknown := l_unknown + 1;
                   END IF;
                       
                ELSE
                   l_idx := l_idx + 1;
                END IF;
            END IF;
               
             EXIT WHEN l_idx > l_max;    
          END LOOP;
              
          IF (notfound) THEN
             l_unknown := l_unknown + 1;
          END IF;
              
       END LOOP;

      
                     
       */
       return l_rtn_value;    
       
    EXCEPTION     
     WHEN OTHERS THEN
       RAISE;
    END add_tag;
    
    
END h$util;