library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    entity multiplexeur_4_ioh_tb is
    end multiplexeur_4_ioh_tb;
    architecture RTL of multiplexeur_4_ioh_tb is 
    component multiplexeur_4_ioh
        port(opcode_4:in std_logic_vector(4 downto 0);
        write_4:out std_logic);
    end component;
     signal opcode_4: std_logic_vector(4 downto 0);
     signal write_4:std_logic;
     begin 
         u0:multiplexeur_4_ioh port map(opcode_4,write_4);
         process
             begin
                opcode_4<=OPCodeGET;
                wait for 20 ns;
                opcode_4<="00000";
                wait for 20 ns;
            end process;
        end RTL;
        