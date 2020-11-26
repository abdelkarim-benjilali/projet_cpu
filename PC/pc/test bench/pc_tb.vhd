library ieee;
    use ieee.std_logic_1164.all;
entity pc_tb is
end pc_tb;
architecture RTL of pc_tb is 
component pc port(opdata_pc:in std_logic_vector(7 downto 0);
        opcode_pc:in std_logic_vector(4 downto 0);
        clk_pc,rst_pc,flag0_pc,flag1_pc,fetch_pc:in std_logic;
        pc_out:buffer std_logic_vector(7 downto 0));
    end component;
    signal opdata_pc,pc_out: std_logic_vector(7 downto 0);
    signal clk_pc,rst_pc,flag0_pc,flag1_pc,fetch_pc: std_logic;
    signal opcode_pc :std_logic_vector(4 downto 0);
     begin
         u0: pc port map(opdata_pc,opcode_pc,clk_pc,rst_pc,flag0_pc,flag1_pc,fetch_pc,pc_out);
         
         process
             begin 
                 clk_pc<='1';
                 wait for 10 ns;
                 clk_pc<='0';
                 wait for 10 ns;
             end process;
             process
                 begin
                     rst_pc<='0';
                    wait for 500 ns;
                    rst_pc<='1';
                    wait for 20 ns;
                end process;
                process
                begin 
                    fetch_pc<='0';
                    opcode_pc<="00000";
                    opdata_pc<="11110000";
                    flag0_pc<='0';
                    flag1_pc<='0';
                    wait for 20 ns;
                    fetch_pc<='1';
                    wait for 20 ns;
                    
                end process;
            end RTL;