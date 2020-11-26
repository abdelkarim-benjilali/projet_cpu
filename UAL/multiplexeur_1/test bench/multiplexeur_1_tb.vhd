library ieee;
    use ieee.std_logic_1164.all;
    
    entity multiplexeur_1_tb is
    end multiplexeur_1_tb;

architecture RTL of multiplexeur_1_tb is 
component multiplexeur_1 
    port(d0_mux_1,op_mux_1:in std_logic_vector(7 downto 0);
    ressel_mux_1:in std_logic;
    data_out_mux_1:out std_logic_vector(7 downto 0));
end component;
 
 signal d0_mux_1,op_mux_1,data_out_mux_1: std_logic_vector(7 downto 0);
 signal ressel_mux_1: std_logic;
 begin 
     u0:multiplexeur_1 port map(d0_mux_1,op_mux_1,ressel_mux_1,data_out_mux_1);
     process
         begin
         d0_mux_1<="00001111";
         op_mux_1<="11110000";
         ressel_mux_1<='0';
         wait for 20 ns;
         ressel_mux_1<='1';
         wait for 20 ns ;
     end process;
 end RTL;