library ieee;
    use ieee.std_logic_1164.all;
    
    entity registre_2_tb is 
end registre_2_tb;

architecture RTL of registre_2_tb is 
component registre_2
    port(clk_reg_2:in std_logic;
        rst_reg_2:in std_logic;
        data_out_reg_2:out std_logic);
    end component;
    signal clk_reg_2,rst_reg_2:std_logic;
    signal data_out_reg_2: std_logic;
    begin
       u0: registre_2 port map(clk_reg_2,rst_reg_2,data_out_reg_2);
       process
           begin
               clk_reg_2<='1';
               wait for 20 ns;
               clk_reg_2<='0';
               wait for 20 ns;
           end process;
           process
               begin
                   rst_reg_2<='0';
                   wait for 500 ns;
                   rst_reg_2<='1';
                   wait for 15 ns;
               end process;
       end RTL;