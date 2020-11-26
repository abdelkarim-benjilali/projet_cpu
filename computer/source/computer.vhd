use work.Constants.all; 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity computer is 
port(clk_c,rst_c:in std_logic;
    test_c:out std_logic_vector(15 downto 0));
end computer;
architecture RTL of computer is 
component ram 
    port(test : out STD_LOGIC_VECTOR(15 downto 0); --Test ONLY
			  clk_ram, reset_ram : in  STD_LOGIC;
			  dbus_in_ram : in STD_LOGIC_VECTOR  (15 downto 0);
			  dbus_out_ram:out  STD_LOGIC_VECTOR  (15 downto 0);
           addbus_ram : in  STD_LOGIC_VECTOR (7 downto 0);
           read_ram,write_ram : in  STD_LOGIC);
       end component;
       component up 
           port(clk_up,rst_up: in std_logic;
        dbus_in_up:in std_logic_vector(15 downto 0);
        dbus_out_up:out std_logic_vector(15 downto 0);
        addbus_up:out std_logic_vector(7 downto 0);
        read_up,write_up:out std_logic);
    end component;
     signal data_out_ram,data_in_ram:std_logic_vector(15 downto 0);
     signal addbus:std_logic_vector(7 downto 0);
     signal read,write:std_logic;
     begin 
         u0:ram port map(test_c,clk_c,rst_c,data_in_ram,data_out_ram,addbus,read,write);
         u1:up port map(clk_c,rst_c,data_out_ram,data_in_ram,addbus,read,write);
     end RTL;
       