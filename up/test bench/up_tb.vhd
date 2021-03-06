library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    entity up_tb is 
end up_tb;

architecture RTL of up_tb is 
component up 
    port(clk_up,rst_up: in std_logic;
        dbus_in_up:in std_logic_vector(15 downto 0);
        dbus_out_up:out std_logic_vector(15 downto 0);
        addbus_up:out std_logic_vector(7 downto 0);
        read_up,write_up:out std_logic);
    end component;
    signal clk_up,rst_up,read_up,write_up:std_logic;
    signal dbus_in_up,dbus_out_up:std_logic_vector(15 downto 0);
    signal addbus_up:std_logic_vector(7 downto 0);
    begin
        u0:up port map(clk_up,rst_up,dbus_in_up,dbus_out_up,addbus_up,read_up,write_up);
       
                process
                    begin
                     clk_up<='0';
                        wait for 10 ns;
                    clk_up<='1';
                     wait for 10 ns;
                 end process;
                 process
                 begin
                 rst_up<='0';
                 wait for 200 ns;
                 rst_up<='1';
                 wait for 10 ns;
             end process;
             process
                 begin
                     dbus_out_up<="0001100100001010";
                     -- set 10 in registre b
                     wait for 20 ns;
                     dbus_in_up<="0001101000010100";
                     --set 20 in registre a
                     wait for 20 ns;
                     dbus_in_up<="0100101000000000";
                     wait for 20 ns;
                     dbus_in_up<="0110000000000110";
                     wait for 20 ns;
                     dbus_in_up<="0011000100000000";
                     wait for 20 ns;
                     dbus_in_up<="0010000000000110";
                     wait for 20 ns;
                     dbus_in_up<="0010100000000001";
                     wait for 20 ns;
                     dbus_in_up<="0011100100000000";
                     wait for 20 ns;
                     dbus_in_up<="0010000000000110";
                     wait for 20 ns;
            end process;
        end RTL;
    
    