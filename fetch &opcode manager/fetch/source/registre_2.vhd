library ieee;
    use ieee.std_logic_1164.all;
    
    entity registre_2 is 
    port(clk_reg_2:in std_logic;
        rst_reg_2:in std_logic;
        data_out_reg_2:buffer std_logic:='1');
    end registre_2;
    
    architecture RTL of registre_2 is 
    begin 
        process(clk_reg_2,rst_reg_2)
            begin 
                if(rst_reg_2='1') then
                    data_out_reg_2<='1';
                    elsif(rising_edge(clk_reg_2)) then
                    data_out_reg_2<=not data_out_reg_2;
                end if;
        end process;
    end RTL;