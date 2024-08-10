library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCD4b_tb is
end;

architecture contBCD4b_tb_arch of contBCD4b_tb is
        -- declarations
	component contBCD4b is
		port (
			ena_i: in std_logic;
			rst_i: in std_logic;
			clk_i: in std_logic;
			q_o:   out std_logic_vector(3 downto 0)
		);
	end component contBCD4b;

	signal ena_tb: std_logic := '1';
	signal rst_tb: std_logic := '1';
	signal clk_tb: std_logic := '0';
	signal q_tb:   std_logic_vector(3 downto 0);

begin
        -- behavior
	ena_tb <= '0' after 220 ns, '1' after 300 ns;
	rst_tb <= '0' after 40 ns;
	clk_tb <= not clk_tb after 10 ns;

	DUT: contBCD4b
		port map(
			ena_i => ena_tb,
			rst_i => rst_tb,
			clk_i => clk_tb,
			q_o   => q_tb
		);            

end architecture;