library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
entity mux_up is 
port(opdata_mux_up:in std_logic_vector(7 downto 0);
    dbus_mux_up:in std_logic_vector(7 downto 0);
    opcode_mux_up: in std_logic_vector(4 downto 0);
    din_mux_up:out std_logic_vector(7 downto 0));
end mux_up;
architecture RTL of mux_up is 
begin 
    din_mux_up <= opdata_mux_up when opcode_mux_up=OPCodeSETL else
				 dbus_mux_up(ALURegWidth downto 0) when opcode_mux_up=OPCodeSET else
				 (others=>'0');
				 end RTL;
				 