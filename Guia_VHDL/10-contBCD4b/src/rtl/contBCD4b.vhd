library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCD4b is
    port (
        ena_i: in std_logic;
        rst_i: in std_logic;
        clk_i: in std_logic;
        q_o:   out std_logic_vector(3 downto 0)
    );
    
end entity contBCD4b;

architecture contBCD4b_arch of contBCD4b is
        -- declarations

        component ffd is
        port (
            d_i:   in std_logic;
            ena_i: in std_logic;
            rst_i: in std_logic;
            clk_i: in std_logic;
            q_o:   out std_logic
        );
    end component ffd;
   
     signal aux: std_logic_vector(3 downto 0);   
     signal auxAnd: std_logic_vector(2 downto 0);   
     signal aux_q: std_logic_vector(3 downto 0);

begin
        -- behavior
    auxAnd(0) <= aux_q(0) and ena_i;
    auxAnd(1) <= aux_q(1) and auxAnd(0);
    auxAnd(2) <= aux_q(2) and auxAnd(1);

    aux(0) <= ena_i xor aux_q(0);
    aux(1) <= aux_q(1) xor auxAnd(0);
    aux(2) <= aux_q(2) xor auxAnd(1);
    aux(3) <= aux_q(3) xor auxAnd(2);


    ffd1: ffd
    port map (
      d_i   => aux(0),
      ena_i => ena_i,
      rst_i => rst_i,
      clk_i => clk_i,
      q_o   => aux_q(0)
    );

    ffd0: ffd
    port map (
      d_i   => aux(1),
      ena_i => ena_i,
      rst_i => rst_i,
      clk_i => clk_i,
      q_o   => aux_q(1)
    );

    ffd2: ffd
    port map (
      d_i   => aux(2),
      ena_i => ena_i,
      rst_i => rst_i,
      clk_i => clk_i,
      q_o   => aux_q(2)
    );

    ffd3: ffd
    port map (
      d_i   => aux(3),
      ena_i => ena_i,
      rst_i => rst_i,
      clk_i => clk_i,
      q_o   => aux_q(3)
    );

    q_o <= aux_q;

end architecture;