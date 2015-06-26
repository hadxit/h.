
create or replace PACKAGE h$cache AS
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

    PROCEDURE addChildObject(p_col IN OUT h$type.col_value_t10,
                             p_key IN h$type.obj_key_t,
                             p_val1 IN h$type.obj_value_t, 
                             p_val2 IN h$type.obj_value_t);
                             
    PROCEDURE addChildObject(p_col IN OUT h$type.col_value_t10,
                             p_key IN h$type.obj_key_t,
                             p_val1 IN h$type.obj_value_t, 
                             p_val2 IN h$type.obj_value_t, 
                             p_val3 IN h$type.obj_value_t);

    PROCEDURE addSystemCache (p_rec IN h$type.col_systme_rec_t);
    FUNCTION  findSystemCache(p_classname IN h$type.class_name_t ) RETURN h$type.col_systme_rec_t;
    FUNCTION  getSystemCache (p_classname in h$type.class_name_t, p_key in h$type.obj_key_t) RETURN h$type.obj_value_t;
    
    PROCEDURE addCustomChildObject(p_classname IN h$type.class_name_t,
                                   keyset      IN OUT h$type.col_key_t,
                                   valset      IN OUT h$type.col_value_t10,
                                   p_key       IN h$type.obj_key_t, 
                                   p_val1      IN h$type.obj_value_t, 
                                   p_val2      IN h$type.obj_value_t, 
                                   p_val3      IN h$type.obj_value_t, 
                                   p_val4      IN h$type.obj_value_t, 
                                   p_val5      IN h$type.obj_value_t, 
                                   p_val6      IN h$type.obj_value_t, 
                                   p_val7      IN h$type.obj_value_t, 
                                   p_val8      IN h$type.obj_value_t, 
                                   p_val9      IN h$type.obj_value_t);
    PROCEDURE addCustomCache (p_rec IN h$type.col_custom_rec_t);
    FUNCTION  findCustomCache(p_classname IN h$type.class_name_t ) RETURN h$type.col_custom_rec_t;
   
    
    PROCEDURE cset (p_classname in h$type.class_name_t, 
                    p_key in h$type.obj_key_t,
                    p_val1 in h$type.obj_value_t,
                    p_val2 in h$type.obj_value_t,
                    p_val3 in h$type.obj_value_t,
                    p_val4 in h$type.obj_value_t,
                    p_val5 in h$type.obj_value_t,
                    p_val6 in h$type.obj_value_t,
                    p_val7 in h$type.obj_value_t,
                    p_val8 in h$type.obj_value_t,
                    p_val9 in h$type.obj_value_t);
   
    PROCEDURE cset   (p_classname in h$type.class_name_t,
                      p_val in h$type.obj_value_t);
                       
                    
    PROCEDURE cset (p_classname in h$type.class_name_t, 
                    p_key in h$type.int_t,
                    p_val1 in h$type.obj_value_t,
                    p_val2 in h$type.obj_value_t,
                    p_val3 in h$type.obj_value_t,
                    p_val4 in h$type.obj_value_t,
                    p_val5 in h$type.obj_value_t,
                    p_val6 in h$type.obj_value_t,
                    p_val7 in h$type.obj_value_t,
                    p_val8 in h$type.obj_value_t,
                    p_val9 in h$type.obj_value_t);   
 
    FUNCTION cset   (p_classname in h$type.class_name_t,
                      p_val in h$type.obj_value_t) RETURN h$type.var_t; 
                         
    
    FUNCTION cset (p_classname in h$type.class_name_t, 
                    p_key in h$type.obj_key_t,
                    p_val1 in h$type.obj_value_t,
                    p_val2 in h$type.obj_value_t,
                    p_val3 in h$type.obj_value_t,
                    p_val4 in h$type.obj_value_t,
                    p_val5 in h$type.obj_value_t,
                    p_val6 in h$type.obj_value_t,
                    p_val7 in h$type.obj_value_t,
                    p_val8 in h$type.obj_value_t,
                    p_val9 in h$type.obj_value_t) return h$type.var_t;    
   
   
   FUNCTION cset (p_classname in h$type.class_name_t, 
                   p_key in h$type.int_t,
                    p_val1 in h$type.obj_value_t,
                    p_val2 in h$type.obj_value_t,
                    p_val3 in h$type.obj_value_t,
                    p_val4 in h$type.obj_value_t,
                    p_val5 in h$type.obj_value_t,
                    p_val6 in h$type.obj_value_t,
                    p_val7 in h$type.obj_value_t,
                    p_val8 in h$type.obj_value_t,
                    p_val9 in h$type.obj_value_t) return h$type.var_t;    
 
    
    FUNCTION  count (p_classname in h$type.class_name_t) RETURN h$type.int_t;
    
    PROCEDURE remove (p_classname in h$type.class_name_t,p_key in h$type.int_t);
    PROCEDURE remove (p_classname in h$type.class_name_t, p_key in h$type.obj_key_t);
    PROCEDURE remove (p_classname in h$type.class_name_t);
    
    FUNCTION get(p_classname in h$type.class_name_t) RETURN hobjvalueset_t10;
    FUNCTION get(p_classname in h$type.class_name_t,p_key in h$type.obj_key_t) RETURN hobjvalueset_t10;  


END h$cache;
/

CREATE OR REPLACE PACKAGE BODY h$cache AS
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

   
   
   
 
    PROCEDURE addChildObject(p_col  IN OUT h$type.col_value_t10,
                             p_key  IN h$type.obj_key_t,
                             p_val1 IN h$type.obj_value_t, 
                             p_val2 IN h$type.obj_value_t)
    IS
      nullobj h$type.col_value_t10;
      newdata h$type.col_value_rec_t10;
    BEGIN
       
        newdata.valdata1   := p_val1;
        newdata.valdata2   := p_val2;
        p_col(p_key)       := newdata;
    
    END addChildObject;
    
    PROCEDURE addChildObject(p_col  IN OUT h$type.col_value_t10,
                             p_key  IN h$type.obj_key_t,
                             p_val1 IN h$type.obj_value_t, 
                             p_val2 IN h$type.obj_value_t,
                             p_val3 IN h$type.obj_value_t )
    IS
      nullobj h$type.col_value_t10;
      newdata h$type.col_value_rec_t10;
    BEGIN
       
        newdata.valdata1   := p_val1;
        newdata.valdata2   := p_val2;
        newdata.valdata3   := p_val3;
        
        p_col(p_key)       := newdata;
    
    END addChildObject;
    
    
    PROCEDURE addSystemCache(p_rec IN h$type.col_systme_rec_t) IS
       found   h$type.col_systme_rec_t;
       nothing BOOLEAN;
    BEGIN
    
      IF (p_rec.init) THEN
          found := findSystemCache(p_rec.className);
          IF found.init THEN
             RAISE h$execeptions.x_duplicate;
          END IF;
          dbms_output.put_line('class:'||p_rec.className);
          h$variables.c_all_sys_classes(p_rec.className) := p_rec;
      END IF;
   
    EXCEPTION
        WHEN h$execeptions.x_duplicate THEN
            raise;
        WHEN OTHERS THEN
            RAISE h$execeptions.x_init;    
    END addSystemCache;
    
    
    FUNCTION  findSystemCache( p_classname IN h$type.class_name_t ) RETURN h$type.col_systme_rec_t
    IS
        nullobj h$type.col_systme_rec_t;
    BEGIN
        RETURN h$variables.c_all_sys_classes(p_classname);
    EXCEPTION
        WHEN OTHERS THEN
            RETURN nullobj;
    END findSystemCache;   
    
    FUNCTION getSystemCache(p_classname in h$type.class_name_t, p_key in h$type.obj_key_t) RETURN h$type.obj_value_t
    IS
      l_sys_rec  h$type.col_value_rec_t10;
      l_sys_col  h$type.col_systme_rec_t;
      l_rtn_val   h$type.obj_value_t;
      
    BEGIN
       l_sys_col := findSystemCache(p_classname);
       IF (l_sys_col.init) THEN

          l_sys_rec := l_sys_col.children(p_key);
          l_rtn_val := l_sys_rec.valdata2;       
       
       END IF;
          
       RETURN l_rtn_val;
    
    END getSystemCache;
    
    
    
    PROCEDURE addCustomChildObject(p_classname IN h$type.class_name_t,
                                   keyset      IN OUT h$type.col_key_t,
                                   valset      IN OUT h$type.col_value_t10,
                                   p_key       IN h$type.obj_key_t, 
                                   p_val1      IN h$type.obj_value_t, 
                                   p_val2      IN h$type.obj_value_t, 
                                   p_val3      IN h$type.obj_value_t, 
                                   p_val4      IN h$type.obj_value_t, 
                                   p_val5      IN h$type.obj_value_t, 
                                   p_val6      IN h$type.obj_value_t, 
                                   p_val7      IN h$type.obj_value_t, 
                                   p_val8      IN h$type.obj_value_t, 
                                   p_val9      IN h$type.obj_value_t)
    IS
      nullobj h$type.col_value_t10;
      newdata h$type.col_value_rec_t10;
      idx     h$type.int_t; 
      l_key   h$type.obj_key_t;
    BEGIN
      
       idx := h$cache.count(p_classname) + 1;
        
       IF p_key IS NULL THEN 
         l_key := TO_CHAR(idx);  
       ELSE
         l_key := p_key; 
       END IF;
       
      DECLARE
        childobj  h$type.col_value_rec_t10;
      BEGIN
          /* check invalid key */
          childobj  := valset(l_key);
            
          newdata.valdata1   := l_key;
          newdata.valdata2   := p_val1;
          newdata.valdata3   := p_val2;
          newdata.valdata4   := p_val3;
          newdata.valdata5   := p_val4;
          newdata.valdata6   := p_val5;
          newdata.valdata7   := p_val6;
          newdata.valdata8   := p_val7;
          newdata.valdata9   := p_val8;
          newdata.valdata10  := p_val9;
              
          valset(l_key)      := newdata;

      EXCEPTION
       WHEN OTHERS THEN
          -- exception when there is no exists childobject with specified key
          newdata.valdata1   := l_key;
          newdata.valdata2   := p_val1;
          newdata.valdata3   := p_val2;
          newdata.valdata4   := p_val3;
          newdata.valdata5   := p_val4;
          newdata.valdata6   := p_val5;
          newdata.valdata7   := p_val6;
          newdata.valdata8   := p_val7;
          newdata.valdata9   := p_val8;
          newdata.valdata10  := p_val9;
          valset(l_key)      := newdata;  
          keyset(idx)        := l_key;            
      END;
      
    END addCustomChildObject;
    

    
    PROCEDURE addCustomCache(p_rec IN h$type.col_custom_rec_t)
    IS
    BEGIN
    
        h$variables.c_all_custom_classes(p_rec.className) := p_rec;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE;   
    END addCustomCache;
    
    
    FUNCTION  findCustomCache( p_classname IN h$type.class_name_t ) RETURN h$type.col_custom_rec_t
    IS
        nullobj h$type.col_custom_rec_t;
    BEGIN
        RETURN h$variables.c_all_custom_classes(p_classname);
    EXCEPTION
        WHEN OTHERS THEN
            RETURN nullobj;
    END findCustomCache;
      
   
    
    PROCEDURE cset (p_classname in h$type.class_name_t, 
                    p_key in h$type.obj_key_t,
                    p_val1 in h$type.obj_value_t,
                    p_val2 in h$type.obj_value_t,
                    p_val3 in h$type.obj_value_t,
                    p_val4 in h$type.obj_value_t,
                    p_val5 in h$type.obj_value_t,
                    p_val6 in h$type.obj_value_t,
                    p_val7 in h$type.obj_value_t,
                    p_val8 in h$type.obj_value_t,
                    p_val9 in h$type.obj_value_t)
    IS
      childobjset   h$type.col_value_t10; 
      keyobjset     h$type.col_key_t;
      obj           h$type.col_custom_rec_t;
      nullobj       h$type.col_value_rec_t10;
    BEGIN
       
       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          childobjset := obj.children;  
          keyobjset   := obj.keyset;
       
       ELSE
          
          obj.init      := TRUE;
          obj.depths    := 1;
          obj.className := p_classname;
       
       END IF;
          
       addCustomChildObject(p_classname,keyobjset,childobjset,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,p_val9);     

       obj.children := childobjset;
       obj.keyset   := keyobjset;
           
       addCustomCache(obj); 
    
    END cset;
    
    FUNCTION cset (p_classname in h$type.class_name_t, 
                    p_key in h$type.obj_key_t,
                    p_val1 in h$type.obj_value_t,
                    p_val2 in h$type.obj_value_t,
                    p_val3 in h$type.obj_value_t,
                    p_val4 in h$type.obj_value_t,
                    p_val5 in h$type.obj_value_t,
                    p_val6 in h$type.obj_value_t,
                    p_val7 in h$type.obj_value_t,
                    p_val8 in h$type.obj_value_t,
                    p_val9 in h$type.obj_value_t) return h$type.var_t
    IS
      childobjset   h$type.col_value_t10; 
      keyobjset     h$type.col_key_t;
      obj           h$type.col_custom_rec_t;
      nullobj       h$type.col_value_rec_t10;
      l_rtn         h$type.var_t := '0';
    BEGIN
       
       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          childobjset := obj.children;  
          keyobjset   := obj.keyset;
       
       ELSE
          
          obj.init      := TRUE;
          obj.depths    := 1;
          obj.className := p_classname;
       
       END IF;
          
       addCustomChildObject(p_classname,keyobjset,childobjset,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,p_val9);     

       obj.children := childobjset;
       obj.keyset   := keyobjset;
           
       addCustomCache(obj);

       return l_rtn;
       
    EXCEPTION
       WHEN OTHERS THEN
         return '1';      
    END cset;
    
    
    PROCEDURE cset (p_classname in h$type.class_name_t, p_key in h$type.int_t,
                    p_val1 in h$type.obj_value_t,
                    p_val2 in h$type.obj_value_t,
                    p_val3 in h$type.obj_value_t,
                    p_val4 in h$type.obj_value_t,
                    p_val5 in h$type.obj_value_t,
                    p_val6 in h$type.obj_value_t,
                    p_val7 in h$type.obj_value_t,
                    p_val8 in h$type.obj_value_t,
                    p_val9 in h$type.obj_value_t)
    IS
      childobjset   h$type.col_value_t10; 
      keyobjset     h$type.col_key_t;
      obj           h$type.col_custom_rec_t;
      nullobj       h$type.col_value_rec_t10;
    BEGIN
       
       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          childobjset := obj.children;  
          keyobjset   := obj.keyset;
       
       ELSE
          
          obj.init      := TRUE;
          obj.depths    := 1;
          obj.className := p_classname;
       
       END IF;
           
       addCustomChildObject(p_classname,keyobjset,childobjset,TO_CHAR(p_key),p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,p_val9);    

       obj.children := childobjset;
       obj.keyset   := keyobjset;
           
       addCustomCache(obj); 
    
    END cset;
    
    FUNCTION cset (p_classname in h$type.class_name_t, p_key in h$type.int_t,
                    p_val1 in h$type.obj_value_t,
                    p_val2 in h$type.obj_value_t,
                    p_val3 in h$type.obj_value_t,
                    p_val4 in h$type.obj_value_t,
                    p_val5 in h$type.obj_value_t,
                    p_val6 in h$type.obj_value_t,
                    p_val7 in h$type.obj_value_t,
                    p_val8 in h$type.obj_value_t,
                    p_val9 in h$type.obj_value_t) return h$type.var_t
    IS
      childobjset   h$type.col_value_t10; 
      keyobjset     h$type.col_key_t;
      obj           h$type.col_custom_rec_t;
      nullobj       h$type.col_value_rec_t10;
      l_rtn         h$type.var_t := '0';
    BEGIN
       
       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          childobjset := obj.children;  
          keyobjset   := obj.keyset;
       
       ELSE
          
          obj.init      := TRUE;
          obj.depths    := 1;
          obj.className := p_classname;
       
       END IF;
          
       addCustomChildObject(p_classname,keyobjset,childobjset,TO_CHAR(p_key),p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,p_val9);       

       obj.children := childobjset;
       obj.keyset   := keyobjset;
           
       addCustomCache(obj); 
       return l_rtn;
    EXCEPTION
       WHEN OTHERS THEN
         return '1';  
    END cset;
    
    PROCEDURE cset (p_classname in h$type.class_name_t,p_val in h$type.obj_value_t)
    IS
      childobjset   h$type.col_value_t10; 
      keyobjset     h$type.col_key_t;
      obj           h$type.col_custom_rec_t;
    BEGIN
         
       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          childobjset := obj.children;  
          keyobjset   := obj.keyset;
       
       ELSE
          
          obj.init      := TRUE;
          obj.depths    := 1;
          obj.className := p_classname;
       
       END IF;
       
       addCustomChildObject(p_classname,keyobjset,childobjset,NULL,p_val,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);  

       obj.children := childobjset;
       obj.keyset   := keyobjset;
           
       addCustomCache(obj); 
    
    END cset;
    
    
    
    
    FUNCTION cset (p_classname in h$type.class_name_t,p_val in h$type.obj_value_t) RETURN h$type.var_t
    IS
      childobjset   h$type.col_value_t10; 
      keyobjset     h$type.col_key_t;
      obj           h$type.col_custom_rec_t;
      l_rtn         h$type.var_t := '0';
    BEGIN
          
       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          childobjset := obj.children;  
          keyobjset   := obj.keyset;
       
       ELSE
          
          obj.init      := TRUE;
          obj.depths    := 1;
          obj.className := p_classname;
       
       END IF;
       
       addCustomChildObject(p_classname,keyobjset,childobjset,NULL,p_val,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);   

       obj.children := childobjset;
       obj.keyset   := keyobjset;
           
       addCustomCache(obj); 
       
       return l_rtn;
    EXCEPTION
       WHEN OTHERS THEN
         return '1';    
    END cset;
    
    /*
    
    PROCEDURE set (p_classname in h$type.class_name_t,p_key in h$type.int_t,p_val in h$type.obj_value_t)
    IS
      l_cus_col   h$type.col_value_t10; 
      obj         h$type.col_custom_rec_t;
    BEGIN
       
       obj.init      := TRUE;
       obj.depths    := 1;
       obj.className := p_classname;
           
       l_cus_col := getCustomCache(p_classname);

       -- key is c_cc
       h$cache.addCustomChildObject(l_cus_col,to_char(p_key),to_char(p_key),p_val);  
             

       obj.children := l_cus_col;
           
       h$cache.addCustomCache(obj);     
    
    END set;
    */
    
    FUNCTION count (p_classname in h$type.class_name_t) RETURN h$type.int_t
    IS
       keyobjset   h$type.col_key_t; 
       childobjset h$type.col_value_t10;
       idx         h$type.int_t :=1;
       obj         h$type.col_custom_rec_t;
       l_count     h$type.int_t:=0;
       l_key       h$type.obj_key_t;
    BEGIN  

       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          keyobjset   := obj.keyset;
          childobjset := obj.children;
       
       
           FOR idx IN keyobjset.FIRST..keyobjset.LAST LOOP
           
               l_key := keyobjset(idx);
               
               BEGIN
               
                 IF (childobjset(l_key).valdata1 is not null or childobjset(l_key).valdata1 != '') THEN
                     l_count := l_count + 1;
                 END IF;
               EXCEPTION
                WHEN OTHERS THEN
                   l_count := l_count;--nothing
               END;
               

           END LOOP;
       
       
       END IF;
       
       
       return l_count;
    
    END count;
      
    
    PROCEDURE remove (p_classname in h$type.class_name_t,p_key in h$type.int_t)
    IS
      obj         h$type.col_custom_rec_t;
      nullobj     h$type.col_value_rec_t10;
      l_count     h$type.int_t:=1;
      l_key       h$type.obj_key_t;
    BEGIN
       
       obj := findCustomCache(p_classname);
         
       FOR idx IN obj.keyset.FIRST..obj.keyset.LAST LOOP
       
           l_key := obj.keyset(idx);
         --  dbms_output.put_line('idx : '||to_char(idx)||' Key : '||l_key||' count:'||to_char(l_count)||' p_key:'||to_char(p_key)||' valdata'||obj.children(l_key).valdata1);
           BEGIN
          
             IF (obj.children(l_key).valdata1 is not null) THEN
                 
                 IF l_count >= p_key  THEN
           --         dbms_output.put_line(obj.children(TO_CHAR(l_count)).valdata1||','||obj.children(TO_CHAR(l_count)).valdata2);
                   BEGIN
                     obj.children(TO_CHAR(l_count)) := obj.children(TO_CHAR(l_count+1)) ;
                   EXCEPTION
                    WHEN OTHERS THEN
                     obj.children(TO_CHAR(l_count)) := nullobj;
                   END;
                 END IF;
                l_count := l_count + 1;
             END IF;
           EXCEPTION
            WHEN OTHERS THEN
               l_count := l_count;--nothing
           END;
           

       END LOOP;
       
       obj.children(TO_CHAR(obj.children.count)) := nullobj;
       --obj.keyset(TO_CHAR(p_key)) := NULL;
       -- Number cace collection need to be shift according to remove number index key
       addCustomCache(obj);    
    
    END remove;
    
    PROCEDURE remove (p_classname in h$type.class_name_t, p_key in h$type.obj_key_t)
    IS
      obj        h$type.col_custom_rec_t;
      nullobj    h$type.col_value_rec_t10;
    BEGIN

       obj := findCustomCache(p_classname);
       obj.children(p_key) := nullobj;
     --  obj.keyset(p_key)   := NULL;
       addCustomCache(obj);
       -- do not need initialize childobject set value.
       -- Constructor initial value is null
  
    END remove;
    
    PROCEDURE remove (p_classname in h$type.class_name_t)
    IS
      nullobj    h$type.col_custom_rec_t;
    BEGIN    
       -- clear all data with class
       -- Class Type initial value of INIT parameter is FALSE.
       -- do not need to be initialize.
       h$variables.c_all_custom_classes(p_classname) := nullobj;
    END remove;
    
    
    FUNCTION get(p_classname in h$type.class_name_t,p_key in h$type.obj_key_t) RETURN hobjvalueset_t10
    IS
     idset     hobjvalueset_t10 := hobjvalueset_t10();
     obj       h$type.col_custom_rec_t;
     nullobj   h$type.col_value_rec_t10;
     l_value1  h$type.obj_value_t;
     l_value2  h$type.obj_value_t;
     l_value3  h$type.obj_value_t;
     l_value4  h$type.obj_value_t;
     l_value5  h$type.obj_value_t;
     l_value6  h$type.obj_value_t;
     l_value7  h$type.obj_value_t;
     l_value8  h$type.obj_value_t;
     l_value9  h$type.obj_value_t;
     l_key     h$type.obj_key_t;
    BEGIN
    
       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          l_key    := obj.children(p_key).valdata1;
          l_value1 := obj.children(p_key).valdata2; 
          l_value2 := obj.children(p_key).valdata3;
          l_value3 := obj.children(p_key).valdata4;
          l_value4 := obj.children(p_key).valdata5;
          l_value5 := obj.children(p_key).valdata6;
          l_value6 := obj.children(p_key).valdata7;
          l_value7 := obj.children(p_key).valdata8;
          l_value8 := obj.children(p_key).valdata9;
          l_value9 := obj.children(p_key).valdata10;    
       
       END IF;
       
       IF l_key is not null THEN
          idset.extend;
          idset(1) := hobjvalue_t10(l_key,l_value1,l_value2,l_value3,l_value4,l_value5,l_value6,l_value7,l_value8,l_value9);
       END IF;
       
       return idset;    
    
    END get;
    
    FUNCTION get(p_classname in h$type.class_name_t) RETURN hobjvalueset_t10
    IS
     idset       hobjvalueset_t10 := hobjvalueset_t10();
     obj         h$type.col_custom_rec_t;
     nullobj     h$type.col_value_rec_t10;
     l_value1    h$type.obj_value_t;
     l_value2    h$type.obj_value_t;
     l_value3    h$type.obj_value_t;
     l_value4    h$type.obj_value_t;
     l_value5    h$type.obj_value_t;
     l_value6    h$type.obj_value_t;
     l_value7    h$type.obj_value_t;
     l_value8    h$type.obj_value_t;
     l_value9    h$type.obj_value_t;
     childobjset h$type.col_value_t10; 
     keyobjset   h$type.col_key_t;
     l_key       h$type.obj_key_t;
     l_key2      h$type.obj_key_t;     
     l_id        H$TYPE.int_t    := 1;
    BEGIN
    
       obj := findCustomCache(p_classname);
       IF (obj.init) THEN

          keyobjset   := obj.keyset;
          childobjset := obj.children;  
            
       
           FOR i IN keyobjset.FIRST..keyobjset.LAST LOOP
           
               l_key  := keyobjset(i);
               l_key2 := childobjset(l_key).valdata1;
               
               IF l_key2 IS NOT NULL THEN
                  
                  l_value1 := childobjset(l_key).valdata2;
                  l_value2 := childobjset(l_key).valdata3;
                  l_value3 := childobjset(l_key).valdata4;
                  l_value4 := childobjset(l_key).valdata5;
                  l_value5 := childobjset(l_key).valdata6;
                  l_value6 := childobjset(l_key).valdata7;
                  l_value7 := childobjset(l_key).valdata8;
                  l_value8 := childobjset(l_key).valdata9;
                  l_value9 := childobjset(l_key).valdata10;
               
                  idset.extend;
                  idset(l_id) := hobjvalue_t10(l_key,l_value1,l_value2,l_value3,l_value4,l_value5,l_value6,l_value7,l_value8,l_value9);
                  l_id := l_id + 1;
                
              END IF;
           
           END LOOP;
       
       END IF;
       
       return idset;    
    
    END get;
    
END h$cache;
/
