library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCD1seg_tb is
end;

architecture contBCD1seg_tb_arch of contBCD1seg_tb is
        -- declarations
    component contBCD1seg is
		generic(
			N: natural := 4
		);
        port (
			ena_i: in std_logic;
			rst_i: in std_logic;
			clk_i: in std_logic;
			q_o:   out std_logic_vector(3 downto 0)
        );
    end component contBCD1seg;

	constant N_tb:   natural := 4;
	signal   ena_tb: std_logic := '0';
	signal   rst_tb: std_logic := '1';
	signal   clk_tb: std_logic := '0';
	signal   q_tb:   std_logic_vector(3 downto 0);

begin
        -- behavior

	ena_tb <= '1' after 20 ns;	
	rst_tb <= '0' after 20 ns;
	clk_tb <= not clk_tb after 4 ns;

	DUT: contBCD1seg
		generic map(
			N => N_tb
		)
		port map(
			ena_i => ena_tb,
			rst_i => rst_tb,
			clk_i => clk_tb,
			q_o   => q_tb
		);            

end architecture;