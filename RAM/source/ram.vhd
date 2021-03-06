library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    use IEEE.NUMERIC_STD.ALL;
    entity ram is 
    port(test : out STD_LOGIC_VECTOR(15 downto 0); --Test ONLY
			  clk_ram, reset_ram : in  STD_LOGIC;
			  dbus_in_ram : in STD_LOGIC_VECTOR  (15 downto 0);
			  dbus_out_ram:out  STD_LOGIC_VECTOR  (15 downto 0);
           addbus_ram : in  STD_LOGIC_VECTOR (7 downto 0);
           read_ram,write_ram : in  STD_LOGIC);
       end ram;
       architecture RTL of ram is 
       type myram_type is array(0 to 4) of std_logic_vector(15 downto 0);-- you should change the range first (0 to x) x is ur cases number
       --here you add the microo processor's program
       signal myram: myram_type:=(
	OPCodeSETL & "0" & "11" & "00000100",
	OPCodeGET  & "1" & "00" & "00000100",
	OPCodeINC0 & "0" & "01" & "00000000",
	OPCodeSET  & "0" & "00" & "00000100",
	"0000000000000000"
	);
--and test
       signal RAMbuffer : STD_LOGIC_VECTOR  (DataWidth downto 0);
       begin
dbus_out_ram <= myram(to_integer(unsigned(addbus_ram))) when  read_ram='1' and write_ram='0' else ( others => 'Z' );
	RAMbuffer <= dbus_in_ram when  read_ram='0' and write_ram='1' else myram(to_integer(unsigned(addbus_ram)));
	myram(to_integer(unsigned(addbus_ram))) <= RAMbuffer when rising_edge(clk_ram);

	--FOR TEST ONLY 
	test <= myram(4);
	end RTL;