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

    signal curr_state : S;
    signal mux2_load    : std_logic;
    signal mux3_load    : std_logic;
    signal reg_mem_load : std_logic;
    signal reg2_load    : std_logic;
    signal reg3_load    : std_logic;
    signal reg_out      : std_logic;
    
    signal counter_rst  : std_logic;
    
    signal reg1_data    : std_logic_vector(0 to 17);
    signal reg2_data    : std_logic_vector(0 to 15);
    signal reg3_data    : std_logic_vector(0 to 1);
    
    --incrementatore
    signal inc_in              : std_logic_vector(0 to 4);
    signal inc_out             : std_logic_vector(0 to 4);

    
begin
    
   -- Componente puramente combinatorio. Segue la logica
   -- del sommatore a full adder sequenziali
   inc_out(4) <= not inc_in(4);
   inc_out(3) <= inc_in(4) xor inc_in(3);
   inc_out(2) <= (inc_in(4) and inc_in(3)) xor inc_in(2);
   inc_out(1) <= (inc_in(4) and inc_in(3) and inc_in(2)) xor inc_in(1);
   inc_out(0) <= (inc_in(4) and inc_in(3) and inc_in(2) and inc_in(1) ) xor inc_in(0);
   --overflow <= inc_in(4) and inc_in(3) and inc_in(2) and inc_in(1) and inc_in(0);

   
   
end project_reti_logiche_arch;
