library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCDNb is
    generic(
        N: natural := 4
    );
    port (
        ena_i: in std_logic;
        rst_i: in std_logic;
        clk_i: in std_logic;
        q_o:   out std_logic_vector(N-1 downto 0)
    );
    
end entity contBCDNb;

architecture contBCDNb_arch of contBCDNb is
        -- declarations

      signal aux: std_logic_vector(N-1 downto 0) := (others => '0');   
      --signal max: std_logic_vector(N-1 downto 0) := (others => '1');
begin
        -- behavior

      process(clk_i)
      begin 
        if rising_edge(clk_i) then
          if rst_i = '1' then
            aux <= (others => '0');
          elsif ena_i = '1' then
            if unsigned(aux) > (2**N- 1) then
              aux <= (others => '0');
            else
            aux <= std_logic_vector(unsigned(aux) + 1);
            end if;
          end if; 
        end if;
      end process;

      q_o <= aux;

end architecture; 