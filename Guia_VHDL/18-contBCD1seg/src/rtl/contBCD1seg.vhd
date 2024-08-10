library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCD1seg is
    generic(
        N: natural := 4
    );
    port (
        ena_i: in std_logic;
        rst_i: in std_logic;
        clk_i: in std_logic;
        q_o:   out std_logic_vector(3 downto 0)
    );
end entity contBCD1seg;

architecture contBCD1seg_arch of contBCD1seg is
        -- declarations

    signal genEna_o: std_logic;
    signal bcdEna_i: std_logic;

begin
        -- behavior

    bcdEna_i <= ena_i and genEna_o; 

    contBCD1dig_inst: entity work.contBCD1dig
        port map(
            ena_i => bcdEna_i,
            rst_i => rst_i,
            clk_i => clk_i,
            q_o   => q_o
        );

    genEna_inst: entity work.genEna
        generic map(
            N => N
        )
        port map(
            rst_i => rst_i,
            clk_i => clk_i,
            s_o   => genEna_o
        );

end architecture;