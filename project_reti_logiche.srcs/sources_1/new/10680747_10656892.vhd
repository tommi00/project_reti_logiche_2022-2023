library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--ENTITY
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
    
    -- Sx       RESET
    -- S0       WAIT_START
    -- S1       W_READ
    -- S NUOVO  CREATE_ADDRESS
    -- S2       ASK_MEM
    -- S3       READ_MEM
    --          REG_MEM_WRITE       --> scriviamo sul registro reg mem
    --          REG_OUT_WRITE       --> in base all'uscita scelta, scrivo nel suo registro
    -- S4       OUT_WRITE           --> mando in uscita 
    --          OUT_SEND
    -- S5       OUT_DONE
    
    type S is (RESET, WAIT_START, W_READ, CREATE_ADDRESS, ASK_MEM, READ_MEM, REG_MEM_WRITE, REG_OUT_WRITE, OUT_WRITE, OUT_SEND, OUT_DONE, OUT_OK);

    signal cur_state    : S;
    signal next_state   : S;
    
    signal flag_shift   : std_logic;
    
    signal test     : std_logic := '0';

    
    signal reg_mem_load : std_logic;
    signal reg3_load    : std_logic;
    signal reg_out      : std_logic;
    
    signal done_ok      : std_logic;
        
    signal reg_mem_data : std_logic_vector(7 downto 0);     -- segnale uscita reg memoria
    
    signal reg1_data    : std_logic_vector(15 downto 0) := "0000000000000000";    -- segnale uscita reg1    17...2 di W
    signal reg3_data    : STD_LOGIC_VECTOR(1 downto 0) := "00";     -- segnale uscita reg3
    
    signal regz0_data : std_logic_vector(7 downto 0);       -- segnale uscita reg z0
    signal regz1_data : std_logic_vector(7 downto 0);       -- segnale uscita reg z1
    signal regz2_data : std_logic_vector(7 downto 0);       -- segnale uscita reg z2
    signal regz3_data : std_logic_vector(7 downto 0);       -- segnale uscita reg z3
    
    signal shift_counter  : STD_LOGIC_VECTOR(4 downto 0)     := "00001";   --qui salviamo la costante 1 per la sottrazione
    signal count          : STD_LOGIC_VECTOR(4 downto 0)     := "00000";
    
    signal NUM1 :  STD_LOGIC_VECTOR (4 downto 0) := "01000";
    signal NUM2 :  STD_LOGIC_VECTOR (4 downto 0) := "00001";
    
begin    
    --nuovo processo per contare
      process(i_rst, i_clk, i_start, done_ok)
            begin
                if (i_rst = '1' or done_ok = '1') then 
                    count <= "00000";
                elsif (i_clk'event and i_clk = '1' and i_start = '1') then 
                    --count <= STD_LOGIC_VECTOR (UNSIGNED(count) + UNSIGNED (shift_counter) );
                    NUM1 <= NUM1 + NUM2;
                    count <= count + shift_counter;
                end if;
      end process;
      
      
--    --questo dovrebbe essere il processo in cui viene aggiornato il contatore 
--      process(i_clk, i_start)   --il nostro processo di questo registro è sensibile al segnale di reset e al clock                                 
--         begin                     -- Processo sequenziale perchè sto facendo esattamente una memoria, un registro
--             if (i_rst = '1') then               --per prima cosa vado a verificare se c'è stato un reset
--                  inc_in_port <= "00000";
--               elsif (i_clk'event and i_clk = '1') then      -- Non dimenticarsi il 'event, altrimenti vengono generati dei latch                                    
--                  if(i_start = '1' and i_rst = '0') then  -- lavora, e quindi incrementa, solo se start = 1
--                        inc_in_port <= inc_out_port;
--                  end if;
--                end if;
--            end process;

                  
                    
                  --count, non più inc_in/inc_in_port
    --lettura da w, inc_in è ciò che effettivamente "contiene" il valore del contatore.
    process(i_clk)
        begin
            if (i_rst = '1') then
                     --reg3_data <= "00";
                     --reg1_data <= "0000000000000000";
            elsif (i_clk'event and i_clk = '1') then
                if(i_start = '1' and i_rst = '0') then   
                    case count is
                        --reg3 valore uscita
                        when "00000" => 
                            reg3_data(1) <= i_w;
                        when "00001" => 
                            reg3_data(0) <= i_w;
                        
                        --reg1 valore indirizzo                  
                        when "00010" => 
                            reg1_data(15) <= i_w;     --salviamo in reg1 l'indirizzo di memoria non ancora paddato dalla cima, in ordine
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
                                            
                        when others => reg1_data <= "XXXXXXXXXXXXXXXX";            -- Non dimenticarsi il caso base, se non lo metto, lui intende che negli 
                                                                                                    -- altri casi io voglia mantenere il valore precedente e genera quindi un latch. alternativamente metterlo prima del case
                    end case;
              end if;
          end if;
     end process;
      
      
       --questo è il processo con cui calciamo l'indirizzo di memoria con shift ecc.
      process(i_clk, i_start)  
        variable number_shift : std_logic_vector(0 to 4);
        begin
           if (i_rst = '1') then               --per prima cosa vado a verificare se c'è stato un reset
             number_shift := "00000";
           elsif (i_clk'event and i_clk = '1') then      -- Non dimenticarsi il 'event, altrimenti vengono generati dei latch                                    
             if(i_start = '0' and i_rst = '0' and flag_shift = '1') then 
                number_shift := STD_LOGIC_VECTOR ( UNSIGNED(count) - UNSIGNED(shift_counter) - UNSIGNED(shift_counter) - UNSIGNED(shift_counter)); --qui calcoliamo counter - 3
                o_mem_addr <= std_logic_vector( shift_right( unsigned(reg1_data), to_integer( 15 - UNSIGNED(number_shift) ) ) ); --qui shiftiamo e paddiamo
              end if;
           end if;
    
      end process; 
      
      
      
    
   -- processo reg_mem: reset e salvataggio del registro reg_mem, qui ci va il dato ricevuto dalla memoria 
    process(reg_mem_load, i_clk, i_rst)
    begin 
        if(i_rst = '1') then
            reg_mem_data <= "00000000";
        elsif (i_clk'event and i_clk = '1') then          --se sale clock 
            if(reg_mem_load = '1') then                 -- se reg mem load = 1
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
                if(reg_out = '1') then      --regz0_data <= demux00_data;
                   case reg3_data is
                     when "00" => regz0_data <= reg_mem_data;
                     when "01" => regz1_data <= reg_mem_data;  
                     when "10" => regz2_data <= reg_mem_data;
                     when "11" => regz3_data <= reg_mem_data;
                     
                     when others => null; --per non eseguire nessuna azione
                   end case;             
            end if;
           end if; 
        end process;
        
        
    --OUT SENDER PROCESS
    --in questo processo mostriamo i valori sulle uscite vere (o_z1 ecc) quando done_ok = 1. 
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
               
               -- quando rst=0, si passa allo stato wait_start
               when RESET =>                    
                   if i_rst = '0' then
                       next_state <= WAIT_START;    --s0
                   end if;
                   
               -- quando start = 1 -> vai a w_read
               when WAIT_START =>
                   if i_start = '1' then
                        next_state <= W_READ;       --s1
                   elsif i_rst = '1' then
                        next_state <= RESET;
                   end if;
               
                when W_READ =>
                   if i_start = '0' then
                        next_state <= CREATE_ADDRESS;   --NUOVO STATO PER CREARE INDIRIZZO
                   elsif i_rst = '1' then
                        next_state <= RESET;
                   end if;
               
               when CREATE_ADDRESS =>
                   if i_start = '0' then
                       next_state <= ASK_MEM;       --s2
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
                        --count <= "00000";
                        --NUM1 <= "00000";
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
    process(cur_state) --quando arriva il reset, riparte tutto e vengono resettati i segnali 
       begin
            flag_shift <= '0'; --inizializziamo a 0 questa flag che viene settata ad 1 nel passaggio da s1 -> s2
            reg_mem_load <= '0';
            
            --reg2_load <= '0';
            reg3_load <= '0';
            reg_out <= '0';
            
            o_mem_en <= '0';
            o_mem_we <= '0';
            o_done <= '0';

            --done_ok <= '0';
            
            case cur_state is
                when RESET =>           --SX
                            flag_shift <= '0'; --inizializziamo a 0 questa flag che viene settata ad 1 nel passaggio da s1 -> s2

                            reg_mem_load <= '0';                     
                            
                            --reg2_load <= '0';
                            reg3_load <= '0';
                            reg_out <= '0';
                            
                            --o_mem_addr <= "0000000000000000";
                   
                            o_mem_en <= '0';
                            o_mem_we <= '0';
                            --o_z0 <= "00000000";
                            --o_z1 <= "00000000";
                            --o_z2 <= "00000000";
                            --o_z3 <= "00000000";
                            --count <= "00000";
                            done_ok <= '0';
                            
                when WAIT_START =>      --S0
                when W_READ =>          --S1
                    --reg2_load <= '1';
                    reg3_load <= '1';
                when CREATE_ADDRESS =>
                    flag_shift <= '1';  --mettiamo ad 1 la flag per lo shift
                when ASK_MEM =>         --S2
                    o_mem_en <= '1';
                    flag_shift <= '0';  --riportiamo a 0 la flag per calcolare il valore dello shift
                    --reg2_load <= '0';
                    reg3_load <= '0';
                when READ_MEM =>            --S3
                    reg_mem_load <= '1';
                    --count <= "00000";
                when REG_MEM_WRITE =>
                    reg_mem_load <= '0';
                    o_mem_en <= '0';
                when REG_OUT_WRITE =>
                    reg_out <= '1';
                when OUT_WRITE =>               --S4
                    done_ok <= '1';
                when OUT_SEND =>
                    reg_out <= '0';
                    --done_ok <= '1';
                when OUT_DONE =>
                    o_done <= '1';
                    done_ok <= '0';
                when OUT_OK =>
                    done_ok <= '0';
                    
                    
           end case;
        end process;
       
   
end project_reti_logiche_arch;
