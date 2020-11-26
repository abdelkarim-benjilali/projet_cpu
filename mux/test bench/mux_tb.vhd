library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    
    entity mux_up_tb is 
end mux_up_tb;
architecture RTL of mux_up_tb is
    component mux_up 
        port(opdata_mux_up:in std_logic_vector(7 downto 0);
    dbus_mux_up:in std_logic_vector(7 downto 0);
    opcode_mux_up: in std_logic_vector(4 downto 0);
    din_mux_up:out std_logic_vector(7 downto 0));
end component;
    signal opdata_mux_up,dbus_mux_up,din_mux_up:std_logic_vector(7 downto 0);
    signal opcode_mux_up:std_logic_vector(4 downto 0);
    
    begin 
        u0:mux_up port map(opdata_mux_up,dbus_mux_up,opcode_mux_up,din_mux_up);
        process
            begin
                opdata_mux_up<="11110000";
                dbus_mux_up<="00001111";
                opcode_mux_up<=OPCodeSET;
                wait for 20 ns;
                opcode_mux_up<=OPCodeSETL;
                wait for 20 ns;
            end process;
        end RTL;