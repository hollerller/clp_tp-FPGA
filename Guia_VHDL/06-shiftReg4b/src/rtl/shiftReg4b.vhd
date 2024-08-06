library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shiftReg4b is
    port (
        clk_i: in std_logic;
        ena_i: in std_logic;
        rst_i: in std_logic;
        in_i:  in std_logic;
        out_o: out std_logic
    );
end entity shiftReg4b;

architecture shiftReg4b_arch of shiftReg4b is
        -- declarations

    signal aux: std_logic_vector(3 downto 0);

    component ffd is
        port (
            d_i:   in std_logic;
            ena_i: in std_logic;
            rst_i: in std_logic;
            clk_i: in std_logic;
            q_o:   out std_logic
        );
    end component ffd;        

begin
        -- behavior
    ffd_0: ffd
        port map(
            d_i   => in_i,
            ena_i => ena_i,
            rst_i => rst_i,            
            clk_i => clk_i,
            q_o   => aux(0)
        );

    ffd_1: ffd
        port map(
            d_i   => aux(0),
            ena_i => ena_i,
            rst_i => rst_i,            
            clk_i => clk_i,
            q_o   => aux(1)
        );

    ffd_2: ffd
        port map(
            d_i   => aux(1),
            ena_i => ena_i,
            rst_i => rst_i,            
            clk_i => clk_i,
            q_o   => aux(2)
        );

    ffd_3: ffd
        port map(
            d_i   => aux(2),
            ena_i => ena_i,
            rst_i => rst_i,            
            clk_i => clk_i,
            q_o   => aux(3)
        );

    out_o  <= aux(3);

end architecture;