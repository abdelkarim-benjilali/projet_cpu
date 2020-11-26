library ieee;
    use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
entity multiplexeur_1 is 
port(d0_mux_1,op_mux_1:in std_logic_vector(7 downto 0);
    ressel_mux_1:in std_logic;
    data_out_mux_1:out std_logic_vector(7 downto 0));
end multiplexeur_1;

architecture RTL of multiplexeur_1 is 
begin 
    data_out_mux_1<=op_mux_1 when ressel_mux_1='1' else d0_mux_1;
end RTL;
    