library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity barrelShifter_tb is
end;

architecture barrelShifter_tb_arch of barrelShifter_tb is
        -- declarations
	component barrelShifter is
		generic(
			N: natural := 4
		);
		port (
			a_i:   in std_logic_vector(N-1 downto 0);
			des_i: in integer;
			s_o:   out std_logic_vector(N-1 downto 0)
		);
	end component barrelShifter;

	constant N_tb: natural := 4;
	signal a_tb:   std_logic_vector(N_tb-1 downto 0) := "1100";
	signal des_tb: integer := 2;
	signal s_tb:   std_logic_vector(N_tb-1 downto 0);

begin
        -- behavior

	DUT: barrelShifter
		port map(
			a_i =>   a_tb,
			des_i => des_tb,
			s_o =>   s_tb
		);            

end architecture;