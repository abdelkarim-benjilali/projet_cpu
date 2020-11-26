library ieee;
    use ieee.std_logic_1164.all;
    
    entity top_tb is 
 end top_tb;
 
 architecture RTL of top_tb is 
 component top port(dbus_top: in std_logic_vector(15 downto 0);
        clk_top,rst_top: in std_logic;
        fetch_top:buffer std_logic;
        opcode_top:out std_logic_vector(4 downto 0);
        outsel_top:out std_logic;
        ressel_top : out std_logic_vector(1 downto 0);
        opdata_top : out std_logic_vector(7 downto 0));
    end component;
    
    signal dbus_top:std_logic_vector(15 downto 0);
    signal clk_top,rst_top,fetch_top,outsel_top:std_logic;
    signal opcode_top:std_logic_vector(4 downto 0);
    signal ressel_top:std_logic_vector(1 downto 0);
    signal opdata_top :std_logic_vector(7 downto 0);
    
    begin
        U0:top port map(dbus_top,clk_top,rst_top,fetch_top,opcode_top,outsel_top,ressel_top,opdata_top);
    process 
        begin
            dbus_top<="1001110011110000";
            wait for 30 ns;
            dbus_top<="1111111100000000";
            wait for 30 ns;
        end process;
        process
            begin
                clk_top<='1';
                rst_top<='0';
                wait for 10 ns;
                clk_top<='0';
                wait for 10 ns;
            end process;
       end RTL;
                