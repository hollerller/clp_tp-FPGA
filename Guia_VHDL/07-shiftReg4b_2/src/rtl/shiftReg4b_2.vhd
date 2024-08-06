library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shiftReg4b_2 is
    port (
        clk_i: in std_logic;
        in_i:  in std_logic;
        out_o: out std_logic
    );
end entity shiftReg4b_2;

architecture shiftReg4b_2_arch of shiftReg4b_2 is
        -- declarations

    signal aux: std_logic_vector(3 downto 0);   

begin
        -- behavior
    process(clk_i)
    begin
        if rising_edge(clk_i) then 
            aux(0) <= in_i;
            aux(3 downto 1) <= aux(2 downto 0);
        end if;
    end process;

    out_o <= aux(3);

end architecture;