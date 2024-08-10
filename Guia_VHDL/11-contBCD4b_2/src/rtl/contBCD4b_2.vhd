library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contBCD4b_2 is
    port (
        ena_i: in std_logic;
        rst_i: in std_logic;
        clk_i: in std_logic;
        q_o:   out std_logic_vector(3 downto 0)
    );
    
end entity contBCD4b_2;

architecture contBCD4b_2_arch of contBCD4b_2 is
        -- declarations

      signal aux: std_logic_vector(3 downto 0) := "0000";   

begin
        -- behavior

      process(clk_i)
      begin 
        if rising_edge(clk_i) then
          if rst_i = '1' then
            aux <= "0000";
          elsif ena_i = '1' then
            if aux = "1001" then
              aux <= "0000";
            else
            aux <= std_logic_vector(unsigned(aux) + 1);
            end if;
          end if; 
        end if;
      end process;

      q_o <= aux;

end architecture;