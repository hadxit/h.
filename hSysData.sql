
create or replace PACKAGE h$data AS
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
     
    PROCEDURE loadSystemCache;
    PROCEDURE loadSystemCache_length;
    PROCEDURE loadSystemCache_width;
    PROCEDURE loadSystemCache_weight;
    PROCEDURE loadSystemCache_volume;
    PROCEDURE loadSystemCache_heat;
    PROCEDURE loadSystemCache_pressure;
    PROCEDURE loadSystemCache_speed;
    PROCEDURE loadSystemCache_data;
    PROCEDURE loadSystemCache_time;  
    
    PROCEDURE loadSystemCache_charset;                  

END h$data;
/

CREATE OR REPLACE PACKAGE BODY h$data AS
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

    PROCEDURE loadSystemCache IS
    BEGIN
     
      loadSystemCache_length;
      loadSystemCache_width;
      loadSystemCache_weight;
      loadSystemCache_volume;
      loadSystemCache_heat;
      loadSystemCache_pressure;
      loadSystemCache_speed;
      loadSystemCache_data;
      loadSystemCache_time;  
      
      loadSystemCache_charset;
    END loadSystemCache;
    
    PROCEDURE loadSystemCache_charset 
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_charset;
   
       
       h$cache.addChildObject(l_sys_col,'1','1','47',h$constants.c_special);
       h$cache.addChildObject(l_sys_col,'2','48','57',h$constants.c_number);       
       h$cache.addChildObject(l_sys_col,'3','58','64',h$constants.c_special);       
       h$cache.addChildObject(l_sys_col,'4','65','90',h$constants.c_english);       
       h$cache.addChildObject(l_sys_col,'5','91','96',h$constants.c_special);       
       h$cache.addChildObject(l_sys_col,'6','97','122',h$constants.c_english);       
       h$cache.addChildObject(l_sys_col,'7','123','126',h$constants.c_special);       
       
       h$cache.addChildObject(l_sys_col,'8','14909825','14909887',h$constants.c_japanese);       
       h$cache.addChildObject(l_sys_col,'9','14910080','14910102',h$constants.c_japanese);       
       h$cache.addChildObject(l_sys_col,'10','14910111','14910143',h$constants.c_japanese);       
       h$cache.addChildObject(l_sys_col,'11','14910336','14910399',h$constants.c_japanese);       
       h$cache.addChildObject(l_sys_col,'12','14910597','14910633',h$constants.c_japanese);   
   
       h$cache.addChildObject(l_sys_col,'13','14910641','14910655',h$constants.c_korean);
       h$cache.addChildObject(l_sys_col,'14','14910848','14910910',h$constants.c_korean);
       h$cache.addChildObject(l_sys_col,'15','14911106','14911116',h$constants.c_korean);
       
       h$cache.addChildObject(l_sys_col,'16','14911122','14911135',h$constants.c_chinese);
       h$cache.addChildObject(l_sys_col,'17','14911360','14911375',h$constants.c_chinese);
       h$cache.addChildObject(l_sys_col,'18','14911408','14911423',h$constants.c_chinese);     
       
       h$cache.addChildObject(l_sys_col,'19','14911616','14911644',h$constants.c_korean);

       h$cache.addChildObject(l_sys_col,'20','14911648','14911875',h$constants.c_chinese); 

       h$cache.addChildObject(l_sys_col,'21','14911904','14911931',h$constants.c_korean);

       h$cache.addChildObject(l_sys_col,'22','14912128','14912177',h$constants.c_chinese);
       h$cache.addChildObject(l_sys_col,'23','14912384','14912395',h$constants.c_chinese);
       h$cache.addChildObject(l_sys_col,'24','14912400','14912919',h$constants.c_chinese);
       h$cache.addChildObject(l_sys_col,'25','14912955','14912959',h$constants.c_chinese);
       h$cache.addChildObject(l_sys_col,'26','14913440','14988981',h$constants.c_chinese);  
       h$cache.addChildObject(l_sys_col,'27','14989440','15318715',h$constants.c_chinese);

       h$cache.addChildObject(l_sys_col,'28','15380608','15572643',h$constants.c_korean);

       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    EXCEPTION
        WHEN OTHERS THEN
          raise_application_error(-20001,'Undefined error occured in loadSystemCache_length');
    END loadSystemCache_charset;
    
    PROCEDURE loadSystemCache_length 
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_length;
       
       -- Key is c_mile_t
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mm),'1','1609344');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_cm),'2','160934.4');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_m),'3','1609.344');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_km),'4','1.609344');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_in),'5','63360');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_ft),'6','5280');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_yd),'7','1760');   
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mile),'8','1');             

       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    END loadSystemCache_length;
    
    PROCEDURE loadSystemCache_weight
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_weight;
       
       -- Key is c_t
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mg),'1','1000000000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_gr),'2','15432358.4');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_g) ,'3','1000000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_oz),'4','35273.9619');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_lb),'5','2204.62262');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_kg),'6','1000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_t), '7','1');   
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_kt),'8','0.001');             

       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    END loadSystemCache_weight;
     

    PROCEDURE loadSystemCache_width
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_width;

       -- key is c_km2
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_ft2),'1','10763910.4');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_yd2),'2','1195990.05');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_m2), '3','1000000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_p),  '4','302500');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_a),  '5','10000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_ac), '6','247.105381');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_ha), '7','100');        
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_km2),'8','1');      

       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    

    END loadSystemCache_width;
   
    PROCEDURE loadSystemCache_volume
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_volume;

       -- key is c_cc
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_cc), '1','764554.858');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_ml) ,'2','764554.858');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_cm3),'3','764554.858');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_in3),'4','46656');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_oz), '5','25852.6749');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_dl), '6','7645.54858');        
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_l),  '7','764.554858');    
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_gal),'8','201.974026');    
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_ft3),'9','27');    
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_bbl),  '10','4.811547');    
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_yd3),'11','1');    
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_m3) ,'12','0.764555');    
         

       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    EXCEPTION
        WHEN OTHERS THEN
            RAISE h$execeptions.x_init; 
    END loadSystemCache_volume;

    PROCEDURE loadSystemCache_heat
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_heat;

       -- key is c_c
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_k), '1','274.15');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_f) ,'2','33.8');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_c) ,'3','1');


       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    EXCEPTION
        WHEN OTHERS THEN
            RAISE h$execeptions.x_init; 
    END loadSystemCache_heat;

    PROCEDURE loadSystemCache_pressure
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_pressure;

       -- key is c_mpa
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_dyne)   ,'1','10000000'); 
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_pa)     ,'2','1000000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mmh2o)  ,'3','101971.626');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_hpa)    ,'4','10000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mb)     ,'5','10000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mmhg)   ,'6','7500.61683');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_inchh2o),'7','4014.62805');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_kpa)    ,'8','1000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_inchhg) ,'9','295.299875');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_psi)   ,'10','145.038243');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_kgf)   ,'11','10.1971626');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_bar)   ,'12','10');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_atm)   ,'13','9.869233');       
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mpa)   ,'14','1');
 

       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    EXCEPTION
        WHEN OTHERS THEN
            RAISE h$execeptions.x_init; 
    END loadSystemCache_pressure;
    
    PROCEDURE loadSystemCache_speed
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_speed;

       -- key is c_mi_s
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_in_h)   ,'1','228096000'); 
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_ft_h)   ,'2','19008000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_m_h)    ,'3','5793638.4');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_in_s)   ,'4','63360');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_km_h)   ,'5','5793.6384');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_ft_s)   ,'6','5280');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mi_h)   ,'7','3600');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_kn)     ,'8','3128.31447');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_m_s)    ,'9','1609.344');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mach)  ,'10','4.733365');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_km_s)  ,'11','1.609344');   
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mi_s)  ,'12','1');
 

       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    EXCEPTION
        WHEN OTHERS THEN
            RAISE h$execeptions.x_init; 
    END loadSystemCache_speed;

    PROCEDURE loadSystemCache_data
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_data;
       
       -- key is c_eb
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_bit) ,'1','9223372036854780000'); 
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_b)   ,'2','1152921504606850000');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_kb)  ,'3','1125899906842620');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_mb)  ,'4','1099511627776');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_gb)  ,'5','1073741824');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_tb)  ,'6','1048576');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_pb)  ,'7','1024');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_eb)  ,'8','1');


       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    EXCEPTION
        WHEN OTHERS THEN
            RAISE h$execeptions.x_init; 
    END loadSystemCache_data;

    PROCEDURE loadSystemCache_time
    IS
      l_sys_col  h$type.col_value_t10;
      obj        h$type.col_systme_rec_t;
    BEGIN
          
       obj.init   := TRUE;
       obj.depths := 1;
       obj.className := h$constants.c_time;
      
       -- key is c_DD
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_SS) ,'1','86400'); 
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_MI) ,'2','1440');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_HH) ,'3','24');
       h$cache.addChildObject(l_sys_col,upper(h$constants.c_DD) ,'4','1');


       obj.children := l_sys_col;
       
       h$cache.addSystemCache(obj); 
    
    EXCEPTION
        WHEN OTHERS THEN
            RAISE h$execeptions.x_init; 
    END loadSystemCache_time;
    
     
   
    
    
END h$data;
/
