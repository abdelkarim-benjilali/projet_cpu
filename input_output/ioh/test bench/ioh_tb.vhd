library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    entity ioh_tb is 
end ioh_tb;

architecture RTL of ioh_tb is 
component ioh 
    port(dbus_out_ioh:out std_logic_vector(15 downto 0);
        pc_ioh:in std_logic_vector(7 downto 0);
        opdata_ioh: in std_logic_vector(7 downto 0);
        opcode_ioh: in std_logic_vector(4 downto 0);
        fetch_ioh: in std_logic;
        dout_ioh: in std_logic_vector(7 downto 0);
        addbus_ioh:out std_logic_vector(7 downto 0);
        read_ioh,write_ioh:out std_logic);
    end component;
    signal dbus_out_ioh:std_logic_vector(15 downto 0);
    signal pc_ioh,opdata_ioh,dout_ioh,addbus_ioh:std_logic_vector(7 downto 0);
    signal opcode_ioh:std_logic_vector(4 downto 0);
    signal fetch_ioh,read_ioh,write_ioh:std_logic;
    begin
        u0:ioh port map(dbus_out_ioh,pc_ioh,opdata_ioh,opcode_ioh,fetch_ioh,dout_ioh,addbus_ioh,read_ioh,write_ioh);
        
        process
            begin
            opcode_ioh<=OPCodeGET;     
            fetch_ioh<='0';
            dout_ioh<="11110000";
            pc_ioh<="10101010";  
            opdata_ioh<="00001111"; 
            wait for 20 ns;
            end process;
        end RTL;