library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity project_reti_logiche is
    port(
        i_clk : in std_logic;
        i_rst : in std_logic;
        i_start : in std_logic;
        i_w : in std_logic;
    
        o_z0 : out std_logic_vector(7 downto 0);
        o_z1 : out std_logic_vector(7 downto 0);
        o_z2 : out std_logic_vector(7 downto 0);
        o_z3 : out std_logic_vector(7 downto 0);
        o_done : out std_logic;
    
        o_mem_addr : out std_logic_vector(15 downto 0);
        i_mem_data : in std_logic_vector(7 downto 0);
        o_mem_we : out std_logic;
        o_mem_en : out std_logic
        );
end project_reti_logiche;


--ARCHITETTURA
architecture project_reti_logiche_arch of project_reti_logiche is
    
    -- Sx       RESET               --> viene resettata la macchina
    -- S0       WAIT_START          --> attendiamo il segnale di start
    -- S1       W_READ              --> leggiamo i valori in ingresso su w
    -- S2       CREATE_ADDRESS      --> costruiamo l'indirizzo di memoria correttamente paddato
    -- S3       ASK_MEM             --> forniamo l'indirizzo di memoria costruito alla memoria stessa
    -- S4       READ_MEM            --> leggiamo il dato proveniente dalla memoria
    -- S5       REG_MEM_WRITE       --> scriviamo sul registro reg mem
    -- S6       REG_OUT_WRITE       --> in base all'uscita scelta, scrivo nel suo registro
    -- S7       OUT_WRITE           --> mando in uscita 
    -- S8       OUT_SEND
    -- S9       OUT_DONE
    -- S10      OUT_OK
    
    type S is (RESET, WAIT_START, W_READ, CREATE_ADDRESS, ASK_MEM, READ_MEM, REG_MEM_WRITE, REG_OUT_WRITE, OUT_WRITE, OUT_SEND, OUT_DONE, OUT_OK);
    
    
    signal cur_state    : S;
    signal next_state   : S;
    
    signal flag_shift   : std_logic;    
    signal reg_mem_load : std_logic;

    signal reg_out      : std_logic;
    
    signal done_ok      : std_logic;
        
    signal reg_mem_data : std_logic_vector(7 downto 0);    
    
    signal reg1_data    : std_logic_vector(15 downto 0) := "0000000000000000";    
    signal reg3_data    : STD_LOGIC_VECTOR(1 downto 0) := "00";    
    
    signal regz0_data : std_logic_vector(7 downto 0);     
    signal regz1_data : std_logic_vector(7 downto 0);       
    signal regz2_data : std_logic_vector(7 downto 0);       
    signal regz3_data : std_logic_vector(7 downto 0);       
    
    signal shift_counter  : STD_LOGIC_VECTOR(4 downto 0)     := "00001";   
    signal count          : STD_LOGIC_VECTOR(4 downto 0)     := "00000";
    
    
begin    
    --nuovo processo per contare
    process(i_rst, i_clk, i_start, done_ok)
        begin
                if (i_rst = '1' or done_ok = '1') then 
                    count <= "00000";
                elsif (i_clk'event and i_clk = '1' and i_start = '1') then                                         
                    count <= count + shift_counter;
                end if;
      end process;              
                              
    --lettura da w, count è ciò che effettivamente "contiene" il valore del contatore.
    --mux_ingressi
    process(i_clk, i_rst)
        begin
            if (i_rst = '1') then
                     reg3_data <= "00";
                     reg1_data <= "0000000000000000";
            elsif (i_clk'event and i_clk = '1') then
                if(i_start = '1' and i_rst = '0') then   
                    case count is
                        --reg3: valore del canale di uscita
                        when "00000" => 
                            reg3_data(1) <= i_w;
                        when "00001" => 
                            reg3_data(0) <= i_w;
                        
                        --reg1 valore indirizzo di memoria      
                        when "00010" => 
                            reg1_data(15) <= i_w;    
                        when "00011" => 
                            reg1_data(14) <= i_w;       
                        when "00100" => 
                            reg1_data(13) <= i_w;       
                        when "00101" => 
                            reg1_data(12) <= i_w;       
                        when "00110" => 
                            reg1_data(11) <= i_w;       
                        when "00111" => 
                            reg1_data(10) <= i_w;       
                        when "01000" => 
                            reg1_data(9) <= i_w;       
                        when "01001" => 
                            reg1_data(8) <= i_w;       
                        when "01010" => 
                            reg1_data(7) <= i_w;       
                        when "01011" => 
                            reg1_data(6) <= i_w;       
                        when "01100" => 
                            reg1_data(5) <= i_w;       
                        when "01101" => 
                            reg1_data(4) <= i_w;       
                        when "01110" => 
                            reg1_data(3) <= i_w;       
                        when "01111" => 
                            reg1_data(2) <= i_w;       
                        when "10000" => 
                            reg1_data(1) <= i_w;       
                        when "10001" => 
                            reg1_data(0) <= i_w;       
                                            
                        when others => reg1_data <= "XXXXXXXXXXXXXXXX";            
                                                                                                    
                    end case;
              end if;
          end if;
     end process;
      
      
      --questo è il processo con cui calcoliamo l'indirizzo di memoria paddato.
      process(i_clk, i_start, i_rst)  
        variable number_shift : std_logic_vector(0 to 4);
        begin
           if (i_rst = '1') then              
             number_shift := "00000";
           elsif (i_clk'event and i_clk = '1') then                                        
             if(i_start = '0' and i_rst = '0' and flag_shift = '1') then 
                number_shift := STD_LOGIC_VECTOR ( UNSIGNED(count) - UNSIGNED(shift_counter) - UNSIGNED(shift_counter) - UNSIGNED(shift_counter)); 
                o_mem_addr <= std_logic_vector( shift_right( unsigned(reg1_data), to_integer( 15 - UNSIGNED(number_shift) ) ) ); --qui shiftiamo e paddiamo
              end if;
           end if;
    
      end process; 
      
      
      
    
   -- processo reg_mem: reset e salvataggio del registro reg_mem, qui ci va il dato ricevuto dalla memoria 
    process(reg_mem_load, i_clk, i_rst)
    begin 
        if(i_rst = '1') then
            reg_mem_data <= "00000000";
        elsif (i_clk'event and i_clk = '1') then          
            if(reg_mem_load = '1') then               
                reg_mem_data <= i_mem_data;
            end if;
        end if;
    end process;
    
    
    -- processo che salva nel registro di uscita corretto il valore proveniente dalla memoria 
      process(reg_out, i_clk, i_rst)
        begin
           if(i_rst = '1') then
             regz0_data <= "00000000";
             regz1_data <= "00000000";
             regz2_data <= "00000000";
             regz3_data <= "00000000";
           elsif (i_clk'event and i_clk = '1') then
                if(reg_out = '1') then      
                   case reg3_data is
                     when "00" => regz0_data <= reg_mem_data;
                     when "01" => regz1_data <= reg_mem_data;  
                     when "10" => regz2_data <= reg_mem_data;
                     when "11" => regz3_data <= reg_mem_data;
                     
                     when others => null; 
                   end case;             
            end if;
           end if; 
        end process;
        
        
    --OUT SENDER PROCESS
    --in questo processo mostriamo i valori sui reali canali di sucita (o_z1 ecc) quando done_ok = 1. 
    process(i_clk, i_rst, done_ok)
    begin
     if(i_rst = '1') then
         o_z0 <= "00000000";
         o_z1<=  "00000000";
         o_z2 <= "00000000";
         o_z3 <= "00000000";
     elsif (i_clk'event and i_clk = '1') then
         if(done_ok = '1') then    
            o_z0 <= regz0_data;
            o_z1<=  regz1_data;
            o_z2 <= regz2_data;
            o_z3 <= regz3_data;
         elsif(done_ok = '0') then
            o_z0 <= "00000000";
            o_z1<=  "00000000";
            o_z2 <= "00000000";
            o_z3 <= "00000000";
         end if;
      end if; 
    end process;
    
    
    --CHECK RESET PROCESS
    -- modifica stato e controllo del reset che può arrivare in ogni momento
    process(i_clk, i_rst)
    begin
           if(i_rst = '1') then
               cur_state <= RESET;
           elsif (i_clk'event and i_clk = '1') then
               cur_state <= next_state;
           end if;
    end process;    
    
    -- calcolo del nuovo next state (si "attiva" quando cur_state è modificato dalla funzione sopra)
    --NEXT STATE PROCESS
    process(cur_state, i_start, i_rst, i_clk)
    begin
           next_state <= cur_state;
           case cur_state is
                              
               when RESET =>                    
                   if i_rst = '0' then
                       next_state <= WAIT_START;    
                   end if;
                                
               when WAIT_START =>
                   if i_start = '1' then
                        next_state <= W_READ;       
                   elsif i_rst = '1' then
                        next_state <= RESET;
                   end if;
               
                when W_READ =>
                   if i_start = '0' then
                        next_state <= CREATE_ADDRESS;   
                   elsif i_rst = '1' then
                        next_state <= RESET;
                   end if;
               
               when CREATE_ADDRESS =>
                   if i_start = '0' then
                       next_state <= ASK_MEM;      
                   elsif i_rst = '1' then
                       next_state <= RESET;
                   end if;
               
               when ASK_MEM =>
                    if i_rst = '1' then
                        next_state <= RESET;
                    else
                        next_state <= READ_MEM;
                    end if;
                   
               when READ_MEM =>
                    if i_rst = '1' then
                        next_state <= RESET;
                    else
                        next_state <= REG_MEM_WRITE;                
                    end if;
                    
               when REG_MEM_WRITE =>
                    if i_rst = '1' then
                        next_state <= RESET;
                    else
                        next_state <= REG_OUT_WRITE;
                    end if;
                    
               when REG_OUT_WRITE =>
                    if i_rst = '1' then
                        next_state <= RESET;
                    else
                        next_state <= OUT_WRITE;
                    end if;
                    

               when OUT_WRITE =>
                   if done_ok = '1' then 
                       next_state <= OUT_SEND;
                   elsif i_rst = '1' then
                       next_state <= RESET;
                   end if;
                   
                when OUT_SEND =>
                   if i_rst = '1' then 
                       next_state <= RESET;
                   else
                       next_state <= OUT_DONE;
                   end if;   
                
                when OUT_DONE =>
                    if i_rst = '1' then
                        next_state <= RESET;
                    else
                        next_state <= OUT_OK;
                    end if;
                    
                when OUT_OK =>
                    if i_rst = '1' then
                        next_state <= RESET;
                    else
                        next_state <= WAIT_START;
                    end if;
           end case;
    end process;   
              
    --CURRENT STATE PROCESS
    process(cur_state) 
       begin
            flag_shift <= '0'; 
            reg_mem_load <= '0';                          
            reg_out <= '0';            
            o_mem_en <= '0';
            o_mem_we <= '0';
            o_done <= '0';
            
            case cur_state is
                when RESET =>           
                            flag_shift <= '0'; 

                            reg_mem_load <= '0';                     
                                                                                  
                            reg_out <= '0';
                            
                            --o_mem_addr <= "0000000000000000";
                   
                            o_mem_en <= '0';
                            o_mem_we <= '0';
                                                     
                            --done_ok <= '0';             
                            
                when WAIT_START =>      
                when W_READ =>                                             
                when CREATE_ADDRESS =>
                    flag_shift <= '1'; 
                when ASK_MEM =>         
                    o_mem_en <= '1';
                    flag_shift <= '0';                                        
                when READ_MEM =>            
                    reg_mem_load <= '1';                  
                when REG_MEM_WRITE =>
                    reg_mem_load <= '0';
                    o_mem_en <= '0';
                when REG_OUT_WRITE =>
                    reg_out <= '1';
                when OUT_WRITE =>               
                    done_ok <= '1';
                when OUT_SEND =>
                    reg_out <= '0';                    
                when OUT_DONE =>
                    o_done <= '1';
                    done_ok <= '0';
                when OUT_OK =>
                    done_ok <= '0';
                    
                    
           end case;
        end process;
       
     
end project_reti_logiche_arch;
