library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add4b_tb is
end;

architecture add4b_tb_arch of add4b_tb is
        -- declarations
    component add4b is
        port (
			a_i:  in std_logic_vector(3 downto 0);
			b_i:  in std_logic_vector(3 downto 0);
			ci_i: in std_logic;
			s_o:  out std_logic_vector(3 downto 0);
			co_o: out std_logic 
        );
    end component add4b;

    signal a_tb:  std_logic_vector(3 downto 0) := "0000";
	signal b_tb:  std_logic_vector(3 downto 0) := "0011";
	signal ci_tb: std_logic := '0';
	signal s_tb:  std_logic_vector(3 downto 0);
	signal co_tb: std_logic;

begin
        -- behavior

	a_tb <= "0111" after 10 ns;
	b_tb <= "0110" after 20 ns;
	ci_tb <= '1'   after 40 ns;
	
	DUT: add4b
		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			ci_i => ci_tb,
			s_o  => s_tb,
			co_o => co_tb
		);            

end architecture;