library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add1b_tb is
end;

architecture add1b_tb_arch of add1b_tb is
        -- declarations
    component add1b is
        port (
            a_i:  in std_logic;
            b_i:  in std_logic;
            ci_i: in std_logic;
            s_o:  out std_logic;
            co_o: out std_logic 
        );
    end component add1b;

    signal a_tb:  std_logic := '0';
	signal b_tb:  std_logic := '0';
	signal ci_tb: std_logic := '0';
	signal s_tb:  std_logic;
	signal co_tb: std_logic;

begin
        -- behavior

	a_tb <= not a_tb after 10 ns;
	b_tb <= not b_tb after 20 ns;
	ci_tb <= not ci_tb after 40 ns;
	
	DUT: add1b
		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			ci_i => ci_tb,
			s_o  => s_tb,
			co_o => co_tb
		);            

end architecture;