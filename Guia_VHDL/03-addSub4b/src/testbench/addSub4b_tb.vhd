library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity addSub4b_tb is
end;

architecture addSub4b_tb_arch of addSub4b_tb is
        -- declarations
    component addSub4b is
        port (
			a_i:  in std_logic_vector(3 downto 0);
			b_i:  in std_logic_vector(3 downto 0);
			sr_i: in std_logic;
			s_o:  out std_logic_vector(3 downto 0);
			co_o: out std_logic 
        );
    end component addSub4b;

    signal a_tb:  std_logic_vector(3 downto 0) := "0000";
	signal b_tb:  std_logic_vector(3 downto 0) := "0011";
	signal sr_tb: std_logic := '0';
	signal s_tb:  std_logic_vector(3 downto 0);
	signal co_tb: std_logic;

begin
        -- behavior

	a_tb <= "1010" after 10 ns, "0010" after 60 ns;
	b_tb <= "0110" after 20 ns;	
	sr_tb <= '1'   after 40 ns;

	DUT: addSub4b
		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			sr_i => sr_tb,
			s_o  => s_tb,
			co_o => co_tb
		);            

end architecture;