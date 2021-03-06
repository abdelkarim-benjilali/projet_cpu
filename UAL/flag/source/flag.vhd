library ieee;
    use ieee.std_logic_1164.all;
    entity flag is
        port(flag_in:std_logic_vector(7 downto 0);
            flag_out:out std_logic);
     end flag;   
            architecture RTL of flag is 
            begin 
                flag_out<='1' when flag_in="00000000" else '0';
            end RTL;
