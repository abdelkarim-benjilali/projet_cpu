library ieee;
    use ieee.std_logic_1164.all;
    use work.Constants.all;
 entity mux_tb is 
 end mux_tb;
 architecture RTL of mux_tb is 
 component mux port(pc_mux,opdata_mux: in std_logic_vector(7 downto 0);
        opcode_mux:in std_logic_vector(4 downto 0);
        fetch_mux,flag0_mux,flag1_mux: in std_logic;
        mux_out:out std_logic_vector(7 downto 0):="00000000");
    end component;
 signal pc_mux,opdata_mux,mux_out:  std_logic_vector(7 downto 0);
 signal fetch_mux,flag0_mux,flag1_mux: std_logic;
 signal opcode_mux: std_logic_vector(4 downto 0);
 begin 
     u0:mux port map(pc_mux,opdata_mux,opcode_mux,fetch_mux,flag0_mux,flag1_mux,mux_out);
     process 
         begin 
             pc_mux<="11110000";
             opdata_mux<="00001111";
             fetch_mux<='1';
             flag0_mux<='0';
             flag1_mux<='0';
             opcode_mux<="00000";
             wait for 20 ns;
             flag1_mux<='1';
             opcode_mux<=OPCodeGOTO;
             wait for 10 ns;
             fetch_mux<='0';
             wait for 10 ns;
             flag1_mux<='0';
             opcode_mux<="00000";
             wait for 10 ns;
         end process;
     end RTL;