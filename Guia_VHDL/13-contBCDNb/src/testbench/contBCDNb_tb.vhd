library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCDNb_tb is
end;

architecture contBCDNb_tb_arch of contBCDNb_tb is
        -- declarations
	component contBCDNb is
		generic(
			N: natural := 4
		);
		port (
			ena_i: in std_logic;
			rst_i: in std_logic;
			clk_i: in std_logic;
			q_o:   out std_logic_vector(N-1 downto 0)
		);
	end component contBCDNb;

	constant N_tb: natural := 4;
	signal ena_tb: std_logic := '1';
	signal rst_tb: std_logic := '1';
	signal clk_tb: std_logic := '0';
	signal q_tb:   std_logic_vector(N_tb-1 downto 0);

begin
        -- behavior
	ena_tb <= '1' after 500 ns, '1' after 540 ns;
	rst_tb <= '0' after 40 ns;
	clk_tb <= not clk_tb after 10 ns;

	DUT: contBCDNb
		port map(
			ena_i => ena_tb,
			rst_i => rst_tb,
			clk_i => clk_tb,
			q_o   => q_tb
		);            

end architecture;