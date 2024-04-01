
architecture tapc_a of tapc_e is

component fsm_e
      port ( TMS_i    : IN STD_LOGIC;   
             TRST_i   : IN STD_LOGIC;
             TCK_i    : IN STD_LOGIC;
             SelectIR_o  : OUT STD_LOGIC;
             clock_ir_o  : OUT STD_LOGIC;
             shift_ir_o  : OUT STD_LOGIC;
             update_ir_o : OUT STD_LOGIC;
             clock_dr_o  : OUT STD_LOGIC;
             shift_dr_o  : OUT STD_LOGIC;
             update_dr_o : OUT STD_LOGIC; 
             mode_o      : OUT STD_LOGIC;
             Mode1_i     : IN STD_LOGIC;
             Mode2_i     : IN STD_LOGIC; 
             drmux_i     : IN STD_LOGIC   
            );
end component;

component datareg_e
      port ( TCK_i   : IN STD_LOGIC;
           TDI_i    : IN STD_LOGIC;
           TDO_o    : OUT STD_LOGIC;
           data_in_i  : IN std_logic_vector(31 DOWNTO 0);
           data_out_o  : OUT std_logic_vector(31 DOWNTO 0);
           mode_i    : IN STD_LOGIC;
           clock_dr_i  : IN STD_LOGIC;
           shift_dr_i  : IN STD_LOGIC;
           update_dr_i : IN STD_LOGIC;
           drmux_i     : IN STD_LOGIC  
            );
end component;

component instrreg_e          
      port ( TDI_i    : IN STD_LOGIC;
           TDO_o    : OUT STD_LOGIC;
           instr_i   : IN std_logic_vector(2 DOWNTO 0);
           clock_ir_i  : IN STD_LOGIC;
           shift_ir_i  : IN STD_LOGIC;
           update_ir_i : IN STD_LOGIC;
           Mode1_o     : OUT STD_LOGIC;
           Mode2_o     : OUT STD_LOGIC;  
           Mode3_o     : OUT STD_LOGIC; 
           drmux_o     : OUT STD_LOGIC 
          );
end component;
  
  signal SelectIR_s  : STD_LOGIC;
  signal shift_ir_s  : STD_LOGIC;
  signal shift_dr_s  : STD_LOGIC;
  signal update_ir_s : STD_LOGIC;
  signal update_dr_s : STD_LOGIC;
  signal clock_dr_s  : STD_LOGIC;
  signal clock_ir_s  : STD_LOGIC;
  signal mode_s  : STD_LOGIC;
  signal Mode1_s  : STD_LOGIC;
  signal Mode2_s  : STD_LOGIC;
  signal Mode3_s  : STD_LOGIC;
  signal drmux_s  : STD_LOGIC;
  signal TDO_data_s  : STD_LOGIC;
  signal TDO_instr_s  : STD_LOGIC;
 
begin 

FSM: fsm_e PORT MAP(TMS_i => TMS_i,
                   TRST_i => TRST_i,
                   TCK_i => TCK_i,
                   SelectIR_o => SelectIR_s,
                   clock_ir_o => clock_ir_s,
                   shift_ir_o => shift_ir_s,
                   update_ir_o => update_ir_s,
                   clock_dr_o => clock_dr_s,
                   shift_dr_o => shift_dr_s,
                   update_dr_o => update_dr_s,
                   mode_o => mode_s,
                   Mode1_i => Mode1_s,
                   Mode2_i => Mode2_s,
                   drmux_i => drmux_s
                  );

DR: datareg_e PORT MAP(TCK_i => TCK_i,
                       TDI_i => TDI_i,
                       TDO_o => TDO_data_s,
                       data_in_i => data_in_i,
                       data_out_o => data_out_o,
                       clock_dr_i => clock_dr_s,
                       shift_dr_i => shift_dr_s,
                       update_dr_i => update_dr_s,
                       mode_i => mode_s,
                       drmux_i => drmux_s
                      );
IR: instrreg_e PORT MAP(TDI_i => TDI_i,
                       TDO_o => TDO_instr_s,
                       instr_i => instr_i,
                       clock_ir_i => clock_ir_s,
                       shift_ir_i => shift_ir_s,
                       update_ir_i => update_ir_s,
                       Mode1_o => Mode1_s,
                       Mode2_o => Mode2_s,
                       Mode3_o => Mode3_s,
                       drmux_o => drmux_s
                       );
  
   scan_en_o <= Mode3_s;                      
   TDO_Update: process(TCK_i, SelectIR_s)
   begin
      if falling_edge(TCK_i) then
        if SelectIR_s = '1' then 
           TDO_o <= TDO_instr_s;
        else
           TDO_o <= TDO_data_s; 
        end if; 
      end if;     
    end process;                                          
end tapc_a;
