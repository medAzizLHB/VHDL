library ieee;
use ieee.std_logic_1164.all;

entity input_latch is
	port (
	a : in std_logic_vector(2 downto 0); -- data input
	le_bar : in std_logic; -- latch enable input (active low)
	a_lat : out std_logic_vector(2 downto 0) -- latch output
	);
end input_latch;


architecture behavioral of input_latch is
begin
	latch_behavior: process (a, le_bar) -- process sensitivity list
	begin
		if le_bar = '0' then -- if le_bar is low, then set input to output
			a_lat <= a;
		end if;
	end process latch_behavior;		
end behavioral;