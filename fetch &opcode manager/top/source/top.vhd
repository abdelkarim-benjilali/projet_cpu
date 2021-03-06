library ieee;
    use ieee.std_logic_1164.all;
    
    entity top is 
    port(dbus_top: in std_logic_vector(15 downto 0);
        clk_top,rst_top: in std_logic;
        fetch_top:buffer std_logic:='0';
        opcode_top:out std_logic_vector(4 downto 0);
        outsel_top:out std_logic;
        ressel_top : out std_logic_vector(1 downto 0);
        opdata_top : out std_logic_vector(7 downto 0));
    end top;
    architecture RTL of top is 
    component multiplexeur 
        port(mux_dbus:in std_logic_vector(15 downto 0);
    mux_fetch:in std_logic;
    mux_data_out:out std_logic_vector(15 downto 0));
end component;
component registre 
    port(clk_reg:in std_logic;
        rst_reg:in std_logic;
        data_in_reg:in std_logic_vector(15 downto 0);
        opcode_reg:out std_logic_vector(4 downto 0);
        outsel_reg:out std_logic;
        ressel_reg:out std_logic_vector(1 downto 0);
        opdata_reg:out std_logic_vector(7 downto 0));
    end component;
    component registre_2 
        port(clk_reg_2:in std_logic;
        rst_reg_2:in std_logic;
        data_out_reg_2:buffer std_logic:='1');
    end component;
    signal mux_reg:std_logic_vector(15 downto 0);
    begin
        u0:multiplexeur port map(dbus_top,fetch_top,mux_reg);
        u1: registre port map(clk_top,rst_top,mux_reg,opcode_top,outsel_top,ressel_top,opdata_top);
        u2:registre_2 port map(clk_top,rst_top,fetch_top);
    end RTL;
        
        