library ieee;
    use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
entity multiplexeur is 
port(mux_dbus:in std_logic_vector(15 downto 0);
    mux_fetch:in std_logic;
    mux_data_out:out std_logic_vector(15 downto 0));
end multiplexeur;

architecture RTL of multiplexeur is 
begin 
   mux_data_out<=mux_dbus when mux_fetch='1' else (others=>'0');
end RTL;
    