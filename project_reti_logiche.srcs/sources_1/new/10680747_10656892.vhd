library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity inc is
    port( inc_in    : in std_logic_vector(0 to 4);
          inc_out   : out std_logic_vector(0 to 4)
          --overflow : out std_logic
        );
end inc;

architecture inc_arch of inc is
begin

 -- Componente puramente combinatorio. Segue la logica
 -- del sommatore a full adder sequenziali
  inc_out(4) <= not inc_in(4);
  inc_out(3) <= inc_in(4) xor inc_in(3);
  inc_out(2) <= (inc_in(4) and inc_in(3)) xor inc_in(2);
  inc_out(1) <= (inc_in(4) and inc_in(3) and inc_in(2)) xor inc_in(1);
  inc_out(0) <= (inc_in(4) and inc_in(3) and inc_in(2) and inc_in(1) ) xor inc_in(0);
  --overflow <= inc_in(4) and inc_in(3) and inc_in(2) and inc_in(1) and inc_in(0);
  
    
end inc_arch;





library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


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
    
    -- Sx   RESET
    -- S0   WAIT_START
    -- S1   W_READ
    -- S2   ASK_MEM
    -- S3   READ_MEM
    -- S4   OUT_WRITE
    -- S5   OUT_DONE
    
    type S is (RESET, WAIT_START, W_READ, ASK_MEM, READ_MEM, OUT_WRITE, OUT_DONE);

    signal cur_state    : S;
    signal next_state   : S;
    
    signal flag_shift   : std_logic;
    
    
    --signal mux2_load    : std_logic;
    --signal mux3_load    : std_logic;
    --signal mux2_data    : std_logic_vector(15 downto 0);    -- segnale uscita mux2
    --signal mux3_data    : std_logic_vector(1 downto 0);     -- segnale uscita mux3
    
    
    signal reg_mem_load : std_logic;
  --signal reg1_load    : std_logic;    -> è il clock
   --signal reg2_load    : std_logic;
    signal reg3_load    : std_logic;
    signal reg_out      : std_logic;
    
    signal done_ok      : std_logic;
    
    --signal counter_rst  : std_logic;                      --dovrebbe essere start -> NON CI SERVE
    
    signal reg_mem_data : std_logic_vector(8 downto 0);     -- segnale uscita reg memoria
    signal reg1_data    : std_logic_vector(15 downto 0);    -- segnale uscita reg1    17,16,15
    
    signal reg3_data    : std_logic_vector(1 downto 0);     -- segnale uscita reg3
    
    signal regz0_data : std_logic_vector(8 downto 0);       -- segnale uscita reg z0
    signal regz1_data : std_logic_vector(8 downto 0);       -- segnale uscita reg z1
    signal regz2_data : std_logic_vector(8 downto 0);       -- segnale uscita reg z2
    signal regz3_data : std_logic_vector(8 downto 0);       -- segnale uscita reg z3
    
    --incrementatore
    signal inc_in_port       : std_logic_vector(0 to 4);
    signal inc_out_port      : std_logic_vector(0 to 4);
    
    signal shift_counter     :std_logic_vector(0 to 4);   --qui salviamo la costante 1 per la sottrazione
    
    --istanziamo componente dell'incrementatore
    component inc is
        port( inc_in    : in std_logic_vector(0 to 3);
              inc_out   : out std_logic_vector(0 to 3)
              --overflow : out std_logic
            );
        end component;
    
begin
    
    --port map dei segnali dell'incrementatore  
    incrementer : inc port map(
        inc_in => inc_in_port,
        inc_out => inc_out_port
        --overflow => counter_ovf        
    );
    
    
    
    --questo dovrebbe essere il processo in cui viene aggiornato il contatore 
      process(i_clk, i_start)   --il nostro processo di questo registro è sensibile al segnale di reset e al clock                                 
         begin                     -- Processo sequenziale perchè sto facendo esattamente una memoria, un registro
             if i_rst = '1' then               --per prima cosa vado a verificare se c'è stato un reset
                  inc_in_port <= "0000";
               elsif i_clk'event and i_clk = '1' then      -- Non dimenticarsi il 'event, altrimenti vengono generati dei latch                                    
                  if(i_start = '1' and i_rst = '0') then  -- lavora, e quindi incrementa, solo se start = 1
                        inc_in_port <= inc_out_port;
                  end if;
                end if;
            end process;

    --lettura da w, inc_in è ciò che effettivamente "contiene" il valore del contatore.
    process(inc_in_port, i_w, i_clk, i_start)                   -- Processo combinatorio
        begin
            if i_clk'event and i_clk = '1' then
                if(i_start = '1' and i_rst = '0') then       
                    case inc_in_port is
                        when "00000" => reg3_data(1) <= i_w;       
                        when "00001" => reg3_data(0) <= i_w;  --qui salviamo in reg3 il canale di uscita    
                
                
                        when "00010" => reg1_data(15) <= i_w;     --salviamo in reg1 l'indirizzo di memoria non ancora paddato dalla cima, in ordine
                        when "00011" => reg1_data(14) <= i_w;       
                        when "00100" => reg1_data(13) <= i_w;       
                        when "00101" => reg1_data(12) <= i_w;       
                        when "00110" => reg1_data(11) <= i_w;       
                        when "00111" => reg1_data(10) <= i_w;       
                        when "01000" => reg1_data(9) <= i_w;       
                        when "01001" => reg1_data(8) <= i_w;       
                        when "01010" => reg1_data(7) <= i_w;       
                        when "01011" => reg1_data(6) <= i_w;       
                        when "01100" => reg1_data(5) <= i_w;       
                        when "01101" => reg1_data(4) <= i_w;       
                        when "01110" => reg1_data(3) <= i_w;       
                        when "01111" => reg1_data(2) <= i_w;       
                        when "10000" => reg1_data(1) <= i_w;       
                        when "10001" => reg1_data(0) <= i_w;       

                        when others => null; -- reg1_data <= "XXXXXXXXXXXXXXXX";            -- Non dimenticarsi il caso base, se non lo metto, lui intende che negli 
                                                        -- altri casi io voglia mantenere il valore precedente e genera quindi un latch. alternativamente metterlo prima del case
                    end case;
                 end if;
              end if;
        end process;
      
      
      
       --questo è il processo con cui calciamo l'indirizzo di memoria con shift ecc.
      process(i_clk, i_start, flag_shift)  
        variable number_shift : std_logic_vector(0 to 4);
        begin
           if i_rst = '1' then               --per prima cosa vado a verificare se c'è stato un reset
             number_shift := "00000";
           elsif i_clk'event and i_clk = '1' then      -- Non dimenticarsi il 'event, altrimenti vengono generati dei latch                                    
             if(i_start = '0' and i_rst = '0' and flag_shift = '1') then 
                number_shift := STD_LOGIC_VECTOR (UNSIGNED(inc_in_port) - UNSIGNED (shift_counter)); --qui calcoliamo counter - 1
                o_mem_addr <= std_logic_vector(shift_right(unsigned(reg1_data), to_integer(unsigned(number_shift)))); --qui shiftiamo e paddiamo
              end if;
           end if;
    
      end process; 
      
      
      
    
   -- processo reg_mem: reset e salvataggio del registro reg_mem, qui ci va il dato ricevuto dalla memoria 
    process(reg_mem_load, i_clk, i_rst)
    begin 
        if(i_rst = '1') then
            reg_mem_data <= "00000000";
        elsif i_clk'event and i_clk = '1' then          --se sale clock 
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
           elsif i_clk'event and i_clk = '1' then
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
        
        
    
    --in questo processo mostriamo i valori sulle uscite vere (o_z1 ecc) quando done = 1. 
    process(i_clk, i_rst, done_ok)
    begin
     if(i_rst = '1') then
         o_z0 <= "00000000";
         o_z1<=  "00000000";
         o_z2 <= "00000000";
         o_z3 <= "00000000";
         elsif i_clk'event and i_clk = '1' then
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
    
    -- modifica stato e controllo del reset che può arrivare in ogni momento
    process(i_clk, i_rst)
    begin
           if(i_rst = '1') then
               cur_state <= RESET;
           elsif i_clk'event and i_clk = '1' then
               cur_state <= next_state;
           end if;
    end process;
    
    -- calcolo del nuovo next state (si "attiva" quando cur_state è modificato dalla funzione sopra)
    process(cur_state, i_start, i_rst)
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
               
               -- quando start=0 -> passa a s2
               when W_READ =>
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
                        next_state <= OUT_WRITE;
                    end if; 

               when OUT_WRITE =>
                   if done_ok = '1' then 
                       next_state <= OUT_DONE;
                   elsif i_rst = '1' then
                       next_state <= RESET;
                   end if;
                
                when OUT_DONE =>
                    if done_ok = '0' then 
                        next_state <= WAIT_START;
                    elsif i_rst = '1' then
                        next_state <= RESET;
                    end if;
           end case;
    end process;
       
    process(cur_state) --quando arriva il reset, riparte tutto e vengono resettati i segnali 
       begin
            flag_shift <= '0'; --inizializziamo a 0 questa flag che viene settata ad 1 nel passaggio da s1 -> s2
            shift_counter <= "00001"; --costante "1" per la sottrazione 
            --mux2_load <= '1';
            --mux3_load <= '1';
           -- mux2_data <= "0000000000000000";
            --mux3_data <= "00";
            reg_mem_load <= '0';
            
            --reg2_load <= '0';
            reg3_load <= '0';
            reg_out <= '0';
            
            o_mem_addr <= "0000000000000000";
            
            o_mem_en <= '0';
            o_mem_we <= '0';
            o_done <= '0';
            
            o_z0 <= "00000000";
            o_z1 <= "00000000";
            o_z2 <= "00000000";
            o_z3 <= "00000000";
            
            inc_in_port <= "00000";
            inc_out_port <= "00000";
            
            done_ok <= '0';
            
            reg1_data <= "0000000000000000";
            
            case cur_state is
                when RESET =>           --SX
                when WAIT_START =>      --S0
                when W_READ =>          --S1
                    --reg2_load <= '1';
                    reg3_load <= '1';
                when ASK_MEM =>         --S2
                    flag_shift <= '1';  --mettiamo ad 1 la flag per lo shift
                    o_mem_en <= '1';
                    --reg2_load <= '0';
                    reg3_load <= '0';
                when READ_MEM =>            --S3
                    flag_shift <= '0'; --riportiamo a 0 la flag per calcolare il valore dello shift
                    reg_mem_load <= '1';
                when OUT_WRITE =>               --S4
                    o_mem_en <= '0';
                    reg_mem_load <= '0';
                    reg_out <= '1';
                    done_ok <= '1';
                when OUT_DONE =>                --S5
                    reg_out <= '0';
                    o_done <= '1';
                    done_ok <= '0';
           end case;
        end process;
       
   
end project_reti_logiche_arch;
