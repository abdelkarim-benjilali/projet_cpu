library ieee;
    use ieee.std_logic_1164.all;
    
    entity ioh is 
    port(dbus_out_ioh:out std_logic_vector(15 downto 0);
        pc_ioh:in std_logic_vector(7 downto 0);
        opdata_ioh: in std_logic_vector(7 downto 0);
        opcode_ioh: in std_logic_vector(4 downto 0);
        fetch_ioh: in std_logic;
        dout_ioh: in std_logic_vector(7 downto 0);
        addbus_ioh:out std_logic_vector(7 downto 0);
        read_ioh,write_ioh:out std_logic);
    end ioh;
    architecture RTL of ioh is 
    component multiplexeur_1_ioh
        port(dout_1:in std_logic_vector(7 downto 0);
        opcode_1:in std_logic_vector(4 downto 0);
        dbus_1: out std_logic_vector(15 downto 0));
    end component;
    component multiplexeur_2_ioh
        port(pc_2:in std_logic_vector(7 downto 0);
        opdata_2:in std_logic_vector(7 downto 0);
        opcode_2:in std_logic_vector(4 downto 0);
        fetch_2:in std_logic;
        addbus_2:out std_logic_vector(7 downto 0));
    end component;
    component multiplexeur_3_ioh
        port(opcode_3:in std_logic_vector(4 downto 0);
        fetch_3: in std_logic;
        read_3:out std_logic);
    end component;
    component multiplexeur_4_ioh
        port(opcode_4:in std_logic_vector(4 downto 0);
        write_4:out std_logic);
    end component;
     begin
         u0:multiplexeur_1_ioh port map(dout_ioh,opcode_ioh,dbus_out_ioh);
         u1:multiplexeur_2_ioh port map(pc_ioh,opdata_ioh,opcode_ioh,fetch_ioh,addbus_ioh);
         u2:multiplexeur_3_ioh port map(opcode_ioh,fetch_ioh,read_ioh);
         u3:multiplexeur_4_ioh port map(opcode_ioh,write_ioh);
     end RTL;
        