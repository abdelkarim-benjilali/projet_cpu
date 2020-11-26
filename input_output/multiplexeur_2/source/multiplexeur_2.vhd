library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    entity multiplexeur_2_ioh is 
    port(pc_2:in std_logic_vector(7 downto 0);
        opdata_2:in std_logic_vector(7 downto 0);
        opcode_2:in std_logic_vector(4 downto 0);
        fetch_2:in std_logic;
        addbus_2:out std_logic_vector(7 downto 0));
end multiplexeur_2_ioh;
architecture RTL of multiplexeur_2_ioh is
begin 
addbus_2 <= pc_2 when fetch_2 = '1' else
					  opdata_2 when opcode_2=OPCodeGET or opcode_2=OPCodeSET else
					  (others=>'0');       
					  end RTL;
					   