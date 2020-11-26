library ieee;
    use ieee.std_logic_1164.all;
    
    entity alu is 
    port(clk_alu,rst_alu,outsel_alu: in std_logic;
        ressel_alu:in std_logic_vector(1 downto 0);
        opcode_alu: in std_logic_vector(4 downto 0);
        din_alu:in std_logic_vector(7 downto 0);
        flag0_alu,flag1_alu:out std_logic;
        dout_alu:out std_logic_vector(7 downto 0));
    end alu;
    architecture RTL of alu is
        component opmux 
            port(opmux_dout:out std_logic_vector(7 downto 0);
       opmux_opcode:in std_logic_vector(4 downto 0);
        opmux_din,opmux_d0,opmux_d1:in std_logic_vector(7 downto 0));
    end component;
    component registre_1
        port(clk_reg_1:in std_logic;
        rst_reg_1:in std_logic;
        data_in_reg_1:in std_logic_vector(7 downto 0);
        data_out_reg_1:out std_logic_vector(7 downto 0));
    end component;
    component multiplexeur_1
        port(d0_mux_1,op_mux_1:in std_logic_vector(7 downto 0);
    ressel_mux_1:in std_logic;
    data_out_mux_1:out std_logic_vector(7 downto 0));
end component;
component flag
    port(flag_in:std_logic_vector(7 downto 0);
            flag_out:out std_logic);
        end component;
        
        signal opmux_mux,d0_opmux,d1_opmux,mux_d0,mux_d1:std_logic_vector(7 downto 0);
        begin 
            u0:opmux port map(opmux_mux,opcode_alu,din_alu,d0_opmux,d1_opmux);
            u1:multiplexeur_1 port map(d0_opmux,opmux_mux,ressel_alu(0),mux_d0);
            u2:multiplexeur_1 port map(d1_opmux,opmux_mux,ressel_alu(1),mux_d1);
            u3:registre_1 port map(clk_alu,rst_alu,mux_d0,d0_opmux);
            u4:registre_1 port map(clk_alu,rst_alu,mux_d1,d1_opmux);
            u5:multiplexeur_1 port map(d0_opmux,d1_opmux,outsel_alu,dout_alu);
            u6:flag port map(d0_opmux,flag0_alu);
            u7:flag port map(d1_opmux,flag1_alu);
        end RTL;