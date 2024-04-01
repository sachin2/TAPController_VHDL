
architecture datareg_a of datareg_e is

 signal datareg1_s : std_logic_vector(31 DOWNTO 0);
 signal datareg2_s : std_logic_vector(31 DOWNTO 0);
 signal buff_s : std_logic_vector(32 DOWNTO 0);
 signal bypass_reg_s: std_logic;
 
begin
    buff_s(0) <= TDI_i;
    bypass_reg_s <= TDI_i;
   DR_mux: process(TCK_i, drmux_i)
    begin
      if rising_edge(TCK_i) then
        if drmux_i = '1' then -- BYPASS
           TDO_o <= bypass_reg_s;
        else
           TDO_o <= buff_s(32); 
        end if; 
      end if;     
    end process;
  gen_R1: for i in 0 to 31 generate
    CAPTURE: process(TCK_i, shift_dr_i, clock_dr_i)
    begin
      if rising_edge(clock_dr_i) then
        if shift_dr_i = '1' then
          datareg1_s(i) <= buff_s(i);
        else
          datareg1_s(i) <= data_in_i(i);  
        end if;
      end if; 
    end process; 
    buff_s(i+1) <= datareg1_s(i);
    UPDATE: process(TCK_i, update_dr_i, mode_i)
    begin
      if rising_edge(update_dr_i) then
        datareg2_s(i) <= datareg1_s(i);
      end if;
      if mode_i = '1' then
        data_out_o(i) <= datareg2_s(i);
      else
        data_out_o(i) <= data_in_i(i);
      end if;
    end process;  
  end generate gen_R1;   
end datareg_a;
