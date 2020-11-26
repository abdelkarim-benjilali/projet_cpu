library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    entity multiplexeur_3_ioh is 
    port(opcode_3:in std_logic_vector(4 downto 0);
        fetch_3: in std_logic;
        read_3:out std_logic);
    end multiplexeur_3_ioh;
    architecture RTL of multiplexeur_3_ioh is 
    begin
        read_3 <= '1' when fetch_3 = '1' or opcode_3=OPCodeSET else '0';
    end RTL;
    