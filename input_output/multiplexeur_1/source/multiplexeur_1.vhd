library ieee;
    use ieee.std_logic_1164.all;
    use work.Constants.all;
    
    entity multiplexeur_1_ioh is 
    port(dout_1:in std_logic_vector(7 downto 0);
        opcode_1:in std_logic_vector(4 downto 0);
        dbus_1: out std_logic_vector(15 downto 0));
    end multiplexeur_1_ioh;
     architecture RTL of multiplexeur_1_ioh is 
     begin
         dbus_1<="00000000" & dout_1 when opcode_1=OPCodeGET else (others=>'Z');
     end RTL;