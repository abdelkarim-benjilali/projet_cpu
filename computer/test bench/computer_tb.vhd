library ieee; 
    use ieee.std_logic_1164.all;
    use work.constants.all;
    
entity computer_tb is 
end computer_tb;
architecture RTL of computer_tb is
    component computer 
        port(clk_c,rst_c:in std_logic;
    test_c:out std_logic_vector(15 downto 0));
end component;
signal clk_c,rst_c: std_logic;
signal test_c:std_logic_vector(15 downto 0);
begin
    u0:computer port map(clk_c,rst_c,test_c);
    process
        begin
         clk_c<='0';
         rst_c<='0';
            wait for 10 ns;
        clk_c<='1';
        wait for 10 ns;
    end process;
    end RTL;