library ieee;
    use ieee.std_logic_1164.all;
    
    entity registre_1 is 
    port(clk_reg_1:in std_logic;
        rst_reg_1:in std_logic;
        data_in_reg_1:in std_logic_vector(7 downto 0);
        data_out_reg_1:out std_logic_vector(7 downto 0):="00000000");
    end registre_1;
    
    architecture RTL of registre_1 is 
    begin 
        process(clk_reg_1,rst_reg_1)
            begin 
                if(rst_reg_1='1') then
                    data_out_reg_1<=(others=>'0');
                    elsif(rising_edge(clk_reg_1)) then
                    data_out_reg_1<=data_in_reg_1;
                end if;
        end process;
    end RTL;