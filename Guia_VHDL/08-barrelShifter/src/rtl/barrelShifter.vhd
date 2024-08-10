library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity barrelShifter is
    generic(
        N: natural := 4
    );  
    port (
        a_i:   in std_logic_vector(N-1 downto 0);
        des_i: in integer;
        s_o:   out std_logic_vector(N-1 downto 0)
    );
end entity barrelShifter;

architecture barrelShifter_arch of barrelShifter is
        -- declarations

begin
        -- behavior
    s_o <= std_logic_vector(unsigned(a_i) ror des_i);

end architecture;