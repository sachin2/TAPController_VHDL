library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity instrreg_e is
   port ( TDI_i       : IN STD_LOGIC;
          TDO_o       : OUT STD_LOGIC;
          instr_i   : IN std_logic_vector(2 DOWNTO 0);
          clock_ir_i  : IN STD_LOGIC;
          shift_ir_i  : IN STD_LOGIC;
          update_ir_i : IN STD_LOGIC;
          instr_o     : OUT std_logic_vector(2 DOWNTO 0);
          Mode1_o     : OUT STD_LOGIC;
          Mode2_o     : OUT STD_LOGIC;  
          Mode3_o     : OUT STD_LOGIC;  
          drmux_o     : OUT STD_LOGIC    
      );
end instrreg_e;