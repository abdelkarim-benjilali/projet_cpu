library ieee;
    use ieee.std_logic_1164.all;
use work.constants.all;
entity multiplexeur_3_ioh_tb is 
end multiplexeur_3_ioh_tb;

architecture RTL of multiplexeur_3_ioh_tb is
    component multiplexeur_3_ioh 
        port(opcode_3:in std_logic_vector(4 downto 0);
        fetch_3: in std_logic;
        read_3:out std_logic);
    end component;
    signal opcode_3:std_logic_vector(4 downto 0);
    signal fetch_3,read_3:std_logic;
    begin 
        u0:multiplexeur_3_ioh port map(opcode_3,fetch_3,read_3);
        process
            begin
                fetch_3<='1';
                wait for 20 ns;
                fetch_3<='0';
                opcode_3<=OPCodeSET;
                wait for 20 ns;
                opcode_3<="00000";
                wait for 20 ns;
            end process;
        end RTL;