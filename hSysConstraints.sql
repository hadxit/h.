CREATE OR REPLACE PACKAGE h$constants
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

   -- --------------------------------------------------------------------
-- Usefull constants
-- --------------------------------------------------------------------
   c_true           CONSTANT BOOLEAN             := TRUE;
   c_false          CONSTANT BOOLEAN             := FALSE;
   c_module_error   CONSTANT NUMBER              := 10000;
   c_nil            CONSTANT VARCHAR2 (10)       := '-';
   
   c_rtn_true       CONSTANT h$type.var_t    := 'T';
   c_rtn_false      CONSTANT h$type.var_t    := 'F';
   c_left           CONSTANT h$type.var_t    := 'LEFT';
   c_right          CONSTANT h$type.var_t    := 'RIGHT';
   c_percent        CONSTANT h$type.var_t    := '%';
   c_all            CONSTANT h$type.var_t    := '*';
   c_comma          CONSTANT h$type.var_t    := ',';
   c_tab            CONSTANT h$type.var_t    := chr(9);
   c_enter          CONSTANT h$type.var_t    := chr(10);
   c_space          CONSTANT h$type.var_t    := chr(32);
   c_squot          CONSTANT h$type.var_t    := chr(34);
   c_and            CONSTANT h$type.var_t    := chr(38);
   c_dquot          CONSTANT h$type.var_t    := chr(44);
   c_slash          CONSTANT h$type.var_t    := chr(47);
   c_colon          CONSTANT h$type.var_t    := chr(58);
   c_scolon         CONSTANT h$type.var_t    := chr(59);
   c_bslash         CONSTANT h$type.var_t    := chr(92);
   c_btick          CONSTANT h$type.var_t    := chr(96);
   
   c_ltop          CONSTANT h$type.var_t    := chr(1);
   c_rtop          CONSTANT h$type.var_t    := chr(2);
   c_lbot          CONSTANT h$type.var_t    := chr(3);
   c_rbot          CONSTANT h$type.var_t    := chr(4);
   c_hbar          CONSTANT h$type.var_t    := chr(5);
   c_vbar          CONSTANT h$type.var_t    := chr(6);
   c_cbar          CONSTANT h$type.var_t    := chr(16);
   
   
   c_korean         CONSTANT h$type.var_t    := 'KOREAN'; 
   c_english        CONSTANT h$type.var_t    := 'ENGLISH';  
   c_chinese        CONSTANT h$type.var_t    := 'CHINESE';  
   c_japanese       CONSTANT h$type.var_t    := 'JAPANESE';  
   c_special        CONSTANT h$type.var_t    := 'SPECIAL';  
   c_number         CONSTANT h$type.var_t    := 'NUMBER';
   
   c_unknown        CONSTANT h$type.var_t    := 'UNKNOWN';
   c_charset        CONSTANT h$type.var_t    := 'CHARACTER';
   c_encrypt        CONSTANT h$type.var_t    := 'ENCRYPT';
   c_decrypt        CONSTANT h$type.var_t    := 'DECRYPT';
      
    
   
   -- length
   c_length         CONSTANT VARCHAR2 (10)     := 'length';
   c_mm           CONSTANT VARCHAR2 (10)       := 'mm';
   c_cm           CONSTANT VARCHAR2 (10)       := 'cm';
   c_m            CONSTANT VARCHAR2 (10)       := 'm';
   c_km           CONSTANT VARCHAR2 (10)       := 'km';
   c_in           CONSTANT VARCHAR2 (10)       := 'in';
   c_ft           CONSTANT VARCHAR2 (10)       := 'ft';
   c_yd           CONSTANT VARCHAR2 (10)       := 'yd';
   c_mile         CONSTANT VARCHAR2 (10)       := 'mile';
   -- width
   c_width          CONSTANT VARCHAR2 (10)       := 'width';
   c_m2           CONSTANT VARCHAR2 (10)       := 'm2';
   c_a            CONSTANT VARCHAR2 (10)       := 'a';
   c_ha           CONSTANT VARCHAR2 (10)       := 'ha';
   c_km2          CONSTANT VARCHAR2 (10)       := 'km2';
   c_ft2          CONSTANT VARCHAR2 (10)       := 'ft2';
   c_yd2          CONSTANT VARCHAR2 (10)       := 'yd2';
   c_ac           CONSTANT VARCHAR2 (10)       := 'ac';
   c_p            CONSTANT VARCHAR2 (10)       := 'p';
   --weight
   c_weight         CONSTANT VARCHAR2 (10)       := 'weight';
   c_mg           CONSTANT VARCHAR2 (10)       := 'mg';
   c_g            CONSTANT VARCHAR2 (10)       := 'g';
   c_kg           CONSTANT VARCHAR2 (10)       := 'kg';
   c_t            CONSTANT VARCHAR2 (10)       := 't';
   c_kt           CONSTANT VARCHAR2 (10)       := 'kt';
   c_gr           CONSTANT VARCHAR2 (10)       := 'gr';
   c_oz           CONSTANT VARCHAR2 (10)       := 'oz';
   c_lb           CONSTANT VARCHAR2 (10)       := 'lb';
   --volumn
   c_volume         CONSTANT VARCHAR2 (10)       := 'volume';
   c_cc           CONSTANT VARCHAR2 (10)       := 'cc';
   c_ml           CONSTANT VARCHAR2 (10)       := 'ml';
   c_dl           CONSTANT VARCHAR2 (10)       := 'dl';
   c_l            CONSTANT VARCHAR2 (10)       := 'l';
   c_cm3          CONSTANT VARCHAR2 (10)       := 'cm3';
   c_m3           CONSTANT VARCHAR2 (10)       := 'm3';
   c_in3          CONSTANT VARCHAR2 (10)       := 'in3';
   c_ft3          CONSTANT VARCHAR2 (10)       := 'ft3';
   c_yd3          CONSTANT VARCHAR2 (10)       := 'yd3';
   c_gal          CONSTANT VARCHAR2 (10)       := 'gal';
   --heat
   c_heat           CONSTANT VARCHAR2 (10)       := 'heat';
   c_c            CONSTANT VARCHAR2 (10)       := 'C';
   c_f            CONSTANT VARCHAR2 (10)       := 'F';
   c_k            CONSTANT VARCHAR2 (10)       := 'K';
   --pressure
   c_pressure       CONSTANT VARCHAR2 (10)       := 'pressure';
   c_atm          CONSTANT VARCHAR2 (10)       := 'atm';
   c_pa           CONSTANT VARCHAR2 (10)       := 'Pa';
   c_hpa          CONSTANT VARCHAR2 (10)       := 'hPa';
   c_kpa          CONSTANT VARCHAR2 (10)       := 'kPa';
   c_mpa          CONSTANT VARCHAR2 (10)       := 'mPa';
   c_dyne         CONSTANT VARCHAR2 (10)       := 'dyne';
   c_bar          CONSTANT VARCHAR2 (10)       := 'bar';
   c_kgf          CONSTANT VARCHAR2 (10)       := 'kgf';
   c_psi          CONSTANT VARCHAR2 (10)       := 'psi';
   c_mmhg         CONSTANT VARCHAR2 (10)       := 'mmHg';
   c_inchhg       CONSTANT VARCHAR2 (10)       := 'inchHg';
   c_mmh2o        CONSTANT VARCHAR2 (10)       := 'mmH2O';
   c_inchh2o      CONSTANT VARCHAR2 (10)       := 'inchH2O';
   --speed
   c_speed          CONSTANT VARCHAR2 (10)       := 'speed';
   c_m_s          CONSTANT VARCHAR2 (10)       := 'm/s';
   c_m_h          CONSTANT VARCHAR2 (10)       := 'm/h';
   c_km_s         CONSTANT VARCHAR2 (10)       := 'km/s';
   c_km_h         CONSTANT VARCHAR2 (10)       := 'km/h';
   c_in_s         CONSTANT VARCHAR2 (10)       := 'in/s';
   c_in_h         CONSTANT VARCHAR2 (10)       := 'in/h';
   c_ft_s         CONSTANT VARCHAR2 (10)       := 'ft/s';
   c_ft_h         CONSTANT VARCHAR2 (10)       := 'ft/h';
   c_mi_s         CONSTANT VARCHAR2 (10)       := 'mi/s';
   c_mi_h         CONSTANT VARCHAR2 (10)       := 'mi/h';
   c_kn           CONSTANT VARCHAR2 (10)       := 'kn/t';
   c_mach         CONSTANT VARCHAR2 (10)       := 'mach';
   --data
   c_data           CONSTANT VARCHAR2 (10)       := 'data';
   c_bit          CONSTANT VARCHAR2 (10)       := 'bit';
   c_b            CONSTANT VARCHAR2 (10)       := 'b';
   c_kb           CONSTANT VARCHAR2 (10)       := 'kb';
   c_mb           CONSTANT VARCHAR2 (10)       := 'mb';
   c_gb           CONSTANT VARCHAR2 (10)       := 'gb';
   c_tb           CONSTANT VARCHAR2 (10)       := 'tb';
   c_pb           CONSTANT VARCHAR2 (10)       := 'pb';
   c_eb           CONSTANT VARCHAR2 (10)       := 'eb';
   --time
   c_time           CONSTANT VARCHAR2 (10)       := 'time';
   c_dd           CONSTANT VARCHAR2 (10)       := 'DD';
   c_hh           CONSTANT VARCHAR2 (10)       := 'HH';
   c_mi           CONSTANT VARCHAR2 (10)       := 'MI';
   c_ss           CONSTANT VARCHAR2 (10)       := 'SS';
  -- --------------------------------------------------
  -- Null/empty variables that are structures so they
  -- cannot be declared CONSTANT.
  -- --------------------------------------------------

   c_null_class_info         h$type.col_system_t;
   c_null_sub_info           h$type.col_value_t10; 
   c_null_system_rec         h$type.col_systme_rec_t;
  -- c_null_idset              h$type.idset_t;
 --  c_null_sub_t              h$type.col_sub_t;
    
END h$constants;