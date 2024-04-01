library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tapc_e is
      port ( TDI_i    : IN STD_LOGIC;
             TDO_o    : OUT STD_LOGIC;
             instr_i   : IN std_logic_vector(2 DOWNTO 0);
             TMS_i    : IN STD_LOGIC;   
             TRST_i   : IN STD_LOGIC;
             TCK_i    : IN STD_LOGIC;
             scan_en_o  : OUT STD_LOGIC;
             data_in_i  : IN std_logic_vector(31 DOWNTO 0);
             data_out_o  : OUT std_logic_vector(31 DOWNTO 0)    
            );
end tapc_e;

