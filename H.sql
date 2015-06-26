CREATE OR REPLACE PACKAGE h
AS
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

   /* CONSTANTS FUNCTION */
   --length
   FUNCTION c_mm   RETURN VARCHAR2;
   FUNCTION c_cm   RETURN VARCHAR2;
   FUNCTION c_m    RETURN VARCHAR2;
   FUNCTION c_km   RETURN VARCHAR2;
   FUNCTION c_in   RETURN VARCHAR2;
   FUNCTION c_ft   RETURN VARCHAR2;
   FUNCTION c_yd   RETURN VARCHAR2;
   FUNCTION c_mile RETURN VARCHAR2;
   -- width
   FUNCTION c_m2  RETURN VARCHAR2;
   FUNCTION c_a   RETURN VARCHAR2;
   FUNCTION c_ha  RETURN VARCHAR2;
   FUNCTION c_km2 RETURN VARCHAR2;
   FUNCTION c_ft2 RETURN VARCHAR2;
   FUNCTION c_yd2 RETURN VARCHAR2;
   FUNCTION c_ac  RETURN VARCHAR2;
   FUNCTION c_p   RETURN VARCHAR2;
   --weight
   FUNCTION c_mg RETURN VARCHAR2;
   FUNCTION c_g  RETURN VARCHAR2;
   FUNCTION c_kg RETURN VARCHAR2;
   FUNCTION c_t  RETURN VARCHAR2;
   FUNCTION c_kt RETURN VARCHAR2;
   FUNCTION c_gr RETURN VARCHAR2;
   FUNCTION c_oz RETURN VARCHAR2;
   FUNCTION c_lb RETURN VARCHAR2;
   --volumn
   FUNCTION c_cc  RETURN VARCHAR2;
   FUNCTION c_ml  RETURN VARCHAR2;
   FUNCTION c_dl  RETURN VARCHAR2;
   FUNCTION c_l   RETURN VARCHAR2;
   FUNCTION c_cm3 RETURN VARCHAR2;
   FUNCTION c_m3  RETURN VARCHAR2;
   FUNCTION c_in3 RETURN VARCHAR2;
   FUNCTION c_ft3 RETURN VARCHAR2;
   FUNCTION c_yd3 RETURN VARCHAR2;
   FUNCTION c_gal RETURN VARCHAR2;
   FUNCTION c_bbl RETURN VARCHAR2;
   
   --heat
   FUNCTION c_c RETURN VARCHAR2;
   FUNCTION c_f RETURN VARCHAR2;
   FUNCTION c_k RETURN VARCHAR2;
   --pressure
   FUNCTION c_atm     RETURN VARCHAR2;
   FUNCTION c_pa      RETURN VARCHAR2;
   FUNCTION c_hpa     RETURN VARCHAR2;
   FUNCTION c_kpa     RETURN VARCHAR2;
   FUNCTION c_mpa     RETURN VARCHAR2;
   FUNCTION c_dyne    RETURN VARCHAR2;
   FUNCTION c_bar     RETURN VARCHAR2;
   FUNCTION c_kgf     RETURN VARCHAR2;
   FUNCTION c_psi     RETURN VARCHAR2;
   FUNCTION c_mmhg    RETURN VARCHAR2;
   FUNCTION c_inchhg  RETURN VARCHAR2;
   FUNCTION c_mmh2o   RETURN VARCHAR2;
   FUNCTION c_inchh2o RETURN VARCHAR2;
   
   --speed
   FUNCTION c_m_s  RETURN VARCHAR2;
   FUNCTION c_m_h  RETURN VARCHAR2;
   FUNCTION c_km_s RETURN VARCHAR2;
   FUNCTION c_km_h RETURN VARCHAR2;
   FUNCTION c_in_s RETURN VARCHAR2;
   FUNCTION c_in_h RETURN VARCHAR2;
   FUNCTION c_ft_s RETURN VARCHAR2;
   FUNCTION c_ft_h RETURN VARCHAR2;
   FUNCTION c_mi_s RETURN VARCHAR2;
   FUNCTION c_mi_h RETURN VARCHAR2;
   FUNCTION c_kn   RETURN VARCHAR2;
   FUNCTION c_mach RETURN VARCHAR2;
   --data
   FUNCTION c_bit RETURN VARCHAR2;
   FUNCTION c_b   RETURN VARCHAR2;
   FUNCTION c_kb  RETURN VARCHAR2;
   FUNCTION c_mb  RETURN VARCHAR2;
   FUNCTION c_gb  RETURN VARCHAR2;
   FUNCTION c_tb  RETURN VARCHAR2;
   FUNCTION c_pb  RETURN VARCHAR2;
   FUNCTION c_eb  RETURN VARCHAR2;
   --time
   FUNCTION c_dd RETURN VARCHAR2;
   FUNCTION c_hh RETURN VARCHAR2;
   FUNCTION c_mi RETURN VARCHAR2;
   FUNCTION c_ss RETURN VARCHAR2;  
       
   FUNCTION c_left  RETURN VARCHAR2;      
   FUNCTION c_right RETURN VARCHAR2;            
      
   FUNCTION c_ll  RETURN VARCHAR2;      
   FUNCTION c_lr  RETURN VARCHAR2;      
   FUNCTION c_rr  RETURN VARCHAR2;      
   FUNCTION c_rl  RETURN VARCHAR2;      
   
   FUNCTION c_all RETURN VARCHAR2;           
   
   FUNCTION c_tab       RETURN VARCHAR2;
   FUNCTION c_enter     RETURN VARCHAR2;
   FUNCTION c_space     RETURN VARCHAR2;
   FUNCTION c_squot     RETURN VARCHAR2;
   FUNCTION c_and       RETURN VARCHAR2;
   FUNCTION c_dquot     RETURN VARCHAR2;
   FUNCTION c_slash     RETURN VARCHAR2;
   FUNCTION c_colon     RETURN VARCHAR2;
   FUNCTION c_scolon    RETURN VARCHAR2;
   FUNCTION c_bslash    RETURN VARCHAR2;
   FUNCTION c_kr        RETURN VARCHAR2;
   FUNCTION c_en        RETURN VARCHAR2;  
   FUNCTION c_ch        RETURN VARCHAR2; 
   FUNCTION c_jr        RETURN VARCHAR2;  
   FUNCTION c_spc       RETURN VARCHAR2;  
   FUNCTION c_num       RETURN VARCHAR2;     
   

   /* To, IS FUNCTION */
   FUNCTION isnumber  (p_key IN NUMBER) RETURN h$type.num_t;
   FUNCTION isnumber  (p_key IN DATE) RETURN h$type.num_t;
   FUNCTION isnumber  (p_key IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION isnumber  (p_key IN CLOB) RETURN h$type.num_t;
   FUNCTION isnumber2 (p_key IN NUMBER, returnval IN NUMBER) RETURN h$type.num_t;
   FUNCTION isnumber2 (p_key IN DATE, returnval IN NUMBER) RETURN h$type.num_t;
   FUNCTION isnumber2 (p_key IN VARCHAR2, returnval IN NUMBER) RETURN h$type.num_t;
   FUNCTION isnumber2 (p_key IN CLOB, returnval IN NUMBER) RETURN h$type.num_t;
   FUNCTION isstring  (p_key IN NUMBER) RETURN h$type.var_t;
   FUNCTION isstring  (p_key IN DATE) RETURN h$type.var_t;
   FUNCTION isstring  (p_key IN VARCHAR2) RETURN h$type.var_t;
   FUNCTION isstring2 (p_key IN NUMBER, returnval IN VARCHAR2) RETURN h$type.var_t;
   FUNCTION isstring2 (p_key IN DATE, returnval IN VARCHAR2) RETURN h$type.var_t;
   FUNCTION isstring2 (p_key IN VARCHAR2, returnval IN VARCHAR2) RETURN h$type.var_t;
   FUNCTION isdate    (p_key IN NUMBER) RETURN h$type.date_t;
   FUNCTION isdate    (p_key IN DATE) RETURN h$type.date_t;
   FUNCTION isdate    (p_key IN VARCHAR2) RETURN h$type.date_t;
   FUNCTION isdate    (p_key IN CLOB) RETURN h$type.date_t;
   FUNCTION isdate2   (p_key IN NUMBER, returnval IN DATE) RETURN h$type.date_t;
   FUNCTION isdate2   (p_key IN DATE, returnval IN DATE) RETURN h$type.date_t;
   FUNCTION isdate2   (p_key IN VARCHAR2, returnval IN DATE) RETURN h$type.date_t;
   FUNCTION isdate2   (p_key IN CLOB, returnval IN DATE) RETURN h$type.date_t;   
   
   FUNCTION isChar (p_str IN VARCHAR2, p_key IN VARCHAR2) RETURN h$type.var_t;
   FUNCTION isChar (p_str IN VARCHAR2) RETURN hobjvalueset_t2;
   
   
   FUNCTION to_length   (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_width    (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_volume   (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_heat     (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_pressure (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_speed    (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_data     (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_weight   (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_time     (p_key IN NUMBER ,p_from_key  IN VARCHAR2 ,p_to_key  IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_bin      (p_dec IN NUMBER) RETURN h$type.var_t;
   FUNCTION to_dec      (p_dec IN NUMBER) RETURN h$type.var_t;
   FUNCTION to_hex      (p_dec IN NUMBER) RETURN h$type.var_t;
   FUNCTION to_ascii    (p_str IN VARCHAR2) RETURN h$type.num_t;
   FUNCTION to_ascii    (p_str in VARCHAR2, p_base in NUMBER )  RETURN h$type.num_t;
   FUNCTION to_comma    (p_dec IN NUMBER) RETURN h$type.var_t;
   FUNCTION to_substr   (p_str in VARCHAR2,p_delimeter in VARCHAR2,p_direction in VARCHAR2) RETURN H$TYPE.var_t;
   FUNCTION to_substr   (p_str in VARCHAR2,p_delimeter in VARCHAR2) RETURN H$TYPE.var_t;
   FUNCTION to_percent  (p_dec in NUMBER) return H$TYPE.var_t;
   FUNCTION to_percent  (p_val1 in NUMBER, p_val2 in NUMBER ) return H$TYPE.var_t;
   FUNCTION to_split    (p_str in VARCHAR2,p_pattern in h$type.int_t) RETURN hobjvalueset_t1;
   FUNCTION to_split    (p_str in VARCHAR2,p_pattern in VARCHAR2) RETURN hobjvalueset_t1;
   FUNCTION to_split    (p_str in VARCHAR2,p_pattern in VARCHAR2,p_pattern2 in VARCHAR2) RETURN hobjvalueset_t1;
   FUNCTION to_split    (p_str in VARCHAR2,p_pattern in VARCHAR2,p_pattern2 in VARCHAR2,p_pattern3 in VARCHAR2) RETURN hobjvalueset_t1;
   
   FUNCTION to_trans(p_num in number) return h$type.var_t;
   FUNCTION to_trans(p_base in date,p_posting in date) return h$type.var_t;
   FUNCTION to_trans(p_base in date,p_posting in date,p_key in varchar2) return h$type.var_t;
   
   
   FUNCTION to_col(tablename in varchar2,
                   columnname in varchar2,
                   ordercolumn in varchar2, 
                   keycolumnname in varchar2,
                   keycolumnvalue in varchar2) RETURN H$TYPE.var_t;
   
   FUNCTION add_pattern (p_str IN VARCHAR2,p_key IN VARCHAR2,p_pattern NUMBER,p_direction IN VARCHAR2) RETURN h$type.var_t;
   FUNCTION add_pattern (p_str IN NUMBER,  p_key IN NUMBER,  p_pattern NUMBER,p_direction IN VARCHAR2) RETURN h$type.var_t;
   FUNCTION add_pattern (p_str IN VARCHAR2,p_key IN VARCHAR2,p_pattern NUMBER ) RETURN h$type.var_t;
   FUNCTION add_pattern (p_str IN NUMBER,  p_key IN NUMBER,  p_pattern NUMBER ) RETURN h$type.var_t;
      
   FUNCTION add_enter (p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;
   FUNCTION add_enter (p_str in varchar2,p_count in h$type.int_t,p_direction varchar2) RETURN H$TYPE.var_t;
   FUNCTION add_tab   (p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;
   FUNCTION add_tab   (p_str in varchar2,p_count in h$type.int_t,p_direction varchar2) RETURN H$TYPE.var_t ;
   FUNCTION add_space (p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t ;
   FUNCTION add_space (p_str in varchar2,p_count in h$type.int_t,p_direction varchar2) RETURN H$TYPE.var_t;
   
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_key in varchar2,p_count in h$type.int_t,p_direction in varchar2) RETURN H$TYPE.var_t;
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_key in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_key in varchar2,p_direction in varchar2) RETURN H$TYPE.var_t;
   
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_count in h$type.int_t,p_direction in varchar2) RETURN H$TYPE.var_t;
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t;   
   
   /* What for? */
   FUNCTION add_key   (p_str in varchar2,p_val in varchar2,p_key_or_direction in varchar2) RETURN H$TYPE.var_t;
   
   FUNCTION chr_list RETURN hobjvalueset_t2;
   FUNCTION chr_list(v_end in h$type.int_t) RETURN hobjvalueset_t2;
   FUNCTION chr_list(v_start in h$type.int_t,v_end in h$type.int_t) RETURN hobjvalueset_t2;


   FUNCTION SYS_SQLHIST RETURN  hsysvalueset_t1;
   FUNCTION SYS_SQLHIST(dbuser in varchar2 , sqltext in varchar2) RETURN  hsysvalueset_t2;
   FUNCTION SYS_SQLHIST(dbuser in varchar2 ) RETURN  hsysvalueset_t2;
   FUNCTION SYS_DIAGNOSIS RETURN hobjvalueset_t1;
   FUNCTION sys_dependency(p_owner in varchar2, p_object in varchar2) RETURN hobjvalueset_t1;
   FUNCTION sys_which(p_stmt in varchar2) RETURN hobjvalueset_t4;
   FUNCTION sys_info RETURN hobjvalueset_t2;
   FUNCTION SYS_DU(p_type in varchar2) RETURN  hobjvalueset_t3;
   FUNCTION SYS_STORAGE RETURN hobjvalueset_t1;
   FUNCTION SYS_LIMIT RETURN hobjvalueset_t1;
   
   FUNCTION counta (p_str IN VARCHAR2, p_delimeter IN VARCHAR2) RETURN h$type.num_t;
   
   FUNCTION to_reverse (p_str IN VARCHAR2) RETURN h$type.var_t;
   FUNCTION to_reverse (p_num IN NUMBER) RETURN h$type.num_t;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t);
                     
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t);
                     
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t,
                     p_val8 in h$type.obj_value_t);       
                                
   PROCEDURE setter (p_classname in h$type.class_name_t, 
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
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t);
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t);
                     
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t);       
                     
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t,
                     p_val8 in h$type.obj_value_t);   
                                                                                                                                         
   PROCEDURE setter (p_classname in h$type.class_name_t, 
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
                     
   PROCEDURE setter (p_classname in h$type.class_name_t,p_val in h$type.obj_value_t);
   
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t) return h$type.var_t; 
    
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t) return h$type.var_t; 
    
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t) return h$type.var_t; 
    
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t) return h$type.var_t; 
    
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t) return h$type.var_t; 
    
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t) return h$type.var_t; 
                     
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t) return h$type.var_t;       
    
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t,
                     p_val8 in h$type.obj_value_t) return h$type.var_t;       
                                                                                                                     
    FUNCTION setter (p_classname in h$type.class_name_t, 
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
    
    FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t) return h$type.var_t; 
                      
    FUNCTION setter (p_classname in h$type.class_name_t, 
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
    FUNCTION setter (p_classname in h$type.class_name_t,p_val in h$type.obj_value_t) RETURN h$type.var_t; 
    
    FUNCTION  count (p_classname in h$type.class_name_t) RETURN h$type.int_t;
    
    PROCEDURE remove (p_classname in h$type.class_name_t,p_key in h$type.int_t);
    PROCEDURE remove (p_classname in h$type.class_name_t, p_key in h$type.obj_key_t);
    PROCEDURE remove (p_classname in h$type.class_name_t);
    
    FUNCTION getter(p_classname in h$type.class_name_t) RETURN hobjvalueset_t10;
    FUNCTION getter(p_classname in h$type.class_name_t,p_key in h$type.obj_key_t) RETURN hobjvalueset_t10;
    FUNCTION key_gen(p_key in h$type.var_t) RETURN h$type.var_t;
    FUNCTION encrypt(p_str in h$type.var_t,p_key in h$type.var_t) RETURN h$type.var_t;
    FUNCTION decrypt(p_str in h$type.var_t,p_key in h$type.var_t) RETURN h$type.var_t;
END h;
/
CREATE OR REPLACE PACKAGE BODY h
AS
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
   FUNCTION c_mm RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mm; END c_mm;
   FUNCTION c_cm RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_cm; END c_cm;
   FUNCTION c_m RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_m; END c_m;
   FUNCTION c_km RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_km; END c_km;
   FUNCTION c_in RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_in; END c_in;
   FUNCTION c_ft RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ft; END c_ft;
   FUNCTION c_yd RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_yd; END c_yd;
   FUNCTION c_mile RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mile; END c_mile;
   FUNCTION c_m2 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_m2; END c_m2;
   FUNCTION c_a RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_a; END c_a;
   FUNCTION c_ha RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ha; END c_ha;
   FUNCTION c_km2 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_km2; END c_km2;
   FUNCTION c_ft2 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ft2; END c_ft2;
   FUNCTION c_yd2 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_yd2; END c_yd2;
   FUNCTION c_ac RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ac; END c_ac;
   FUNCTION c_p RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_p; END c_p;
   FUNCTION c_mg RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mg; END c_mg;
   FUNCTION c_g RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_g; END c_g;
   FUNCTION c_kg RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_kg; END c_kg;
   FUNCTION c_t RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_t; END c_t;
   FUNCTION c_kt RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_kt; END c_kt;
   FUNCTION c_gr RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_gr; END c_gr;
   FUNCTION c_oz RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_oz; END c_oz;
   FUNCTION c_lb RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_lb; END c_lb;
   FUNCTION c_cc RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_cc; END c_cc;
   FUNCTION c_ml RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ml; END c_ml;
   FUNCTION c_dl RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_dl; END c_dl;
   FUNCTION c_l RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_l; END c_l;
   FUNCTION c_cm3 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_cm3; END c_cm3;
   FUNCTION c_m3 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_m3; END c_m3;
   FUNCTION c_in3 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_in3; END c_in3;
   FUNCTION c_ft3 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ft3; END c_ft3;
   FUNCTION c_yd3 RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_yd3; END c_yd3;
   FUNCTION c_gal RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_gal; END c_gal;
   FUNCTION c_bbl RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_bbl; END c_bbl;
   
   FUNCTION c_c RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_c; END c_c;
   FUNCTION c_f RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_f; END c_f;
   FUNCTION c_k RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_k; END c_k;
   FUNCTION c_atm RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_atm; END c_atm;
   FUNCTION c_pa RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_pa; END c_pa;
   FUNCTION c_hpa RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_hpa; END c_hpa;
   FUNCTION c_kpa RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_kpa; END c_kpa;
   FUNCTION c_mpa RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mpa; END c_mpa;
   FUNCTION c_dyne RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_dyne; END c_dyne;
   FUNCTION c_bar RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_bar; END c_bar;
   FUNCTION c_kgf RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_kgf; END c_kgf;
   FUNCTION c_psi RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_psi; END c_psi;
   FUNCTION c_mmhg RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mmhg; END c_mmhg;
   FUNCTION c_inchhg RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_inchhg; END c_inchhg;
   FUNCTION c_mmh2o RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mmh2o; END c_mmh2o;
   FUNCTION c_inchh2o RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_inchh2o; END c_inchh2o;

   
   FUNCTION c_m_s RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_m_s; END c_m_s;
   FUNCTION c_m_h RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_m_h; END c_m_h;
   FUNCTION c_km_s RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_km_s; END c_km_s;
   FUNCTION c_km_h RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_km_h; END c_km_h;
   FUNCTION c_in_s RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_in_s; END c_in_s;
   FUNCTION c_in_h RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_in_h; END c_in_h;
   FUNCTION c_ft_s RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ft_s; END c_ft_s;
   FUNCTION c_ft_h RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ft_h; END c_ft_h;
   FUNCTION c_mi_s RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mi_s; END c_mi_s;
   FUNCTION c_mi_h RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mi_h; END c_mi_h;
   FUNCTION c_kn RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_kn; END c_kn;
   FUNCTION c_mach RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mach; END c_mach;
   FUNCTION c_bit RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_bit; END c_bit;
   FUNCTION c_b RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_b; END c_b;
   FUNCTION c_kb RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_kb; END c_kb;
   FUNCTION c_mb RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mb; END c_mb;
   FUNCTION c_gb RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_gb; END c_gb;
   FUNCTION c_tb RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_tb; END c_tb;
   FUNCTION c_pb RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_pb; END c_pb;
   FUNCTION c_eb RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_eb; END c_eb;
   FUNCTION c_dd RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_dd; END c_dd;
   FUNCTION c_hh RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_hh; END c_hh;
   FUNCTION c_mi RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_mi; END c_mi;
   FUNCTION c_ss RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ss; END c_ss;  
   FUNCTION c_left RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_left; END c_left;  
   FUNCTION c_right RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_right; END c_right;   
   FUNCTION c_ll RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_ll; END c_ll;   
   FUNCTION c_lr RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_lr; END c_lr;   
   FUNCTION c_rr RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_rr; END c_rr;   
   FUNCTION c_rl RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_rl; END c_rl;   
   
   
   
   
   FUNCTION c_all RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_all; END c_all;
   
   
   FUNCTION c_tab       RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_tab; END c_tab;
   FUNCTION c_enter     RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_enter; END c_enter;
   FUNCTION c_space     RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_space; END c_space;
   FUNCTION c_squot     RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_squot; END c_squot;
   FUNCTION c_and       RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_and; END c_and;
   FUNCTION c_dquot     RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_dquot; END c_dquot;
   FUNCTION c_slash     RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_slash; END c_slash;
   FUNCTION c_colon     RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_colon; END c_colon;
   FUNCTION c_scolon    RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_scolon; END c_scolon;
   FUNCTION c_bslash    RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_bslash; END c_bslash;
   FUNCTION c_kr        RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_korean; END c_kr;
   FUNCTION c_en        RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_english; END c_en;  
   FUNCTION c_ch        RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_chinese; END c_ch; 
   FUNCTION c_jr        RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_japanese; END c_jr;  
   FUNCTION c_spc       RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_special; END c_spc;  
   FUNCTION c_num       RETURN VARCHAR2 IS BEGIN RETURN h$constants.c_number; END c_num;    
   
   
   
   /* To, IS FUNCTION */
   FUNCTION isnumber (p_key IN NUMBER) RETURN h$type.num_t IS BEGIN RETURN h$util.isnumber (p_key); END isnumber;
   FUNCTION isnumber (p_key IN DATE) RETURN h$type.num_t IS BEGIN RETURN h$util.isnumber (p_key); END isnumber;
   FUNCTION isnumber (p_key IN VARCHAR2) RETURN h$type.num_t IS BEGIN RETURN h$util.isnumber (p_key); END isnumber;
   FUNCTION isnumber (p_key IN CLOB) RETURN h$type.num_t IS BEGIN RETURN h$util.isnumber (p_key); END isnumber;
   FUNCTION isnumber2 (p_key IN NUMBER, returnval IN NUMBER) RETURN h$type.num_t IS BEGIN RETURN h$util.isnumber2 (p_key, returnval); END isnumber2;
   FUNCTION isnumber2 (p_key IN DATE, returnval IN NUMBER) RETURN h$type.num_t IS BEGIN RETURN h$util.isnumber2 (p_key, returnval); END isnumber2;
   FUNCTION isnumber2 (p_key IN VARCHAR2, returnval IN NUMBER) RETURN h$type.num_t IS BEGIN RETURN h$util.isnumber2 (p_key, returnval); END isnumber2;
   FUNCTION isnumber2 (p_key IN CLOB, returnval IN NUMBER) RETURN h$type.num_t IS BEGIN RETURN h$util.isnumber2 (p_key, returnval); END isnumber2;
   FUNCTION isstring (p_key IN VARCHAR2) RETURN h$type.var_t IS BEGIN RETURN h$util.isstring (p_key); END isstring;
   FUNCTION isstring (p_key IN DATE) RETURN h$type.var_t IS BEGIN RETURN h$util.isstring (p_key); END isstring;
   FUNCTION isstring (p_key IN NUMBER) RETURN h$type.var_t IS BEGIN RETURN h$util.isstring (p_key); END isstring;
   FUNCTION isstring2 (p_key IN VARCHAR2, returnval IN VARCHAR2) RETURN h$type.var_t IS BEGIN RETURN h$util.isstring2 (p_key, returnval); END isstring2;
   FUNCTION isstring2 (p_key IN DATE, returnval IN VARCHAR2) RETURN h$type.var_t IS BEGIN RETURN h$util.isstring2 (p_key, returnval); END isstring2;
   FUNCTION isstring2 (p_key IN NUMBER, returnval IN VARCHAR2) RETURN h$type.var_t IS BEGIN RETURN h$util.isstring2 (p_key, returnval); END isstring2;
   FUNCTION isdate (p_key IN NUMBER) RETURN h$type.date_t IS BEGIN RETURN h$util.isdate (p_key); END isdate;
   FUNCTION isdate (p_key IN DATE) RETURN h$type.date_t IS BEGIN RETURN h$util.isdate (p_key); END isdate;
   FUNCTION isdate (p_key IN VARCHAR2) RETURN h$type.date_t IS BEGIN RETURN h$util.isdate (p_key); END isdate;
   FUNCTION isdate (p_key IN CLOB) RETURN h$type.date_t IS BEGIN RETURN h$util.isdate (p_key); END isdate;
   FUNCTION isdate2 (p_key IN NUMBER, returnval IN DATE) RETURN h$type.date_t IS BEGIN RETURN h$util.isdate2 (p_key, returnval); END isdate2;
   FUNCTION isdate2 (p_key IN DATE, returnval IN DATE) RETURN h$type.date_t IS BEGIN RETURN h$util.isdate2 (p_key, returnval); END isdate2;
   FUNCTION isdate2 (p_key IN VARCHAR2, returnval IN DATE) RETURN h$type.date_t IS BEGIN RETURN h$util.isdate2 (p_key, returnval); END isdate2;
   FUNCTION isdate2 (p_key IN CLOB, returnval IN DATE) RETURN h$type.date_t IS BEGIN RETURN h$util.isdate2 (p_key, returnval); END isdate2;

   FUNCTION isChar (p_str IN VARCHAR2, p_key IN VARCHAR2) RETURN h$type.var_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.isChar (p_str, p_key);
   END isChar;
   
   FUNCTION isChar (p_str IN VARCHAR2) RETURN hobjvalueset_t2
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.isChar (p_str);
   END isChar;
   
   FUNCTION counta (p_str IN VARCHAR2, p_delimeter IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.counta (p_str, p_delimeter);
   END counta;
   
   FUNCTION to_length ( p_key IN NUMBER, p_from_key  IN VARCHAR2, p_to_key  IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_length (p_key, p_from_key, p_to_key);
   END to_length;

   FUNCTION to_width ( p_key IN NUMBER, p_from_key  IN VARCHAR2, p_to_key  IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_width (p_key, p_from_key, p_to_key);
   END to_width;

   FUNCTION to_volume ( p_key IN NUMBER, p_from_key  IN VARCHAR2, p_to_key  IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_volume (p_key, p_from_key, p_to_key);
   END to_volume;

   FUNCTION to_heat (p_key IN NUMBER, p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_heat (p_key, p_from_key, p_to_key);
   END to_heat;

   FUNCTION to_pressure ( p_key IN NUMBER, p_from_key  IN VARCHAR2, p_to_key  IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_pressure (p_key, p_from_key, p_to_key);
   END to_pressure;

   FUNCTION to_speed ( p_key IN NUMBER, p_from_key  IN VARCHAR2, p_to_key  IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_speed (p_key, p_from_key, p_to_key);
   END to_speed;

   FUNCTION to_data (p_key IN NUMBER, p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_data (p_key, p_from_key, p_to_key);
   END to_data;

   FUNCTION to_weight ( p_key IN NUMBER, p_from_key  IN VARCHAR2, p_to_key  IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_weight (p_key, p_from_key, p_to_key);
   END to_weight;

   FUNCTION to_time (p_key IN NUMBER, p_from_key IN VARCHAR2, p_to_key IN VARCHAR2) RETURN h$type.num_t
   IS
   BEGIN 
     h$initial.LOAD; 
     RETURN h$util.to_time (p_key, p_from_key, p_to_key);
   END to_time;

   FUNCTION to_bin (p_dec IN NUMBER) RETURN h$type.var_t IS BEGIN RETURN h$util.to_bin (p_dec); END to_bin;
   FUNCTION to_dec (p_dec IN NUMBER) RETURN h$type.var_t IS BEGIN RETURN h$util.to_dec (p_dec); END to_dec;
   FUNCTION to_hex (p_dec IN NUMBER) RETURN h$type.var_t IS BEGIN RETURN h$util.to_hex (p_dec); END to_hex;
   FUNCTION to_ascii (p_str IN VARCHAR2) RETURN h$type.num_t IS BEGIN RETURN h$util.to_ascii (p_str); END to_ascii;
   FUNCTION to_ascii (p_str IN VARCHAR2, p_base IN NUMBER )  RETURN h$type.num_t IS BEGIN RETURN h$util.to_ascii (p_str,p_base); END to_ascii;
   FUNCTION to_comma (p_dec IN NUMBER) RETURN h$type.var_t IS BEGIN RETURN h$util.to_comma (p_dec); END to_comma;
   
   FUNCTION to_trans(p_num in number) RETURN h$type.var_t IS BEGIN return h$util.to_trans(p_num); END to_trans;
   FUNCTION to_trans(p_base in date,p_posting in date) RETURN h$type.var_t IS BEGIN return h$util.to_trans(p_base,p_posting); END to_trans;
   FUNCTION to_trans(p_base in date,p_posting in date,p_key in varchar2) RETURN h$type.var_t IS BEGIN return h$util.to_trans(p_base,p_posting,p_key); END to_trans;
   
   FUNCTION to_substr(p_str in varchar2,p_delimeter in varchar2,p_direction in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.to_substr(p_str,p_delimeter,p_direction);
   END to_substr;
   
   FUNCTION to_substr(p_str in varchar2,p_delimeter in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.to_substr(p_str,p_delimeter,h$constants.c_ll);
   END to_substr;
   
   FUNCTION to_percent(p_dec in number) return H$TYPE.var_t
   is
   begin
     RETURN h$util.to_percent(p_dec);
   end to_percent;
      
   FUNCTION to_percent(p_val1 in number, p_val2 in number ) return H$TYPE.var_t
   is
   begin
     RETURN h$util.to_percent(p_val1,p_val2);
   end to_percent;   
   
   FUNCTION to_split(p_str in varchar2,p_pattern in h$type.int_t) RETURN hobjvalueset_t1
   IS
   BEGIN
     RETURN h$util.to_split(p_str,p_pattern);
   END to_split;
   
   FUNCTION to_split(p_str in varchar2,p_pattern in varchar2) RETURN hobjvalueset_t1
   IS
   BEGIN
     RETURN h$util.to_split(p_str,p_pattern);
   END to_split;
   
   
   FUNCTION to_split(p_str in varchar2,p_pattern in varchar2,p_pattern2 in varchar2) RETURN hobjvalueset_t1
   IS
   BEGIN
     RETURN h$util.to_split(p_str,p_pattern,p_pattern2);
   END to_split;
   
   FUNCTION to_split(p_str in varchar2,p_pattern in varchar2,p_pattern2 in varchar2,p_pattern3 in varchar2) RETURN hobjvalueset_t1
   IS
   BEGIN
     RETURN h$util.to_split(p_str,p_pattern,p_pattern2,p_pattern3);
   END to_split;
   
   
   
   FUNCTION to_col(tablename in varchar2,
                   columnname in varchar2,
                   ordercolumn in varchar2, 
                   keycolumnname in varchar2,
                   keycolumnvalue in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.to_col(tablename,columnname,ordercolumn,keycolumnname,keycolumnvalue);
   END to_col;
   
   FUNCTION chr_list RETURN hobjvalueset_t2
   IS
   BEGIN
     RETURN h$util.chr_list(1,100);
   END chr_list;
   
   FUNCTION chr_list(v_end in h$type.int_t) RETURN hobjvalueset_t2
   IS
   BEGIN
     RETURN h$util.chr_list(1,v_end);
   END chr_list;
   FUNCTION chr_list(v_start in h$type.int_t,v_end in h$type.int_t) RETURN hobjvalueset_t2
   IS
   BEGIN
     RETURN h$util.chr_list(v_start,v_end);
   END chr_list;   
   
   FUNCTION add_enter(p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,chr(13),null,p_count,h$constants.c_right);
   END add_enter;
   
   FUNCTION add_enter(p_str in varchar2,p_count in h$type.int_t,p_direction varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,chr(13),null,p_count,p_direction);
   END add_enter;   
   
   
   FUNCTION add_tab(p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t  
   IS
   BEGIN
     RETURN h$util.add_key(p_str,chr(9),null,p_count,h$constants.c_right);
   END add_tab;
   
   FUNCTION add_tab(p_str in varchar2,p_count in h$type.int_t,p_direction varchar2) RETURN H$TYPE.var_t  
   IS
   BEGIN
     RETURN h$util.add_key(p_str,chr(9),null,p_count,p_direction);
   END add_tab;
   
   
   FUNCTION add_space(p_str in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t  
   IS
   BEGIN
     RETURN h$util.add_key(p_str,' ',null,p_count,h$constants.c_right);
   END add_space;
   
   FUNCTION add_space(p_str in varchar2,p_count in h$type.int_t,p_direction varchar2) RETURN H$TYPE.var_t  
   IS
   BEGIN
     RETURN h$util.add_key(p_str,' ',null,p_count,p_direction);
   END add_space;
   
   
   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_key in varchar2,p_count in h$type.int_t,p_direction in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,p_val,p_key,p_count,p_direction);
   END add_key;
   
   
   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_key_or_direction in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
      RETURN h$util.add_key(p_str,p_val,p_key_or_direction);
   END add_key;
   
   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t
   IS
   BEGIN
      RETURN h$util.add_key(p_str,p_val,p_count);
   END add_key;
   
   
   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_key in varchar2,p_count in h$type.int_t) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,p_val,p_key,p_count);
   END add_key;
   

   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_key in varchar2,p_direction in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,p_val,p_key,p_direction);
   END add_key;
   

   FUNCTION add_key(p_str in varchar2,p_val in varchar2,p_count in h$type.int_t,p_direction in varchar2) RETURN H$TYPE.var_t
   IS
   BEGIN
     RETURN h$util.add_key(p_str,p_val,p_count,p_direction);
   END add_key;


   FUNCTION add_pattern (p_str IN VARCHAR2,p_key IN VARCHAR2,p_pattern NUMBER,p_direction IN VARCHAR2) RETURN h$type.var_t
   IS
   BEGIN 
     RETURN h$util.add_pattern (p_str, p_key, p_pattern, p_direction);
   END add_pattern;

   FUNCTION add_pattern (p_str IN NUMBER,p_key IN NUMBER,p_pattern NUMBER,p_direction IN VARCHAR2) RETURN h$type.var_t
   IS
   BEGIN 
     RETURN h$util.add_pattern (p_str, p_key, p_pattern, p_direction);
   END add_pattern;

   FUNCTION add_pattern (p_str IN VARCHAR2,p_key IN VARCHAR2,p_pattern NUMBER) RETURN h$type.var_t
   IS
   BEGIN 
     RETURN h$util.add_pattern (p_str, p_key, p_pattern);
   END add_pattern;

   FUNCTION add_pattern (p_str IN NUMBER,p_key IN NUMBER,p_pattern NUMBER) RETURN h$type.var_t
   IS
   BEGIN 
     RETURN h$util.add_pattern (p_str, p_key, p_pattern);
   END add_pattern;


   FUNCTION SYS_SQLHIST RETURN  hsysvalueset_t1
   IS
   BEGIN
     RETURN h$system.SYS_SQLHIST;
   END SYS_SQLHIST;
   FUNCTION SYS_SQLHIST(dbuser in varchar2 , sqltext in varchar2) RETURN  hsysvalueset_t2
      IS
   BEGIN
     RETURN h$system.SYS_SQLHIST(dbuser,sqltext);
   END SYS_SQLHIST;
   
   FUNCTION SYS_SQLHIST(dbuser in varchar2 ) RETURN  hsysvalueset_t2
      IS
   BEGIN
     RETURN h$system.SYS_SQLHIST(dbuser,'*');
   END SYS_SQLHIST;
   
     
   FUNCTION SYS_DIAGNOSIS RETURN hobjvalueset_t1
   IS
   BEGIN
     return H$SYSTEM.SYS_DIAGNOSIS;
   END SYS_DIAGNOSIS;
   
   FUNCTION sys_dependency(p_owner in varchar2, p_object in varchar2) RETURN hobjvalueset_t1
   IS
   BEGIN
     return h$system.sys_dependency(p_owner,p_object);
   END sys_dependency;
   
   FUNCTION sys_which(p_stmt in varchar2) RETURN hobjvalueset_t4
   IS
   BEGIN
     return h$system.sys_which(p_stmt);
   END sys_which;
   
   FUNCTION sys_info RETURN hobjvalueset_t2
   IS
   BEGIN
     return h$system.sys_info;
   END sys_info;
   
   FUNCTION SYS_DU(p_type in varchar2) RETURN  hobjvalueset_t3
   IS
   BEGIN
     return h$system.sys_du(p_type);
   END SYS_DU;
   
   FUNCTION SYS_STORAGE RETURN hobjvalueset_t1
   IS
   BEGIN
     return h$system.SYS_STORAGE;
   END SYS_STORAGE;
   
   FUNCTION SYS_LIMIT RETURN hobjvalueset_t1
   IS
   BEGIN
     return h$system.sys_limit;
   END SYS_LIMIT;

   
   FUNCTION to_reverse(p_str in varchar2) return h$type.var_t is begin return h$util.to_reverse(p_str); end to_reverse;
   FUNCTION to_reverse(p_num in number) return h$type.num_t is begin return h$util.to_reverse(p_num); end to_reverse;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,null,null,null,null,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,null,null,null,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,null,null,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,null,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t,
                     p_val8 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
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
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,p_val9);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,null,null,null,null,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,null,null,null,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,null,null,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,null,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,null,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,null,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,null,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t,
                     p_val8 in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,null);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
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
   BEGIN
       h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,p_val9);
   END setter;
   
   PROCEDURE setter (p_classname in h$type.class_name_t,p_val in h$type.obj_value_t)
   IS
   BEGIN
       h$cache.cset(p_classname,p_val);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,null,null,null,null,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,null,null,null,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,null,null,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,null,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.obj_key_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t,
                     p_val8 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,null);
   END setter;
    
   FUNCTION setter (p_classname in h$type.class_name_t, 
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
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,p_val9);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,null,null,null,null,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,null,null,null,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,null,null,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,null,null,null,null,null);
   END setter; 
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,null,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,null,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,null,null);
   END setter;
   
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
                     p_val1 in h$type.obj_value_t,
                     p_val2 in h$type.obj_value_t,
                     p_val3 in h$type.obj_value_t,
                     p_val4 in h$type.obj_value_t,
                     p_val5 in h$type.obj_value_t,
                     p_val6 in h$type.obj_value_t,
                     p_val7 in h$type.obj_value_t,
                     p_val8 in h$type.obj_value_t) return h$type.var_t
   IS
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,null);
   END setter;
         
   FUNCTION setter (p_classname in h$type.class_name_t, 
                     p_key in h$type.int_t,
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
   BEGIN
     return  h$cache.cset(p_classname,p_key,p_val1,p_val2,p_val3,p_val4,p_val5,p_val6,p_val7,p_val8,p_val9);
   END setter;                   
   
   FUNCTION setter (p_classname in h$type.class_name_t,p_val in h$type.obj_value_t) RETURN h$type.var_t
   IS
   BEGIN
     return h$cache.cset(p_classname,p_val);
   END setter; 
    
   FUNCTION  count (p_classname in h$type.class_name_t) RETURN h$type.int_t
   IS
   BEGIN
     return h$cache.count(p_classname);
   END count;
    
   PROCEDURE remove (p_classname in h$type.class_name_t,p_key in h$type.int_t)
   IS
   BEGIN
     h$cache.remove(p_classname,p_key);
   END remove;
   
   PROCEDURE remove (p_classname in h$type.class_name_t, p_key in h$type.obj_key_t)
   IS
   BEGIN
     h$cache.remove(p_classname,p_key);
   END remove;
   
   PROCEDURE remove (p_classname in h$type.class_name_t)
   IS
   BEGIN
     h$cache.remove(p_classname);
   END remove;
    
   FUNCTION getter(p_classname in h$type.class_name_t) RETURN hobjvalueset_t10
   IS
   BEGIN
     return h$cache.get(p_classname);
   END getter;
   
   FUNCTION getter(p_classname in h$type.class_name_t,p_key in h$type.obj_key_t) RETURN hobjvalueset_t10
   IS
   BEGIN
     return h$cache.get(p_classname,p_key);
   END getter;
   
   FUNCTION key_gen(p_key in h$type.var_t) RETURN h$type.var_t
   IS
   BEGIN
     return h$code.key_gen(p_key);
   END key_gen;
   
   FUNCTION encrypt(p_str in h$type.var_t,p_key in h$type.var_t) RETURN h$type.var_t
   IS
   BEGIN
      return h$code.encrypt(p_str,p_key);
   END encrypt;
   FUNCTION decrypt(p_str in h$type.var_t,p_key in h$type.var_t) RETURN h$type.var_t
   IS
   BEGIN
      return h$code.decrypt(p_str,p_key);
   END decrypt;
   
END h;
/