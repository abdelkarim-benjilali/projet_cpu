library ieee;
    use ieee.std_logic_1164.all;
    
    entity registre_tb is 
end registre_tb;

architecture RTL of registre_tb is 
component registre
    port(clk_reg:in std_logic;
        rst_reg:in std_logic;
        data_in_reg:in std_logic_vector(15 downto 0);
        opcode_reg:out std_logic_vector(4 downto 0);
        outsel_reg:out std_logic;
        ressel_reg:out std_logic_vector(1 downto 0);
        opdata_reg:out std_logic_vector(7 downto 0));
    end component;
    signal clk_reg,rst_reg,outsel_reg:std_logic;
    signal data_in_reg: std_logic_vector(15 downto 0);
    signal ressel_reg:std_logic_vector(1 downto 0);
    signal opcode_reg:std_logic_vector(4 downto 0);
    signal opdata_reg:std_logic_vector(7 downto 0);
    begin
       u0: registre port map(clk_reg,rst_reg,data_in_reg,opcode_reg,outsel_reg,ressel_reg,opdata_reg);
       process
           begin
               clk_reg<='1';
               wait for 20 ns;
               clk_reg<='0';
               wait for 20 ns;
           end process;
           process
               begin
                   rst_reg<='0';
                   wait for 75 ns;
                   rst_reg<='1';
                   wait for 15 ns;
               end process;
               
            process
                begin
                    data_in_reg<="1111111100000000";
                    wait for 30 ns;
                    data_in_reg<="0000000011111111";
                    wait for 30 ns;
                end process; 
       end RTL;