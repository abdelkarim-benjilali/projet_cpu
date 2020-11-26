library ieee;
    use ieee.std_logic_1164.all;
    
    entity registre_1_tb is 
end registre_1_tb;

architecture RTL of registre_1_tb is 
component registre_1
    port(clk_reg_1:in std_logic;
        rst_reg_1:in std_logic;
        data_in_reg_1:in std_logic_vector(7 downto 0);
        data_out_reg_1:out std_logic_vector(7 downto 0));
    end component;
    signal clk_reg_1,rst_reg_1:std_logic;
    signal data_in_reg_1,data_out_reg_1: std_logic_vector(7 downto 0);
    begin
       u0: registre_1 port map(clk_reg_1,rst_reg_1,data_in_reg_1,data_out_reg_1);
       process
           begin
               clk_reg_1<='1';
               wait for 20 ns;
               clk_reg_1<='0';
               wait for 20 ns;
           end process;
           process
               begin
                   rst_reg_1<='0';
                   wait for 75 ns;
                   rst_reg_1<='1';
                   wait for 15 ns;
               end process;
               
            process
                begin
                    data_in_reg_1<="11110000";
                    wait for 30 ns;
                    data_in_reg_1<="00001111";
                    wait for 30 ns;
                end process;
            end RTL;