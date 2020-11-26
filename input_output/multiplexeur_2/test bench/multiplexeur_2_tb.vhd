library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    entity multiplexeur_2_ioh_tb is
    end multiplexeur_2_ioh_tb;
    architecture RTL of multiplexeur_2_ioh_tb is 
    component multiplexeur_2_ioh 
        port(pc_2:in std_logic_vector(7 downto 0);
        opdata_2:in std_logic_vector(7 downto 0);
        opcode_2:in std_logic_vector(4 downto 0);
        fetch_2:in std_logic;
        addbus_2:out std_logic_vector(7 downto 0));
    end component;
    signal addbus_2,pc_2,opdata_2:std_logic_vector(7 downto 0);
    signal opcode_2:std_logic_vector(4 downto 0);
    signal fetch_2: std_logic;
    begin
        u0:multiplexeur_2_ioh port map(pc_2,opdata_2,opcode_2,fetch_2,addbus_2);
        process 
            begin
                pc_2<="11111111";
                opdata_2<="00001111";
                fetch_2<='1';
                opcode_2<=OPCodeGET;
                wait for 20 ns;
            fetch_2<='0';
            wait for 20 ns;
        end process;
    end RTL;