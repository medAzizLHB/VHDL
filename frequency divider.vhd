library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_div is
	port(
		clk : in std_logic; -- clock
		rst_bar : in std_logic; -- synchronous reset
		divisor : in std_logic_vector(3 downto 0); -- divisor
		clk_dvd : out std_logic -- output
		);
end freq_div;

architecture behavior of freq_div is
begin
	f_div: process (clk) is -- everything is synchronous
		variable count : unsigned(3 downto 0); -- variable to hold count
	begin
		if rising_edge(clk) then -- only take action at a clock edge
			if rst_bar = '0' then -- reset
				count := unsigned(divisor);
				clk_dvd <= '0';
			else -- otherwise
				case count is
					when "0010" => -- if at 2, count down and set to high
						count := count - 1;
						clk_dvd <= '1';
					when "0001" => -- if at 1, reset and go to low, so output is high for one clk
						count := unsigned(divisor);
						clk_dvd <= '0';
					when others => -- for others, decrement count and output low
						count := count - 1;
						clk_dvd <= '0';
				end case;
			end if;
		end if;
	end process f_div;
end behavior;