library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NCO_tb is
end;

architecture NCO_tb_arch of NCO_tb is
        -- declarations
    component NCO is
        port (
			clk_i: in std_logic;
			rst_i: in std_logic;
			pha_i: in std_logic_vector(15 downto 0);
			q_o:   out std_logic_vector(11 downto 0)
        );
    end component NCO;

	signal   clk_tb: std_logic := '0';
	signal   rst_tb: std_logic := '1';
	signal   pha_tb: std_logic_vector(15 downto 0) := "0011101100001110";
	signal   q_tb:   std_logic_vector(11 downto 0);

begin
        -- behavior

	clk_tb <= not clk_tb after 10 ns;		
	rst_tb <= '0' after 20 ns;

	DUT: NCO
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			pha_i => pha_tb,
			q_o   => q_tb
		);            

end architecture;