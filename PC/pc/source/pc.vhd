library ieee;
    use ieee.std_logic_1164.all;
    
    entity pc is 
    port(opdata_pc:in std_logic_vector(7 downto 0);
        opcode_pc:in std_logic_vector(4 downto 0);
        clk_pc,rst_pc,flag0_pc,flag1_pc,fetch_pc:in std_logic;
        pc_out:buffer std_logic_vector(7 downto 0):="00000000");
    end pc;
    architecture RTL of pc is 
    component mux 
        port(pc_mux,opdata_mux: in std_logic_vector(7 downto 0);
        opcode_mux:in std_logic_vector(4 downto 0);
        fetch_mux,flag0_mux,flag1_mux: in std_logic;
        mux_out:out std_logic_vector(7 downto 0):="00000000");
    end component;
    component registre_1
        port(clk_reg_1:in std_logic;
        rst_reg_1:in std_logic;
        data_in_reg_1:in std_logic_vector(7 downto 0);
        data_out_reg_1:out std_logic_vector(7 downto 0));
    end component;
    
     signal mux_reg:std_logic_vector(7 downto 0);
     begin 
         u0: mux port map(pc_out,opdata_pc,opcode_pc,fetch_pc,flag0_pc,flag1_pc,mux_reg);
         u1:registre_1 port map(clk_pc,rst_pc,mux_reg,pc_out);
    end RTL;