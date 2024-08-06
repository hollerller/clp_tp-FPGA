library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity shiftReg4b_2_tb is
end;

architecture shiftReg4b_2_tb_arch of shiftReg4b_2_tb is
        -- declarations
	component shiftReg4b_2 is
		port (
			clk_i: in std_logic;
			in_i:  in std_logic;
			out_o: out std_logic
		);
	end component shiftReg4b_2;

	signal clk_tb: std_logic := '0';
	signal in_tb:  std_logic := '1';
	signal out_tb: std_logic;

begin
        -- behavior
	clk_tb <= not clk_tb after 5 ns;
	in_tb  <= '0' after 10 ns, '1' after 20 ns, '0' after 30 ns;

	DUT: shiftReg4b_2
		port map(
			clk_i => clk_tb,
			in_i  => in_tb,
			out_o => out_tb
		);            

end architecture;