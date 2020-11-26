library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    entity multiplexeur_4_ioh is
        port(opcode_4:in std_logic_vector(4 downto 0);
        write_4:out std_logic);
    end multiplexeur_4_ioh;
    architecture RTL of multiplexeur_4_ioh is
        begin
            write_4 <= '1' when opcode_4=OPCodeGET else '0';
        end RTL;