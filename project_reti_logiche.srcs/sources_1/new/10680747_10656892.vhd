library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
    
    signal mux2_load    : std_logic;
    signal mux3_load    : std_logic;
    signal mux2_data    : std_logic_vector(15 downto 0);    -- segnale uscita mux2
    signal mux3_data    : std_logic_vector(1 downto 0);     -- segnale uscita mux3
    
    signal reg_mem_load : std_logic;
  --signal reg1_load    : std_logic;    -> è il clock
    signal reg2_load    : std_logic;
    signal reg3_load    : std_logic;
    signal reg_out      : std_logic;
    
    signal done_ok      : std_logic;
    
    --signal counter_rst  : std_logic;                      --dovrebbe essere start -> NON CI SERVE
    
    signal reg_mem_data : std_logic_vector(8 downto 0);     -- segnale uscita reg memoria
    signal reg1_data    : std_logic_vector(17 downto 0);    -- segnale uscita reg1
    signal reg2_data    : std_logic_vector(15 downto 0);    -- segnale uscita reg2
    signal reg3_data    : std_logic_vector(1 downto 0);     -- segnale uscita reg3
    
    signal regz0_data : std_logic_vector(8 downto 0);       -- segnale uscita reg z0
    signal regz1_data : std_logic_vector(8 downto 0);       -- segnale uscita reg z1
    signal regz2_data : std_logic_vector(8 downto 0);       -- segnale uscita reg z2
    signal regz3_data : std_logic_vector(8 downto 0);       -- segnale uscita reg z3
    
    --incrementatore
    signal inc_in       : std_logic_vector(0 to 4);
    signal inc_out      : std_logic_vector(0 to 4);

    
begin
    
   -- Componente puramente combinatorio. Segue la logica
   -- del sommatore a full adder sequenziali
    inc_out(4) <= not inc_in(4);
    inc_out(3) <= inc_in(4) xor inc_in(3);
    inc_out(2) <= (inc_in(4) and inc_in(3)) xor inc_in(2);
    inc_out(1) <= (inc_in(4) and inc_in(3) and inc_in(2)) xor inc_in(1);
    inc_out(0) <= (inc_in(4) and inc_in(3) and inc_in(2) and inc_in(1) ) xor inc_in(0);
    --overflow <= inc_in(4) and inc_in(3) and inc_in(2) and inc_in(1) and inc_in(0);
    
    
   -- processo reg_mem: reset e salvataggio del registro reg_mem
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
    
   -- processo reg2: reset e salvataggio del registro reg2 
    process(reg2_load, i_clk, i_rst)
    begin 
        if(i_rst = '1') then
            reg2_data <= "0000000000000000";
        elsif i_clk'event and i_clk = '1' then
            if(reg2_load = '1') then
              reg2_data <= mux2_data;
            end if;
        end if;
    end process;
    
   -- processo reg3: reset e salvataggio del registro reg3 
    process(reg3_load, i_clk, i_rst)
    begin 
        if(i_rst = '1') then
            reg3_data <= "00";              --l'uscita 00 rimane sempre aperta? forse non è un problema tanto reg_out salva solo quando vogliamo
        elsif i_clk'event and i_clk = '1' then
            if(reg3_load = '1') then
                reg3_data <= mux3_data;
            end if;
        end if;
    end process;
    
    -- processo regz0: salvataggio del registro regZ0
        process(reg_out, i_clk)
        begin 
            if i_clk'event and i_clk = '1' then
                if(reg_out = '1') then
                    regz0_data <= demux00_data;
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
       
    process(cur_state)
       begin
            mux2_load <= '1';
            mux3_load <= '1';
            mux2_data <= "0000000000000000";
            mux3_data <= "00";
            reg_mem_load <= '0';
            
            reg2_load <= '0';
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
            
            inc_in <= "00000";
            inc_out <= "00000";
            
            done_ok <= '0';
            
            case cur_state is
                when RESET =>
                when WAIT_START =>
                when W_READ =>
                    reg2_load <= '1';
                    reg3_load <= '1';
                when ASK_MEM =>
                    o_mem_en <= '1';
                    reg2_load <= '0';
                    reg3_load <= '0';
                when READ_MEM =>
                    reg_mem_load <= '1';
                when OUT_WRITE =>
                    o_mem_en <= '0';
                    reg_mem_load <= '0';
                    reg_out <= '1';
                    done_ok <= '1';
                when OUT_DONE =>
                    reg_out <= '0';
                    o_done <= '1';
                    done_ok <= '0';
           end case;
        end process;
       
   
end project_reti_logiche_arch;
