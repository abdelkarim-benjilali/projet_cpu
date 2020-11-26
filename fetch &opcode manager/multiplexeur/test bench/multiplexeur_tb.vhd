library ieee;
    use ieee.std_logic_1164.all;
    
    entity multiplexeur_tb is
    end multiplexeur_tb;

architecture RTL of multiplexeur_tb is 
component multiplexeur 
    port(mux_dbus:in std_logic_vector(15 downto 0);
    mux_fetch:in std_logic;
    mux_data_out:out std_logic_vector(15 downto 0));
end component;
 
 signal mux_dbus,mux_data_out: std_logic_vector(15 downto 0);
 signal mux_fetch: std_logic;
 begin 
     u0:multiplexeur port map(mux_dbus,mux_fetch,mux_data_out);
     process
         begin
         mux_dbus<="1111111100000000";
         mux_fetch<='0';
         wait for 20 ns;
         mux_fetch<='1';
         wait for 20 ns;
     end process;
 end RTL;