library ieee;
    use ieee.std_logic_1164.all;
    use work.constants.all;
    entity up is 
    port(clk_up,rst_up: in std_logic;
        dbus_in_up:in std_logic_vector(15 downto 0);
        dbus_out_up:out std_logic_vector(15 downto 0);
        addbus_up:out std_logic_vector(7 downto 0);
        read_up,write_up:out std_logic);
    end up;
    architecture RTL of up is 
    component alu 
        port(clk_alu,rst_alu,outsel_alu: in std_logic;
        ressel_alu:in std_logic_vector(1 downto 0);
        opcode_alu: in std_logic_vector(4 downto 0);
        din_alu:in std_logic_vector(7 downto 0);
        flag0_alu,flag1_alu:out std_logic;
        dout_alu:out std_logic_vector(7 downto 0));
    end component;
    component pc 
        port(opdata_pc:in std_logic_vector(7 downto 0);
        opcode_pc:in std_logic_vector(4 downto 0);
        clk_pc,rst_pc,flag0_pc,flag1_pc,fetch_pc:in std_logic;
        pc_out:buffer std_logic_vector(7 downto 0):="00000000");
    end component;
    component top 
        port(dbus_top: in std_logic_vector(15 downto 0);
        clk_top,rst_top: in std_logic;
        fetch_top:buffer std_logic:='0';
        opcode_top:out std_logic_vector(4 downto 0);
        outsel_top:out std_logic;
        ressel_top : out std_logic_vector(1 downto 0);
        opdata_top : out std_logic_vector(7 downto 0));
    end component;
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
    component mux_up 
        port(opdata_mux_up:in std_logic_vector(7 downto 0);
    dbus_mux_up:in std_logic_vector(7 downto 0);
    opcode_mux_up: in std_logic_vector(4 downto 0);
    din_mux_up:out std_logic_vector(7 downto 0));
end component;
    signal ressel: std_logic_vector(1 downto 0);
    signal outsel,flag0,flag1,fetch:std_logic;
    signal opcode:std_logic_vector(4 downto 0);
    signal din,dout,opdata,pc_pc:std_logic_vector(7 downto 0);
    begin 
        u0:alu port map(clk_up,rst_up,outsel,ressel,opcode,din,flag0,flag1,dout);
        u1:pc port map(opdata,opcode,clk_up,rst_up,flag0,flag1,fetch,pc_pc);
        u2:mux_up port map(opdata,dbus_in_up(7 downto 0),opcode,din);
        u3:top port map(dbus_in_up,clk_up,rst_up,fetch,opcode,outsel,ressel,opdata);
        u4:ioh port map(dbus_out_up,pc_pc,opdata,opcode,fetch,dout,addbus_up,read_up,write_up);
    end RTL;