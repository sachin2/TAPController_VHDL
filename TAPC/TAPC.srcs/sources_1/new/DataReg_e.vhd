library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity datareg_e is
   port ( TCK_i  : IN STD_LOGIC;
       TDI_i    : IN STD_LOGIC;
       TDO_o    : OUT STD_LOGIC;
       mode_i    : IN STD_LOGIC;
       clock_dr_i  : IN STD_LOGIC;
       shift_dr_i  : IN STD_LOGIC;
       update_dr_i : IN STD_LOGIC;
       data_in_i  : IN std_logic_vector(31 DOWNTO 0);
       data_out_o  : OUT std_logic_vector(31 DOWNTO 0);
       drmux_i     : IN STD_LOGIC   
      );
end datareg_e;