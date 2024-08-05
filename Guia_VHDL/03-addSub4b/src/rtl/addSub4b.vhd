library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addSub4b is
    port (
        a_i:  in std_logic_vector(3 downto 0);
        b_i:  in std_logic_vector(3 downto 0);
        sr_i: in std_logic;
        s_o:  out std_logic_vector(3 downto 0);
        co_o: out std_logic 
    );
end entity addSub4b;

architecture addSub4b_arch of addSub4b is
        -- declarations
    signal aux:   std_logic_vector(4 downto 0);
    signal b_aux: std_logic_vector(3 downto 0);

    component add1b is
        port (
            a_i:  in std_logic;
            b_i:  in std_logic;
            ci_i: in std_logic;
            s_o:  out std_logic;
            co_o: out std_logic 
        );
    end component add1b;

begin
        -- behavior
    aux(0)   <= sr_i;
    b_aux(0) <= b_i(0) xor sr_i;
    b_aux(1) <= b_i(1) xor sr_i;
    b_aux(2) <= b_i(2) xor sr_i;
    b_aux(3) <= b_i(3) xor sr_i;
    co_o     <= aux(4);

    addSub4b_0: add1b
        port map(
            a_i  => a_i(0),
            b_i  => b_aux(0),
            ci_i => aux(0),
            s_o  => s_o(0),
            co_o => aux(1)
        );

    addSub4b_1: add1b
        port map(
            a_i  => a_i(1),
            b_i  => b_aux(1),
            ci_i => aux(1),
            s_o  => s_o(1),
            co_o => aux(2)
        );

    addSub4b_2: add1b
        port map(
            a_i  => a_i(2),
            b_i  => b_aux(2),
            ci_i => aux(2),
            s_o  => s_o(2),
            co_o => aux(3)
        );

    addSub4b_3: add1b
        port map(
            a_i  => a_i(3),
            b_i  => b_aux(3),
            ci_i => aux(3),
            s_o  => s_o(3),
            co_o => aux(4)
        );

end architecture;