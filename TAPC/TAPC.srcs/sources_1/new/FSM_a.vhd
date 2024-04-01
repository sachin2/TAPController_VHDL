
architecture fsm_a of fsm_e is

type FSM_state is ( TLR,RTI,Select_DRScan,CaptureDR,ShiftDR,Exit1DR,PauseDR,Exit2DR,UpdateDR,
                     Select_IRScan,CaptureIR,ShiftIR,Exit1IR,PauseIR,Exit2IR,UpdateIR);

  signal FSM_state_r, nstate : FSM_state;
 
begin 
    process(TRST_i, TCK_i)
    begin
        if TRST_i = '1' then
            FSM_state_r <= TLR;
        elsif rising_edge(TCK_i) then
            FSM_state_r <= nstate;
        end if;
     end process;
     
     FSM: process(FSM_state_r, TMS_i)
     begin
            case FSM_state_r is             
	           when TLR =>
                    if TMS_i = '1' then
                        nstate <= TLR;
                    else
                        nstate <= RTI;
                    end if; 
           
	           when RTI =>
                    if TMS_i = '1' then
                        nstate <= Select_DRScan;
                    else
                        nstate <= RTI;
                    end if;
                 
	           when Select_DRScan =>
                    if TMS_i = '1' then
                        nstate <= Select_IRScan;
                    else
                        nstate <= CaptureDR;
                    end if;
                   
               when Select_IRScan =>
                    if TMS_i = '1' then
                        nstate <= TLR; 
                    else
                        nstate <= CaptureIR;
                    end if;
     
	           when CaptureIR =>
                    if TMS_i = '1' then
                        nstate <= Exit1IR;
                    else
                        nstate <= ShiftIR;
                    end if;
     
	           when ShiftIR =>
                    if TMS_i = '1' then                      
                        nstate <= Exit1IR;
                    else
                        nstate <= ShiftIR;
                    end if;
    
	           when Exit1IR =>
                    if TMS_i = '1' then
                        nstate <= UpdateIR;
                    else
                        nstate <= PauseIR;
                    end if;
                    
	           when PauseIR =>
                    if TMS_i = '1' then
                        nstate <= Exit2IR;
                    else
                        nstate <= PauseIR;
                    end if;
     
	           when Exit2IR =>
                    if TMS_i = '1' then
                        nstate <= UpdateIR;
                    else
                        nstate <= ShiftIR;
                    end if;
                    
	           when UpdateIR =>
                    if TMS_i = '1' then
                        nstate <= Select_DRScan;
                    else
                        nstate <= RTI;
                    end if;
               
	           when CaptureDR =>
                    if TMS_i = '1' then
                       nstate <= Exit1DR;
                    else
                       nstate <= ShiftDR;
                    end if;
                                         
	           when ShiftDR =>
                    if TMS_i = '1' then
                        nstate <= Exit1DR;
                    else
                        nstate <= ShiftDR;
                    end if;
                               
	           when Exit1DR =>
                    if TMS_i = '1' then
                        nstate <= UpdateDR;
                    else
                        nstate <= PauseDR;
                    end if;
            
	           when PauseDR =>
                    if TMS_i = '1' then
                        nstate <= Exit2DR;
                    else
                        nstate <= PauseDR;
                    end if;
    
	           when Exit2DR =>
                    if TMS_i = '1' then
                        nstate <= UpdateDR;
                    else
                        nstate <= ShiftDR;
                    end if;
    
	           when UpdateDR =>
                    if TMS_i = '1' then
                        nstate <= Select_DRScan;
                    else
                        nstate <= RTI;
                    end if;
	        
	          when others =>
              nstate <= TLR;
          end case;
        end process;
     
     State: process(TCK_i, FSM_state_r, drmux_i, Mode1_i, Mode2_i)
     begin 
        case FSM_state_r is
        when CaptureIR =>
            shift_ir_o <= '1';
            clock_ir_o <= TCK_i;
            update_ir_o <= '0';
            SelectIR_o <= '0';
        when ShiftIR => 
            shift_ir_o <= '1';
            clock_ir_o <= TCK_i;
            update_ir_o <= '0';
            SelectIR_o <= '1';
        when UpdateIR =>
            shift_ir_o <= '1';
            clock_ir_o <= '0';
            update_ir_o <= TCK_i;
            SelectIR_o <= '0';
--            if drmux_i = '0' then 
--                if Mode1_i = '1' then -- PRELOAD
--                     mode_o <= '0';
--                     shift_dr_o <= '0';
--                     clock_dr_o <= TCK_i;
--                     update_dr_o <= '0';
--                     SelectIR_o <= '0';
--                elsif Mode2_i = '1' then -- SAMPLE
--                     mode_o <= '0';         
--                     shift_dr_o <= '0';
--                     clock_dr_o <= TCK_i;
--                     update_dr_o <= '0';  
--                     SelectIR_o <= '0';
--                end if;
--            else --BYPASS & SCAN
--                shift_dr_o <= '0';
--                clock_dr_o <= '0';
--                update_dr_o <= '0';
--                mode_o <= '0';    
--                SelectIR_o <= '0';
--            end if;
        when CaptureDR =>
            mode_o <= '0';
            shift_dr_o <= '0';
            clock_dr_o <= TCK_i;
            update_dr_o <= '0';
            SelectIR_o <= '0';
        when ShiftDR =>
            mode_o <= '0';
            shift_dr_o <= '1';
            clock_dr_o <= TCK_i;
            update_dr_o <= '0';
            SelectIR_o <= '0';
        when UpdateDR => 
            mode_o <= '1'; 
            shift_dr_o <= '1'; 
            clock_dr_o <= '0';
            update_dr_o <= TCK_i;
            SelectIR_o <= '0';
--        when RTI =>        
--            shift_dr_o <= '1';
--            clock_dr_o <= '0';
--            update_dr_o <= '0';
--            mode_o <= '0';    
--            SelectIR_o <= '0';
--        when PauseDR =>
--            mode_o <= '0';         
--            shift_dr_o <= '0';
--            clock_dr_o <= TCK_i;
--            update_dr_o <= '0';  
--            SelectIR_o <= '0';
        when others =>
            shift_ir_o <= '0';
            clock_ir_o <= '0';
            update_ir_o <= '0';
            shift_dr_o <= '0'; 
            clock_dr_o <= '0';
            update_dr_o <= '0';
            mode_o <= '0';
            SelectIR_o <= '0';
       end case;
     end process; 
--   DR_Instr: process(drmux_i, Mode1_i, Mode2_i)
--    begin
--     if drmux_i = '0' then 
--        if Mode1_i = '1' then -- PRELOAD
--           FSM_state_r <= CaptureDR;
--        elsif Mode2_i = '1' then -- SAMPLE
--           FSM_state_r <= PauseDR;
--        end if;
--     else --BYPASS & SCAN
--       FSM_state_r <= RTI;
--     end if;       
--    end process; 
end fsm_a;
