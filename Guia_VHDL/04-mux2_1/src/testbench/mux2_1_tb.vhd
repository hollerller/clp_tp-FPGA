library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux2_1_tb is
end;

architecture mux2_1_tb_arch of mux2_1_tb is
        -- declarations
    component mux2_1 is
        port (
			a_i:  in std_logic;
			b_i:  in std_logic;
			sel_i: in std_logic;
			s_o:  out std_logic
        );
    end component mux2_1;

    signal a_tb:  std_logic := '0';
	signal b_tb:  std_logic := '0';
	signal sel_tb: std_logic := '0';
	signal s_tb:  std_logic;

begin
        -- behavior

	a_tb <= not a_tb after 10 ns, a_tb after 30 ns;
	b_tb <= not b_tb after 30 ns;
	sel_tb <= not sel_tb after 20 ns;
	
	DUT: mux2_1
		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			sel_i => sel_tb,
			s_o  => s_tb
		);            

end architecture;