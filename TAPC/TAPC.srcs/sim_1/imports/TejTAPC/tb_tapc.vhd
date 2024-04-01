library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_tapc_e is
end tb_tapc_e;

architecture tb_tapc_a of tb_tapc_e is

  signal TMS_i, TRST_i, TCK_i, TDI_i : STD_LOGIC := '0';
  signal mode_s : STD_LOGIC;
  signal instr_i : std_logic_vector(2 DOWNTO 0);
  signal data_in_i : std_logic_vector(31 DOWNTO 0);
  
    -- Instantiate the tapc_e entity
    COMPONENT tapc_e
     port ( TDI_i    : IN STD_LOGIC;
             TMS_i    : IN STD_LOGIC;   
             TRST_i   : IN STD_LOGIC;
             TCK_i    : IN STD_LOGIC;
             instr_i  : IN std_logic_vector(2 DOWNTO 0);
             data_in_i  : IN std_logic_vector(31 DOWNTO 0)   
            );
    end COMPONENT;

begin

  -- Instantiate the tapc_e entity
    uut: tapc_e port map(TMS_i  => TMS_i,
                        TRST_i => TRST_i,
                        TCK_i  => TCK_i,
                        TDI_i  => TDI_i,
                        data_in_i  => data_in_i,
                        instr_i => instr_i
                        );

process
begin
        TCK_i <= '0';
        wait for 5 ns;
        TCK_i <= '1';
        wait for 5 ns;
    end process; 

process
begin
               
    --TLR 
    TRST_i <= '0'; 
    TDI_i <= '0';
    TMS_i <= '1'; --TLR
    wait for 20ns;
    
    --RTI   
    TMS_i <= '0'; --RTI
    wait for 20ns;
    
--    --instr 111 
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TDI_i <= '1';
--    TMS_i <= '0'; --captureir
--    wait for 10ns;
    
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TDI_i <= '0';
--    TMS_i <= '0'; --RTI
--    wait for 50ns;
    
--    --instr 110 
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TMS_i <= '0'; --captureir
--    wait for 10ns;
    
--    TDI_i <= '1';
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;    
    
--    TDI_i <= '0';
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TMS_i <= '0'; --RTI
--    wait for 50ns;
    
--    --instr 101
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TMS_i <= '0'; --captureir
--    wait for 10ns;
    
--    TDI_i <= '1';
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TDI_i <= '0';
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;    
    
--    TDI_i <= '1';
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TDI_i <= '0';
--    TMS_i <= '0'; --RTI
--    wait for 50ns;
    
--    --instr 100 
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TMS_i <= '0'; --captureir
--    wait for 10ns;
    
--    TDI_i <= '1';
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TDI_i <= '0';
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;    
    
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TMS_i <= '0'; --RTI
--    wait for 50ns;
    
--    --instr 011 
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TMS_i <= '0'; --captureir
--    wait for 10ns;

--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TDI_i <= '1';
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;  
                 
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TDI_i <= '0';
--    TMS_i <= '0'; --RTI
--    wait for 50ns;
    
--    --instr 010 
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TMS_i <= '0'; --captureir
--    wait for 10ns;

--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TDI_i <= '1';
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;  
                 
--    TDI_i <= '0';
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TMS_i <= '0'; --RTI
--    wait for 50ns;
    
--    --instr 001 
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TMS_i <= '0'; --captureir
--    wait for 10ns;

--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;  
                 
--    TDI_i <= '1';
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TDI_i <= '0';
--    TMS_i <= '0'; --RTI
--    wait for 50ns;
    
--    --bypass 
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TMS_i <= '0'; --captureir
--    wait for 10ns;
    
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TMS_i <= '0'; --rti
--    TDI_i <= '1';
--    wait for 10ns;
    
--    TDI_i <= '0';
--    wait for 10ns;
    
--    TDI_i <= '1';
--    wait for 10ns;
    
--    TDI_i <= '0';
--    wait for 10ns;
    
--    TDI_i <= '1';
--    wait for 10ns;
    
--    TDI_i <= '0';
--    wait for 20ns;
    
--    TDI_i <= '1';
--    wait for 20ns;
    
--    TDI_i <= '0';
--    wait for 40ns;
    
--    TDI_i <= '1';
--    wait for 40ns;
    
--    TDI_i <= '0';
--    wait for 20ns;
    
--    --sample   
--    TMS_i <= '1'; --SelectDRScan
--    wait for 10ns; 
    
--    TMS_i <= '1'; --selectirscan
--    wait for 10ns;
    
--    TMS_i <= '0'; --captureir
--    wait for 10ns;

--    TMS_i <= '0'; --shiftir
--    wait for 10ns;
    
--    TDI_i <= '1';
--    TMS_i <= '0'; --shiftir
--    wait for 10ns;  
                 
--    TDI_i <= '0';
--    TMS_i <= '1'; --exit1ir
--    wait for 10ns;
    
--    TMS_i <= '1'; --updateir
--    wait for 10ns;
    
--    TMS_i <= '0'; --RTI
--    wait for 50ns;
    
--    TMS_i <= '1'; --selectdrscan
--    wait for 10ns;
    
--    data_in_i <= "11011110101011011011111011101111";
--    TMS_i <= '0'; --capturedr
--    wait for 10ns;
    
--    TMS_i <= '1'; --exit1dr
--    wait for 10ns;
    
--    TMS_i <= '1'; --updatedr
--    wait for 10ns;
    
--    TMS_i <= '0'; --rti
--    wait for 10ns;
    
     
  --preload     

    TMS_i <= '1'; --SelectDRScan
    wait for 10ns; 
    
    TMS_i <= '1'; --selectirscan
    wait for 10ns;
    
    TMS_i <= '0'; --captureir
    wait for 10ns;

    TMS_i <= '0'; --shiftir
    wait for 10ns;
    
    TMS_i <= '0'; --shiftir
    wait for 10ns;  
                 
    TDI_i <= '1';
    TMS_i <= '1'; --exit1ir
    wait for 10ns;
    
    TMS_i <= '1'; --updateir
    wait for 10ns;
    
    TDI_i <= '0';
    TMS_i <= '0'; --RTI
    wait for 50ns;
--    TDI_i <= '1';
--    wait for 320ns;
    
    TMS_i <= '1'; --selectdrscan
    wait for 10ns;
    
    TMS_i <= '0'; --capturedr
    wait for 10ns;
    
    TDI_i <= '1';
    TMS_i <= '0'; --shiftdr
    wait for 320ns;
    
    TDI_i <= '0'; 
    TMS_i <= '1'; --exit1dr
    wait for 10ns;
    
    TMS_i <= '1'; --updatedr
    wait for 10ns;
    
    TMS_i <= '0'; --rti
    wait for 350ns;
 
end process; 
end tb_tapc_a;
