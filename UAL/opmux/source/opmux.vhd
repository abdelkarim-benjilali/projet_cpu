library ieee;
    use ieee.std_logic_1164.all;
    use work.Constants.all; 
    use IEEE.NUMERIC_STD.ALL;
    entity opmux is 
    port(opmux_dout:out std_logic_vector(7 downto 0);
       opmux_opcode:in std_logic_vector(4 downto 0);
        opmux_din,opmux_d0,opmux_d1:in std_logic_vector(7 downto 0));
    end opmux;
    architecture RTL of opmux is
        begin
            opmux_dout<=opmux_din when opmux_opcode=OPCodeSET or opmux_opcode = OPCodeSETL else
            STD_LOGIC_VECTOR(unsigned(opmux_d0)+1) when opmux_opcode = OPCodeINC0 else
				STD_LOGIC_VECTOR(unsigned(opmux_d1)+1) when opmux_opcode = OPCodeINC1 else
				STD_LOGIC_VECTOR(unsigned(opmux_d0)-1) when opmux_opcode = OPCodeDEC0 else
				STD_LOGIC_VECTOR(unsigned(opmux_d1)-1) when opmux_opcode = OPCodeDEC1 else
				STD_LOGIC_VECTOR(unsigned(opmux_d0)+unsigned(opmux_d1)) when opmux_opcode = OPCodeADD else
				STD_LOGIC_VECTOR(unsigned(opmux_d0)-unsigned(opmux_d1)) when opmux_opcode = OPCodeSUB else
				opmux_d0 and opmux_d1 when opmux_opcode = OPCodeAND else
				opmux_d0 or  opmux_d1 when opmux_opcode = OPCodeOR else
				(others=>'0');
				end RTL;