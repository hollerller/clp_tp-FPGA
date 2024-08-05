library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2_1 is
    port (
        a_i:  in std_logic;
        b_i:  in std_logic;
        sel_i: in std_logic;
        s_o:  out std_logic
    );
end entity mux2_1;

architecture mux2_1_arch of mux2_1 is
        -- declarations

begin
        -- behavior
    mux2_1_proc: process(a_i, b_i, sel_i)
    begin
        if (sel_i = '0') then
            s_o <= a_i;
        else 
            s_o <= b_i;
        end if;
    end process mux2_1_proc;

end architecture;