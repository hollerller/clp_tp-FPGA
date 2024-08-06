library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ffd_tb is
end;

architecture ffd_tb_arch of ffd_tb is
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

    signal d_tb:   std_logic := '0';
	signal ena_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal clk_tb: std_logic := '0';
	signal q_tb:   std_logic;

begin
        -- behavior
	d_tb   <= '1' after 20 ns, '0' after 100 ns;
	ena_tb <= '1' after 60 ns;
	rst_tb <= '0' after 20 ns;
	clk_tb <= not clk_tb after 10 ns;

	DUT: ffd
		port map(
			d_i   => d_tb,
			ena_i => ena_tb,
			rst_i => rst_tb,
			clk_i => clk_tb,
			q_o   => q_tb
		);            

end architecture;